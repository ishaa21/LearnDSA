import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/aptitude.dart';

class AptitudeProvider with ChangeNotifier {
  List<AptitudeSection> _sections = [];
  List<AptitudeSection> get sections => _sections;

  AptitudeProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final jsonStr = await rootBundle.loadString('assets/data/aptitude_topics.json');
      final data = jsonDecode(jsonStr);
      _sections = (data['sections'] as List).map((s) => AptitudeSection.fromJson(s)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading aptitude topics: $e');
    }
  }

  List<AptitudeTopic> searchTopics(String query) {
    if (query.isEmpty) return [];
    final lowerQuery = query.toLowerCase();
    List<AptitudeTopic> results = [];
    for (final section in _sections) {
      for (final topic in section.topics) {
        if (topic.name.toLowerCase().contains(lowerQuery) ||
            topic.description.toLowerCase().contains(lowerQuery)) {
          results.add(topic);
        }
      }
    }
    return results;
  }

  int get totalTopics {
    int count = 0;
    for (final s in _sections) {
      count += s.topics.length;
    }
    return count;
  }
}
