// Aptitude Topic Models

class AptitudeExample {
  final String question;
  final String solution;

  AptitudeExample({required this.question, required this.solution});

  factory AptitudeExample.fromJson(Map<String, dynamic> json) {
    return AptitudeExample(
      question: json['question'] ?? '',
      solution: json['solution'] ?? '',
    );
  }
}

class AptitudeTopic {
  final String id;
  final String name;
  final String description;
  final List<String> keyPoints;
  final List<String> formulas;
  final AptitudeExample? example;

  AptitudeTopic({
    required this.id,
    required this.name,
    required this.description,
    required this.keyPoints,
    required this.formulas,
    this.example,
  });

  factory AptitudeTopic.fromJson(Map<String, dynamic> json) {
    return AptitudeTopic(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      keyPoints: List<String>.from(json['keyPoints'] ?? []),
      formulas: List<String>.from(json['formulas'] ?? []),
      example: json['example'] != null ? AptitudeExample.fromJson(json['example']) : null,
    );
  }
}

class AptitudeSection {
  final String id;
  final String name;
  final String icon;
  final String emoji;
  final String color;
  final List<AptitudeTopic> topics;

  AptitudeSection({
    required this.id,
    required this.name,
    required this.icon,
    required this.emoji,
    required this.color,
    required this.topics,
  });

  factory AptitudeSection.fromJson(Map<String, dynamic> json) {
    return AptitudeSection(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      emoji: json['emoji'] ?? '',
      color: json['color'] ?? '#7C3AED',
      topics: (json['topics'] as List? ?? []).map((t) => AptitudeTopic.fromJson(t)).toList(),
    );
  }
}
