// Interview Prep Models

class InterviewQuestion {
  final String id;
  final String question;
  final String answer;
  final String difficulty;
  final List<String> tags;

  InterviewQuestion({
    required this.id,
    required this.question,
    required this.answer,
    required this.difficulty,
    required this.tags,
  });

  factory InterviewQuestion.fromJson(Map<String, dynamic> json) {
    return InterviewQuestion(
      id: json['id'] ?? '',
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
      difficulty: json['difficulty'] ?? 'Easy',
      tags: List<String>.from(json['tags'] ?? []),
    );
  }
}

class InterviewSubcategory {
  final String name;
  final List<InterviewQuestion> questions;

  InterviewSubcategory({required this.name, required this.questions});

  factory InterviewSubcategory.fromJson(Map<String, dynamic> json) {
    return InterviewSubcategory(
      name: json['name'] ?? '',
      questions: (json['questions'] as List? ?? [])
          .map((q) => InterviewQuestion.fromJson(q))
          .toList(),
    );
  }
}

class InterviewCategory {
  final String id;
  final String name;
  final String icon;
  final String color;
  final List<InterviewSubcategory> subcategories;

  InterviewCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.subcategories,
  });

  factory InterviewCategory.fromJson(Map<String, dynamic> json) {
    return InterviewCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      color: json['color'] ?? '#7C3AED',
      subcategories: (json['subcategories'] as List? ?? [])
          .map((s) => InterviewSubcategory.fromJson(s))
          .toList(),
    );
  }
}

class InterviewTip {
  final String id;
  final String category;
  final String title;
  final String content;

  InterviewTip({
    required this.id,
    required this.category,
    required this.title,
    required this.content,
  });

  factory InterviewTip.fromJson(Map<String, dynamic> json) {
    return InterviewTip(
      id: json['id'] ?? '',
      category: json['category'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
