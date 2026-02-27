import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProgressProvider with ChangeNotifier {
  // ─── Bookmarks ───────────────────────────────────────────────────────────
  Set<String> _bookmarkedTopics = {};
  Set<String> _bookmarkedSubtopics = {};

  // ─── Progress ────────────────────────────────────────────────────────────
  Set<String> _openedTopics = {};
  Set<String> _openedSubtopics = {};
  Set<String> _openedPractices = {};
  Set<String> _completedSubtopics = {};
  Set<String> _weakTopics = {};
  Set<String> _revisionTopics = {};

  // ─── Pattern Mode ─────────────────────────────────────────────────────────
  Map<String, Set<String>> _patternCompleted = {};
  Map<String, int> _patternWrongCount = {};

  // ─── Notes ───────────────────────────────────────────────────────────────
  Map<String, String> _notes = {};

  // ─── Streak ──────────────────────────────────────────────────────────────
  int _streakDays = 0;
  String _lastActiveDate = '';

  // ─── Daily Practice ──────────────────────────────────────────────────────
  String _lastPracticeDate = '';
  List<String> _todayPracticeIds = [];

  // ─── Total subtopics (set from outside for completion % calc) ────────────
  int totalSubtopics = 0;

  // ─── Getters ─────────────────────────────────────────────────────────────
  Set<String> get bookmarkedTopics => _bookmarkedTopics;
  Set<String> get bookmarkedSubtopics => _bookmarkedSubtopics;
  Set<String> get openedTopics => _openedTopics;
  Set<String> get openedSubtopics => _openedSubtopics;
  Set<String> get openedPractices => _openedPractices;
  Set<String> get completedSubtopics => _completedSubtopics;
  Set<String> get weakTopics => _weakTopics;
  Set<String> get revisionTopics => _revisionTopics;
  Map<String, String> get notes => _notes;

  // ─── Pattern getters ─────────────────────────────────────────────────────
  Map<String, Set<String>> get patternCompleted => _patternCompleted;
  Map<String, int> get patternWrongCount => _patternWrongCount;

  int patternCompletedCount(String pattern) =>
      (_patternCompleted[pattern] ?? {}).length;

  bool isPatternQuestionDone(String pattern, String questionId) =>
      (_patternCompleted[pattern] ?? {}).contains(questionId);

  double patternMastery(String pattern, int totalQuestions) {
    if (totalQuestions == 0) return 0.0;
    return (patternCompletedCount(pattern) / totalQuestions).clamp(0.0, 1.0);
  }

  bool isWeakPattern(String pattern) {
    final wrong = _patternWrongCount[pattern] ?? 0;
    final done = patternCompletedCount(pattern);
    if (done == 0) return false;
    return (wrong / done) > 0.5; // >50% wrong answers
  }

  List<String> get weakPatterns {
    return _patternWrongCount.entries
        .where((e) => isWeakPattern(e.key))
        .map((e) => e.key)
        .toList();
  }
  int get streakDays => _streakDays;
  List<String> get todayPracticeIds => _todayPracticeIds;

  double get completionPercentage {
    if (totalSubtopics == 0) return 0.0;
    return (_completedSubtopics.length / totalSubtopics).clamp(0.0, 1.0);
  }

  // ─── Constructor ─────────────────────────────────────────────────────────
  UserProgressProvider() {
    _loadProgress();
  }

  // ─── Load ─────────────────────────────────────────────────────────────────
  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    _bookmarkedTopics = (prefs.getStringList('bookmarkedTopics') ?? []).toSet();
    _bookmarkedSubtopics =
        (prefs.getStringList('bookmarkedSubtopics') ?? []).toSet();
    _openedTopics = (prefs.getStringList('openedTopics') ?? []).toSet();
    _openedSubtopics = (prefs.getStringList('openedSubtopics') ?? []).toSet();
    _openedPractices = (prefs.getStringList('openedPractices') ?? []).toSet();
    _completedSubtopics =
        (prefs.getStringList('completedSubtopics') ?? []).toSet();
    _weakTopics = (prefs.getStringList('weakTopics') ?? []).toSet();
    _revisionTopics = (prefs.getStringList('revisionTopics') ?? []).toSet();

    final notesJson = prefs.getString('notes');
    if (notesJson != null) {
      final Map<String, dynamic> decoded = jsonDecode(notesJson);
      _notes = decoded.map((k, v) => MapEntry(k, v.toString()));
    }

    _streakDays = prefs.getInt('streakDays') ?? 0;
    _lastActiveDate = prefs.getString('lastActiveDate') ?? '';
    _lastPracticeDate = prefs.getString('lastPracticeDate') ?? '';
    _todayPracticeIds =
        (prefs.getStringList('todayPracticeIds') ?? []).toList();

    // Pattern mode
    final patternCompletedJson = prefs.getString('patternCompleted');
    if (patternCompletedJson != null) {
      final Map<String, dynamic> decoded = jsonDecode(patternCompletedJson);
      _patternCompleted = decoded.map(
        (k, v) => MapEntry(k, Set<String>.from(v as List)),
      );
    }
    final patternWrongJson = prefs.getString('patternWrongCount');
    if (patternWrongJson != null) {
      final Map<String, dynamic> decoded = jsonDecode(patternWrongJson);
      _patternWrongCount = decoded.map((k, v) => MapEntry(k, v as int));
    }

    _updateStreak();
    notifyListeners();
  }

  // ─── Streak ──────────────────────────────────────────────────────────────
  void _updateStreak() async {
    final today = _dateKey(DateTime.now());
    if (_lastActiveDate == today) return;

    final yesterday = _dateKey(DateTime.now().subtract(const Duration(days: 1)));
    if (_lastActiveDate == yesterday) {
      _streakDays++;
    } else if (_lastActiveDate != today) {
      _streakDays = 1;
    }
    _lastActiveDate = today;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('streakDays', _streakDays);
    await prefs.setString('lastActiveDate', _lastActiveDate);
  }

  String _dateKey(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';

  // ─── Bookmarks ───────────────────────────────────────────────────────────
  Future<void> toggleTopicBookmark(String topicName) async {
    _bookmarkedTopics.contains(topicName)
        ? _bookmarkedTopics.remove(topicName)
        : _bookmarkedTopics.add(topicName);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bookmarkedTopics', _bookmarkedTopics.toList());
    notifyListeners();
  }

  Future<void> toggleSubtopicBookmark(String subtopicId) async {
    _bookmarkedSubtopics.contains(subtopicId)
        ? _bookmarkedSubtopics.remove(subtopicId)
        : _bookmarkedSubtopics.add(subtopicId);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'bookmarkedSubtopics', _bookmarkedSubtopics.toList());
    notifyListeners();
  }

  bool isTopicBookmarked(String topicName) =>
      _bookmarkedTopics.contains(topicName);
  bool isSubtopicBookmarked(String subtopicId) =>
      _bookmarkedSubtopics.contains(subtopicId);

  // ─── Progress ────────────────────────────────────────────────────────────
  Future<void> recordTopicOpened(String topicName) async {
    if (!_openedTopics.contains(topicName)) {
      _openedTopics.add(topicName);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('openedTopics', _openedTopics.toList());
      notifyListeners();
    }
  }

  Future<void> recordSubtopicOpened(String subtopicId) async {
    bool changed = false;
    if (!_openedSubtopics.contains(subtopicId)) {
      _openedSubtopics.add(subtopicId);
      changed = true;
    }
    if (!_completedSubtopics.contains(subtopicId)) {
      _completedSubtopics.add(subtopicId);
      changed = true;
    }
    if (changed) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('openedSubtopics', _openedSubtopics.toList());
      await prefs.setStringList(
          'completedSubtopics', _completedSubtopics.toList());
      notifyListeners();
    }
  }

  Future<void> recordPracticeOpened(String subtopicId) async {
    if (!_openedPractices.contains(subtopicId)) {
      _openedPractices.add(subtopicId);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('openedPractices', _openedPractices.toList());
      notifyListeners();
    }
  }

  // ─── Weak / Revision ─────────────────────────────────────────────────────
  Future<void> toggleWeakTopic(String topicName) async {
    _weakTopics.contains(topicName)
        ? _weakTopics.remove(topicName)
        : _weakTopics.add(topicName);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('weakTopics', _weakTopics.toList());
    notifyListeners();
  }

  Future<void> toggleRevisionTopic(String topicName) async {
    _revisionTopics.contains(topicName)
        ? _revisionTopics.remove(topicName)
        : _revisionTopics.add(topicName);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('revisionTopics', _revisionTopics.toList());
    notifyListeners();
  }

  bool isWeakTopic(String topicName) => _weakTopics.contains(topicName);
  bool isRevisionTopic(String topicName) => _revisionTopics.contains(topicName);

  // ─── Notes ───────────────────────────────────────────────────────────────
  String getNote(String subtopicId) => _notes[subtopicId] ?? '';

  Future<void> saveNote(String subtopicId, String content) async {
    _notes[subtopicId] = content;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('notes', jsonEncode(_notes));
    notifyListeners();
  }

  // ─── Daily Practice ──────────────────────────────────────────────────────
  bool get hasTodayPractice {
    return _lastPracticeDate == _dateKey(DateTime.now()) &&
        _todayPracticeIds.isNotEmpty;
  }

  Future<void> setTodayPractice(List<String> ids) async {
    _lastPracticeDate = _dateKey(DateTime.now());
    _todayPracticeIds = ids;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastPracticeDate', _lastPracticeDate);
    await prefs.setStringList('todayPracticeIds', _todayPracticeIds);
    notifyListeners();
  }

  // ─── Pattern Mode ─────────────────────────────────────────────────────────
  Future<void> markPatternQuestionDone(
      String pattern, String questionId, bool wasCorrect) async {
    _patternCompleted[pattern] ??= {};
    _patternCompleted[pattern]!.add(questionId);
    if (!wasCorrect) {
      _patternWrongCount[pattern] = (_patternWrongCount[pattern] ?? 0) + 1;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'patternCompleted',
      jsonEncode(_patternCompleted
          .map((k, v) => MapEntry(k, v.toList()))),
    );
    await prefs.setString('patternWrongCount', jsonEncode(_patternWrongCount));
    notifyListeners();
  }

  Future<void> resetPatternProgress(String pattern) async {
    _patternCompleted.remove(pattern);
    _patternWrongCount.remove(pattern);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'patternCompleted',
      jsonEncode(_patternCompleted
          .map((k, v) => MapEntry(k, v.toList()))),
    );
    await prefs.setString('patternWrongCount', jsonEncode(_patternWrongCount));
    notifyListeners();
  }

  // ─── Legacy helpers ───────────────────────────────────────────────────────
  bool isCompleted(String subtopicId) =>
      _completedSubtopics.contains(subtopicId);
  void markCompleted(String subtopicId) => recordSubtopicOpened(subtopicId);

  // ─── Export / Import ─────────────────────────────────────────────────────
  Map<String, dynamic> exportData() {
    return {
      'exportedAt': DateTime.now().toIso8601String(),
      'streakDays': _streakDays,
      'lastActiveDate': _lastActiveDate,
      'bookmarkedTopics': _bookmarkedTopics.toList(),
      'bookmarkedSubtopics': _bookmarkedSubtopics.toList(),
      'openedTopics': _openedTopics.toList(),
      'openedSubtopics': _openedSubtopics.toList(),
      'openedPractices': _openedPractices.toList(),
      'completedSubtopics': _completedSubtopics.toList(),
      'weakTopics': _weakTopics.toList(),
      'revisionTopics': _revisionTopics.toList(),
      'notes': _notes,
    };
  }

  Future<void> importData(Map<String, dynamic> data) async {
    _streakDays = data['streakDays'] ?? 0;
    _lastActiveDate = data['lastActiveDate'] ?? '';
    _bookmarkedTopics = List<String>.from(data['bookmarkedTopics'] ?? []).toSet();
    _bookmarkedSubtopics =
        List<String>.from(data['bookmarkedSubtopics'] ?? []).toSet();
    _openedTopics = List<String>.from(data['openedTopics'] ?? []).toSet();
    _openedSubtopics =
        List<String>.from(data['openedSubtopics'] ?? []).toSet();
    _openedPractices =
        List<String>.from(data['openedPractices'] ?? []).toSet();
    _completedSubtopics =
        List<String>.from(data['completedSubtopics'] ?? []).toSet();
    _weakTopics = List<String>.from(data['weakTopics'] ?? []).toSet();
    _revisionTopics =
        List<String>.from(data['revisionTopics'] ?? []).toSet();
    if (data['notes'] != null) {
      final Map<String, dynamic> n = data['notes'];
      _notes = n.map((k, v) => MapEntry(k, v.toString()));
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('streakDays', _streakDays);
    await prefs.setString('lastActiveDate', _lastActiveDate);
    await prefs.setStringList('bookmarkedTopics', _bookmarkedTopics.toList());
    await prefs.setStringList(
        'bookmarkedSubtopics', _bookmarkedSubtopics.toList());
    await prefs.setStringList('openedTopics', _openedTopics.toList());
    await prefs.setStringList('openedSubtopics', _openedSubtopics.toList());
    await prefs.setStringList('openedPractices', _openedPractices.toList());
    await prefs.setStringList(
        'completedSubtopics', _completedSubtopics.toList());
    await prefs.setStringList('weakTopics', _weakTopics.toList());
    await prefs.setStringList('revisionTopics', _revisionTopics.toList());
    await prefs.setString('notes', jsonEncode(_notes));
    notifyListeners();
  }

  // ─── Reset ────────────────────────────────────────────────────────────────
  Future<void> resetAll() async {
    _bookmarkedTopics.clear();
    _bookmarkedSubtopics.clear();
    _openedTopics.clear();
    _openedSubtopics.clear();
    _openedPractices.clear();
    _completedSubtopics.clear();
    _weakTopics.clear();
    _revisionTopics.clear();
    _notes.clear();
    _streakDays = 0;
    _lastActiveDate = '';
    _lastPracticeDate = '';
    _todayPracticeIds.clear();
    _patternCompleted.clear();
    _patternWrongCount.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }
}
