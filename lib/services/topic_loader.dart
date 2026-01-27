import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/topics.dart';

Future<List<Topic>> loadTopics() async {
  final data = await rootBundle.loadString('assets/data/topics.json');
  final decoded = jsonDecode(data);

  return (decoded['topics'] as List)
      .map((e) => Topic.fromJson(e))
      .toList();
}
