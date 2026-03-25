// Mistake Tracker Models

class MistakeEntry {
  final String questionId;
  final String question;
  final String correctAnswer;
  final String userAnswer;
  final String topic;
  final String difficulty;
  final String source; // 'mock_test', 'practice', 'pattern'
  final DateTime timestamp;
  int repeatCount;
  bool resolved;

  MistakeEntry({
    required this.questionId,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
    required this.topic,
    required this.difficulty,
    required this.source,
    required this.timestamp,
    this.repeatCount = 1,
    this.resolved = false,
  });

  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'question': question,
        'correctAnswer': correctAnswer,
        'userAnswer': userAnswer,
        'topic': topic,
        'difficulty': difficulty,
        'source': source,
        'timestamp': timestamp.toIso8601String(),
        'repeatCount': repeatCount,
        'resolved': resolved,
      };

  factory MistakeEntry.fromJson(Map<String, dynamic> json) {
    return MistakeEntry(
      questionId: json['questionId'] ?? '',
      question: json['question'] ?? '',
      correctAnswer: json['correctAnswer'] ?? '',
      userAnswer: json['userAnswer'] ?? '',
      topic: json['topic'] ?? '',
      difficulty: json['difficulty'] ?? 'Easy',
      source: json['source'] ?? 'mock_test',
      timestamp:
          DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
      repeatCount: json['repeatCount'] ?? 1,
      resolved: json['resolved'] ?? false,
    );
  }
}
