import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/leaderboard_entry.dart';

class LeaderboardProvider with ChangeNotifier {
  List<LeaderboardEntry> _entries = [];
  List<AchievementBadge> _badges = [];

  List<LeaderboardEntry> get entries => _entries;
  List<AchievementBadge> get badges => _badges;

  LeaderboardProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    final entriesJson = prefs.getString('leaderboardEntries');
    if (entriesJson != null) {
      final List<dynamic> decoded = jsonDecode(entriesJson);
      _entries =
          decoded.map((e) => LeaderboardEntry.fromJson(e)).toList();
    }

    final badgesJson = prefs.getString('badges');
    if (badgesJson != null) {
      final List<dynamic> decoded = jsonDecode(badgesJson);
      _badges = decoded.map((b) => AchievementBadge.fromJson(b)).toList();
    } else {
      _initBadges();
    }

    notifyListeners();
  }

  void _initBadges() {
    _badges = [
      AchievementBadge(
        id: 'first_test',
        name: 'First Steps',
        description: 'Complete your first mock test',
        icon: '🎯',
      ),
      AchievementBadge(
        id: 'consistency_king',
        name: 'Consistency King',
        description: 'Complete 5 tests in a row',
        icon: '👑',
      ),
      AchievementBadge(
        id: 'speed_solver',
        name: 'Speed Solver',
        description: 'Complete a test with avg <30s per question',
        icon: '⚡',
      ),
      AchievementBadge(
        id: 'accuracy_master',
        name: 'Accuracy Master',
        description: 'Achieve 90%+ accuracy in any test',
        icon: '🎯',
      ),
      AchievementBadge(
        id: 'perfect_score',
        name: 'Perfect Score',
        description: 'Get 100% in any test',
        icon: '💯',
      ),
      AchievementBadge(
        id: 'ten_tests',
        name: 'Test Warrior',
        description: 'Complete 10 mock tests',
        icon: '⚔️',
      ),
      AchievementBadge(
        id: 'hard_mode',
        name: 'Hard Mode Hero',
        description: 'Score 70%+ on a Hard difficulty test',
        icon: '🔥',
      ),
      AchievementBadge(
        id: 'all_sections',
        name: 'All-Rounder',
        description: 'Attempt tests from all sections',
        icon: '🌟',
      ),
    ];
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'leaderboardEntries',
      jsonEncode(_entries.map((e) => e.toJson()).toList()),
    );
    await prefs.setString(
      'badges',
      jsonEncode(_badges.map((b) => b.toJson()).toList()),
    );
  }

  /// Add entry and check badges
  Future<void> addEntry(LeaderboardEntry entry) async {
    _entries.add(entry);
    _checkBadges(entry);
    await _save();
    notifyListeners();
  }

  void _checkBadges(LeaderboardEntry latest) {
    // First Steps
    _awardBadge('first_test');

    // Consistency King - 5 tests
    if (_entries.length >= 5) {
      _awardBadge('consistency_king');
    }

    // Speed Solver - avg < 30s
    final avgTime = latest.totalQuestions > 0
        ? latest.timeSeconds / latest.totalQuestions
        : 999;
    if (avgTime < 30 && latest.totalQuestions >= 5) {
      _awardBadge('speed_solver');
    }

    // Accuracy Master - 90%+
    if (latest.accuracy >= 90) {
      _awardBadge('accuracy_master');
    }

    // Perfect Score
    if (latest.accuracy >= 100) {
      _awardBadge('perfect_score');
    }

    // Test Warrior - 10 tests
    if (_entries.length >= 10) {
      _awardBadge('ten_tests');
    }

    // All-Rounder - all sections attempted
    final sections = _entries.map((e) => e.sectionName).toSet();
    if (sections.length >= 4) {
      _awardBadge('all_sections');
    }
  }

  void _awardBadge(String badgeId) {
    final index = _badges.indexWhere((b) => b.id == badgeId);
    if (index != -1 && !_badges[index].earned) {
      _badges[index] = AchievementBadge(
        id: _badges[index].id,
        name: _badges[index].name,
        description: _badges[index].description,
        icon: _badges[index].icon,
        earned: true,
        earnedAt: DateTime.now(),
      );
    }
  }

  /// Get best score overall
  LeaderboardEntry? get bestScore {
    if (_entries.isEmpty) return null;
    return _entries.reduce(
        (a, b) => a.accuracy >= b.accuracy ? a : b);
  }

  /// Get recent scores
  List<LeaderboardEntry> getRecent({int limit = 10}) {
    final sorted = List<LeaderboardEntry>.from(_entries)
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return sorted.take(limit).toList();
  }

  /// Get top scores
  List<LeaderboardEntry> getTopScores({int limit = 10}) {
    final sorted = List<LeaderboardEntry>.from(_entries)
      ..sort((a, b) => b.accuracy.compareTo(a.accuracy));
    return sorted.take(limit).toList();
  }

  /// Get earned badges
  List<AchievementBadge> get earnedBadges =>
      _badges.where((b) => b.earned).toList();

  /// Get total tests taken
  int get totalTests => _entries.length;

  /// Get average accuracy
  double get averageAccuracy {
    if (_entries.isEmpty) return 0;
    return _entries.map((e) => e.accuracy).reduce((a, b) => a + b) /
        _entries.length;
  }

  /// Clear all
  Future<void> clearAll() async {
    _entries.clear();
    _initBadges();
    await _save();
    notifyListeners();
  }
}
