import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/mistake.dart';

class MistakeProvider with ChangeNotifier {
  List<MistakeEntry> _mistakes = [];

  List<MistakeEntry> get mistakes => _mistakes;

  MistakeProvider() {
    _loadMistakes();
  }

  Future<void> _loadMistakes() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('mistakes');
    if (json != null) {
      final List<dynamic> decoded = jsonDecode(json);
      _mistakes = decoded.map((m) => MistakeEntry.fromJson(m)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveMistakes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'mistakes',
      jsonEncode(_mistakes.map((m) => m.toJson()).toList()),
    );
  }

  /// Add a mistake. If same question was already wrong, increment repeat count.
  Future<void> addMistake(MistakeEntry mistake) async {
    final existingIndex =
        _mistakes.indexWhere((m) => m.questionId == mistake.questionId);
    if (existingIndex != -1) {
      _mistakes[existingIndex].repeatCount++;
      _mistakes[existingIndex].resolved = false;
    } else {
      _mistakes.add(mistake);
    }
    await _saveMistakes();
    notifyListeners();
  }

  /// Mark a mistake as resolved (user got it right on retry)
  Future<void> resolveMistake(String questionId) async {
    final index =
        _mistakes.indexWhere((m) => m.questionId == questionId);
    if (index != -1) {
      _mistakes[index].resolved = true;
    }
    await _saveMistakes();
    notifyListeners();
  }

  /// Remove a mistake entry
  Future<void> removeMistake(String questionId) async {
    _mistakes.removeWhere((m) => m.questionId == questionId);
    await _saveMistakes();
    notifyListeners();
  }

  /// Get mistakes by topic
  List<MistakeEntry> getByTopic(String topic) {
    return _mistakes.where((m) => m.topic == topic).toList();
  }

  /// Get mistakes by difficulty
  List<MistakeEntry> getByDifficulty(String difficulty) {
    return _mistakes.where((m) => m.difficulty == difficulty).toList();
  }

  /// Get unresolved mistakes
  List<MistakeEntry> getUnresolved() {
    return _mistakes.where((m) => !m.resolved).toList();
  }

  /// Get repeated mistakes (appeared more than once)
  List<MistakeEntry> getRepeatedMistakes() {
    return _mistakes.where((m) => m.repeatCount > 1).toList();
  }

  /// Get topics sorted by mistake count (most mistakes first)
  List<MapEntry<String, int>> getTopicMistakeCounts() {
    Map<String, int> counts = {};
    for (final m in _mistakes) {
      counts[m.topic] = (counts[m.topic] ?? 0) + 1;
    }
    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted;
  }

  /// Improvement stats
  Map<String, dynamic> getImprovementStats() {
    final total = _mistakes.length;
    final resolved = _mistakes.where((m) => m.resolved).length;
    final repeated = _mistakes.where((m) => m.repeatCount > 1).length;
    final unresolvedCount = total - resolved;

    return {
      'total': total,
      'resolved': resolved,
      'repeated': repeated,
      'unresolved': unresolvedCount,
      'resolutionRate': total > 0 ? (resolved / total * 100) : 0.0,
    };
  }

  /// Clear all mistakes
  Future<void> clearAll() async {
    _mistakes.clear();
    await _saveMistakes();
    notifyListeners();
  }
}
