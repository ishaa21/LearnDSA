import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProgressProvider with ChangeNotifier {
  Set<String> _bookmarkedTopics = {};
  Set<String> _bookmarkedSubtopics = {};
  
  // Progress tracking
  Set<String> _openedTopics = {};
  Set<String> _openedSubtopics = {};
  Set<String> _openedPractices = {};

  Set<String> get bookmarkedTopics => _bookmarkedTopics;
  Set<String> get bookmarkedSubtopics => _bookmarkedSubtopics;
  Set<String> get openedTopics => _openedTopics;
  Set<String> get openedSubtopics => _openedSubtopics;
  Set<String> get openedPractices => _openedPractices;

  UserProgressProvider() {
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    _bookmarkedTopics = (prefs.getStringList('bookmarkedTopics') ?? []).toSet();
    _bookmarkedSubtopics = (prefs.getStringList('bookmarkedSubtopics') ?? []).toSet();
    
    _openedTopics = (prefs.getStringList('openedTopics') ?? []).toSet();
    _openedSubtopics = (prefs.getStringList('openedSubtopics') ?? []).toSet();
    _openedPractices = (prefs.getStringList('openedPractices') ?? []).toSet();
    
    notifyListeners();
  }

  // --- BOOKMARKS ---

  Future<void> toggleTopicBookmark(String topicName) async {
    if (_bookmarkedTopics.contains(topicName)) {
      _bookmarkedTopics.remove(topicName);
    } else {
      _bookmarkedTopics.add(topicName);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bookmarkedTopics', _bookmarkedTopics.toList());
    notifyListeners();
  }

  Future<void> toggleSubtopicBookmark(String subtopicId) async {
    if (_bookmarkedSubtopics.contains(subtopicId)) {
      _bookmarkedSubtopics.remove(subtopicId);
    } else {
      _bookmarkedSubtopics.add(subtopicId);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bookmarkedSubtopics', _bookmarkedSubtopics.toList());
    notifyListeners();
  }

  bool isTopicBookmarked(String topicName) => _bookmarkedTopics.contains(topicName);
  bool isSubtopicBookmarked(String subtopicId) => _bookmarkedSubtopics.contains(subtopicId);

  // --- PROGRESS ---

  Future<void> recordTopicOpened(String topicName) async {
    if (!_openedTopics.contains(topicName)) {
      _openedTopics.add(topicName);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('openedTopics', _openedTopics.toList());
      notifyListeners();
    }
  }

  Future<void> recordSubtopicOpened(String subtopicId) async {
    if (!_openedSubtopics.contains(subtopicId)) {
      _openedSubtopics.add(subtopicId);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('openedSubtopics', _openedSubtopics.toList());
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

  // Legacy support or internal helper (if needed)
  bool isCompleted(String subtopicId) => _openedSubtopics.contains(subtopicId);
  void markCompleted(String subtopicId) => recordSubtopicOpened(subtopicId);

  Future<void> resetAll() async {
    _bookmarkedTopics.clear();
    _bookmarkedSubtopics.clear();
    _openedTopics.clear();
    _openedSubtopics.clear();
    _openedPractices.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }
}
