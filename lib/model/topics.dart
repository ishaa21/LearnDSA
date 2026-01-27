class Topic {
  final String name;
  final List<String> subtopics;
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
      subtopics: List<String>.from(json['subtopics']),
      description: json['description'],
      realWorldApplication: json['realWorldApps'],
      algorithm: json['algorithm'],
      timeComplexity: json['timeComplexity'],
      prerequisites: json['prerequisites'] != null ? List<String>.from(json['prerequisites']) : null,
    );
  }
}
