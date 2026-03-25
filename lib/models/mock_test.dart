// Mock Test Models

class MockTestQuestion {
  final String id;
  final String topic;
  final String difficulty;
  final String question;
  final List<String> options;
  final int correct;
  final String hint;
  final String solution;
  final int timeLimit; // seconds per question

  MockTestQuestion({
    required this.id,
    required this.topic,
    required this.difficulty,
    required this.question,
    required this.options,
    required this.correct,
    required this.hint,
    required this.solution,
    this.timeLimit = 60,
  });

  factory MockTestQuestion.fromJson(Map<String, dynamic> json) {
    return MockTestQuestion(
      id: json['id'] ?? '',
      topic: json['topic'] ?? '',
      difficulty: json['difficulty'] ?? 'Easy',
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      correct: json['correct'] ?? 0,
      hint: json['hint'] ?? '',
      solution: json['solution'] ?? '',
      timeLimit: json['timeLimit'] ?? 60,
    );
  }
}

class MockTestSection {
  final String id;
  final String name;
  final String icon;
  final List<MockTestQuestion> questions;

  MockTestSection({
    required this.id,
    required this.name,
    required this.icon,
    required this.questions,
  });

  factory MockTestSection.fromJson(Map<String, dynamic> json) {
    return MockTestSection(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      questions: (json['questions'] as List? ?? [])
          .map((q) => MockTestQuestion.fromJson(q))
          .toList(),
    );
  }
}

class TestAttempt {
  final String testId;
  final String sectionId;
  final String sectionName;
  final String difficulty;
  final DateTime timestamp;
  final int totalQuestions;
  final int correctAnswers;
  final int totalTimeSeconds;
  final Map<String, int> topicCorrect; // topic -> correct count
  final Map<String, int> topicTotal; // topic -> total count
  final List<String> wrongQuestionIds;
  final Map<String, int> timePerQuestion; // questionId -> seconds

  TestAttempt({
    required this.testId,
    required this.sectionId,
    required this.sectionName,
    required this.difficulty,
    required this.timestamp,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.totalTimeSeconds,
    required this.topicCorrect,
    required this.topicTotal,
    required this.wrongQuestionIds,
    required this.timePerQuestion,
  });

  double get accuracy =>
      totalQuestions == 0 ? 0 : (correctAnswers / totalQuestions) * 100;

  double get avgTimePerQuestion =>
      totalQuestions == 0 ? 0 : totalTimeSeconds / totalQuestions;

  Map<String, dynamic> toJson() => {
        'testId': testId,
        'sectionId': sectionId,
        'sectionName': sectionName,
        'difficulty': difficulty,
        'timestamp': timestamp.toIso8601String(),
        'totalQuestions': totalQuestions,
        'correctAnswers': correctAnswers,
        'totalTimeSeconds': totalTimeSeconds,
        'topicCorrect': topicCorrect,
        'topicTotal': topicTotal,
        'wrongQuestionIds': wrongQuestionIds,
        'timePerQuestion': timePerQuestion,
      };

  factory TestAttempt.fromJson(Map<String, dynamic> json) {
    return TestAttempt(
      testId: json['testId'] ?? '',
      sectionId: json['sectionId'] ?? '',
      sectionName: json['sectionName'] ?? '',
      difficulty: json['difficulty'] ?? 'Easy',
      timestamp:
          DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
      totalQuestions: json['totalQuestions'] ?? 0,
      correctAnswers: json['correctAnswers'] ?? 0,
      totalTimeSeconds: json['totalTimeSeconds'] ?? 0,
      topicCorrect: Map<String, int>.from(json['topicCorrect'] ?? {}),
      topicTotal: Map<String, int>.from(json['topicTotal'] ?? {}),
      wrongQuestionIds: List<String>.from(json['wrongQuestionIds'] ?? []),
      timePerQuestion: Map<String, int>.from(json['timePerQuestion'] ?? {}),
    );
  }
}
