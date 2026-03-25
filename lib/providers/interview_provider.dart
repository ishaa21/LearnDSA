import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/interview_question.dart';

class InterviewProvider with ChangeNotifier {
  List<InterviewCategory> _categories = [];
  List<InterviewTip> _tips = [];
  Set<String> _favorites = {};

  List<InterviewCategory> get categories => _categories;
  List<InterviewTip> get tips => _tips;
  Set<String> get favorites => _favorites;

  InterviewProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final jsonStr =
          await rootBundle.loadString('assets/data/interview_prep.json');
      final data = jsonDecode(jsonStr);
      _categories = (data['categories'] as List)
          .map((c) => InterviewCategory.fromJson(c))
          .toList();
      _tips = (data['tips'] as List? ?? [])
          .map((t) => InterviewTip.fromJson(t))
          .toList();
    } catch (e) {
      debugPrint('Error loading interview data: $e');
    }

    final prefs = await SharedPreferences.getInstance();
    _favorites =
        (prefs.getStringList('interviewFavorites') ?? []).toSet();
    notifyListeners();
  }

  Future<void> toggleFavorite(String questionId) async {
    if (_favorites.contains(questionId)) {
      _favorites.remove(questionId);
    } else {
      _favorites.add(questionId);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'interviewFavorites', _favorites.toList());
    notifyListeners();
  }

  bool isFavorite(String questionId) =>
      _favorites.contains(questionId);

  /// Get all favorite questions
  List<InterviewQuestion> getFavorites() {
    List<InterviewQuestion> result = [];
    for (final cat in _categories) {
      for (final sub in cat.subcategories) {
        for (final q in sub.questions) {
          if (_favorites.contains(q.id)) {
            result.add(q);
          }
        }
      }
    }
    return result;
  }

  /// Search questions
  List<InterviewQuestion> search(String query) {
    if (query.isEmpty) return [];
    final lower = query.toLowerCase();
    List<InterviewQuestion> results = [];
    for (final cat in _categories) {
      for (final sub in cat.subcategories) {
        for (final q in sub.questions) {
          if (q.question.toLowerCase().contains(lower) ||
              q.answer.toLowerCase().contains(lower) ||
              q.tags.any((t) => t.toLowerCase().contains(lower))) {
            results.add(q);
          }
        }
      }
    }
    return results;
  }
}
