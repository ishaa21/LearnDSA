class SubTopic {
  final String name;
  final String practice;

  SubTopic({required this.name, required this.practice});

  factory SubTopic.fromJson(dynamic json) {
    if (json is String) {
      return SubTopic(name: json, practice: "Explore Challenge");
    }
    return SubTopic(
      name: json['name'],
      practice: json['practice'] ?? "Explore Challenge",
    );
  }
}

class Topic {
  final String name;
  final List<SubTopic> subtopics;
  final String? description;
  final String? realWorldApplication;
  final String? algorithm;
  final String? timeComplexity;
  final List<String>? prerequisites;

  Topic({
    required this.name,
    required this.subtopics,
    this.description,
    this.realWorldApplication,
    this.algorithm,
    this.timeComplexity,
    this.prerequisites,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      name: json['name'],
      subtopics: (json['subtopics'] as List).map((s) => SubTopic.fromJson(s)).toList(),
      description: json['description'],
      realWorldApplication: json['realWorldApps'],
      algorithm: json['algorithm'],
      timeComplexity: json['timeComplexity'],
      prerequisites: json['prerequisites'] != null ? List<String>.from(json['prerequisites']) : null,
    );
  }
}

