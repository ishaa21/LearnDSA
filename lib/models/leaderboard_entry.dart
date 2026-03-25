// Leaderboard Models

class LeaderboardEntry {
  final String testId;
  final String sectionName;
  final int score;
  final int totalQuestions;
  final double accuracy;
  final int timeSeconds;
  final DateTime timestamp;

  LeaderboardEntry({
    required this.testId,
    required this.sectionName,
    required this.score,
    required this.totalQuestions,
    required this.accuracy,
    required this.timeSeconds,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'testId': testId,
        'sectionName': sectionName,
        'score': score,
        'totalQuestions': totalQuestions,
        'accuracy': accuracy,
        'timeSeconds': timeSeconds,
        'timestamp': timestamp.toIso8601String(),
      };

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntry(
      testId: json['testId'] ?? '',
      sectionName: json['sectionName'] ?? '',
      score: json['score'] ?? 0,
      totalQuestions: json['totalQuestions'] ?? 0,
      accuracy: (json['accuracy'] ?? 0).toDouble(),
      timeSeconds: json['timeSeconds'] ?? 0,
      timestamp:
          DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
    );
  }
}

class AchievementBadge {
  final String id;
  final String name;
  final String description;
  final String icon;
  final bool earned;
  final DateTime? earnedAt;

  AchievementBadge({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    this.earned = false,
    this.earnedAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'icon': icon,
        'earned': earned,
        'earnedAt': earnedAt?.toIso8601String(),
      };

  factory AchievementBadge.fromJson(Map<String, dynamic> json) {
    return AchievementBadge(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      earned: json['earned'] ?? false,
      earnedAt: json['earnedAt'] != null
          ? DateTime.tryParse(json['earnedAt'])
          : null,
    );
  }
}
