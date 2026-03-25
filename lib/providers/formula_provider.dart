import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/formula.dart';

class FormulaProvider with ChangeNotifier {
  List<FormulaCategory> _categories = [];
  Set<String> _bookmarkedFormulas = {};
  String _searchQuery = '';

  List<FormulaCategory> get categories => _categories;
  Set<String> get bookmarkedFormulas => _bookmarkedFormulas;
  String get searchQuery => _searchQuery;

  FormulaProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadFormulas();
    await _loadBookmarks();
  }

  Future<void> _loadFormulas() async {
    try {
      final jsonStr =
          await rootBundle.loadString('assets/data/formulas.json');
      final data = jsonDecode(jsonStr);
      _categories = (data['categories'] as List)
          .map((c) => FormulaCategory.fromJson(c))
          .toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading formulas: $e');
    }
  }

  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    _bookmarkedFormulas =
        (prefs.getStringList('formulaBookmarks') ?? []).toSet();
    notifyListeners();
  }

  Future<void> toggleBookmark(String formulaKey) async {
    if (_bookmarkedFormulas.contains(formulaKey)) {
      _bookmarkedFormulas.remove(formulaKey);
    } else {
      _bookmarkedFormulas.add(formulaKey);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'formulaBookmarks', _bookmarkedFormulas.toList());
    notifyListeners();
  }

  bool isBookmarked(String formulaKey) =>
      _bookmarkedFormulas.contains(formulaKey);

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  /// Search across all formulas
  List<MapEntry<FormulaCategory, List<Formula>>> searchFormulas(
      String query) {
    if (query.isEmpty) return [];
    final lowerQuery = query.toLowerCase();
    List<MapEntry<FormulaCategory, List<Formula>>> results = [];

    for (final category in _categories) {
      List<Formula> matches = [];
      for (final topic in category.topics) {
        for (final formula in topic.formulas) {
          if (formula.title.toLowerCase().contains(lowerQuery) ||
              formula.formula.toLowerCase().contains(lowerQuery) ||
              formula.description.toLowerCase().contains(lowerQuery) ||
              topic.name.toLowerCase().contains(lowerQuery)) {
            matches.add(formula);
          }
        }
      }
      if (matches.isNotEmpty) {
        results.add(MapEntry(category, matches));
      }
    }
    return results;
  }

  /// Get bookmarked formulas across all categories
  List<Formula> getBookmarkedFormulas() {
    List<Formula> result = [];
    for (final category in _categories) {
      for (final topic in category.topics) {
        for (final formula in topic.formulas) {
          final key = '${category.id}_${topic.name}_${formula.title}';
          if (_bookmarkedFormulas.contains(key)) {
            result.add(formula);
          }
        }
      }
    }
    return result;
  }

  /// Get all formulas as flat list for flashcard mode
  List<Formula> getAllFormulas() {
    List<Formula> all = [];
    for (final category in _categories) {
      for (final topic in category.topics) {
        all.addAll(topic.formulas);
      }
    }
    return all;
  }
}
