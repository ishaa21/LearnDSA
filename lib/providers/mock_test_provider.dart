import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/mock_test.dart';
import '../models/mistake.dart';

class MockTestProvider with ChangeNotifier {
  List<MockTestSection> _sections = [];
  List<TestAttempt> _history = [];
  Map<String, double> _topicAccuracy = {};

  List<MockTestSection> get sections => _sections;
  List<TestAttempt> get history => _history;
  Map<String, double> get topicAccuracy => _topicAccuracy;

  MockTestProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadSections();
    await _loadHistory();
    _computeTopicAccuracy();
  }

  Future<void> _loadSections() async {
    try {
      final jsonStr =
          await rootBundle.loadString('assets/data/mock_tests.json');
      final data = jsonDecode(jsonStr);
      _sections = (data['sections'] as List)
          .map((s) => MockTestSection.fromJson(s))
          .toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading mock tests: $e');
    }
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = prefs.getString('mockTestHistory');
    if (historyJson != null) {
      final List<dynamic> decoded = jsonDecode(historyJson);
      _history = decoded.map((h) => TestAttempt.fromJson(h)).toList();
      notifyListeners();
    }
  }

  void _computeTopicAccuracy() {
    _topicAccuracy.clear();
    Map<String, int> topicCorrectTotal = {};
    Map<String, int> topicQuestionTotal = {};

    for (final attempt in _history) {
      attempt.topicCorrect.forEach((topic, correct) {
        topicCorrectTotal[topic] =
            (topicCorrectTotal[topic] ?? 0) + correct;
      });
      attempt.topicTotal.forEach((topic, total) {
        topicQuestionTotal[topic] =
            (topicQuestionTotal[topic] ?? 0) + total;
      });
    }

    topicQuestionTotal.forEach((topic, total) {
      if (total > 0) {
        _topicAccuracy[topic] =
            ((topicCorrectTotal[topic] ?? 0) / total) * 100;
      }
    });
  }

  /// Generate questions based on difficulty and optional section filter
  List<MockTestQuestion> generateTest({
    required String sectionId,
    required String difficulty,
    int count = 10,
  }) {
    final section = _sections.firstWhere(
      (s) => s.id == sectionId,
      orElse: () => _sections.first,
    );

    List<MockTestQuestion> pool;
    if (difficulty == 'Mixed') {
      pool = List.from(section.questions);
    } else {
      pool = section.questions
          .where((q) => q.difficulty == difficulty)
          .toList();
    }

    // Smart: prioritize weak topics
    if (_topicAccuracy.isNotEmpty) {
      pool.sort((a, b) {
        final accA = _topicAccuracy[a.topic] ?? 50;
        final accB = _topicAccuracy[b.topic] ?? 50;
        return accA.compareTo(accB); // weaker topics first
      });
    }

    pool.shuffle();
    return pool.take(count).toList();
  }

  /// Adjust difficulty based on recent performance
  String suggestDifficulty(String sectionId) {
    final sectionAttempts =
        _history.where((h) => h.sectionId == sectionId).toList();
    if (sectionAttempts.isEmpty) return 'Easy';

    final recent = sectionAttempts.last;
    if (recent.accuracy >= 80) return 'Hard';
    if (recent.accuracy >= 50) return 'Medium';
    return 'Easy';
  }

  /// Save a completed test attempt
  Future<void> saveAttempt(TestAttempt attempt) async {
    _history.add(attempt);
    _computeTopicAccuracy();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'mockTestHistory',
      jsonEncode(_history.map((h) => h.toJson()).toList()),
    );
    notifyListeners();
  }

  /// Get weak topics based on test history
  List<String> getWeakTopics() {
    return _topicAccuracy.entries
        .where((e) => e.value < 50)
        .map((e) => e.key)
        .toList();
  }

  /// Get best score for a section
  TestAttempt? getBestScore(String sectionId) {
    final attempts =
        _history.where((h) => h.sectionId == sectionId).toList();
    if (attempts.isEmpty) return null;
    attempts.sort((a, b) => b.accuracy.compareTo(a.accuracy));
    return attempts.first;
  }

  /// Get recent attempts
  List<TestAttempt> getRecentAttempts({int limit = 10}) {
    final sorted = List<TestAttempt>.from(_history)
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return sorted.take(limit).toList();
  }

  /// Clear history
  Future<void> clearHistory() async {
    _history.clear();
    _topicAccuracy.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('mockTestHistory');
    notifyListeners();
  }
}
