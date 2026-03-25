// Study Plan Models

class StudyDay {
  final int day;
  final String title;
  final List<String> tasks;
  final String topic;

  StudyDay({
    required this.day,
    required this.title,
    required this.tasks,
    required this.topic,
  });

  factory StudyDay.fromJson(Map<String, dynamic> json) {
    return StudyDay(
      day: json['day'] ?? 0,
      title: json['title'] ?? '',
      tasks: List<String>.from(json['tasks'] ?? []),
      topic: json['topic'] ?? '',
    );
  }
}

class StudyPlan {
  final String id;
  final String name;
  final String description;
  final int duration;
  final String icon;
  final String color;
  final List<StudyDay> days;

  StudyPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.icon,
    required this.color,
    required this.days,
  });

  factory StudyPlan.fromJson(Map<String, dynamic> json) {
    return StudyPlan(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      duration: json['duration'] ?? 0,
      icon: json['icon'] ?? '',
      color: json['color'] ?? '#7C3AED',
      days: (json['days'] as List? ?? [])
          .map((d) => StudyDay.fromJson(d))
          .toList(),
    );
  }
}

// Career Roadmap Models

class RoadmapItem {
  final String title;
  final String description;
  final String status; // required, optional

  RoadmapItem({
    required this.title,
    required this.description,
    required this.status,
  });

  factory RoadmapItem.fromJson(Map<String, dynamic> json) {
    return RoadmapItem(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? 'required',
    );
  }
}

class RoadmapStage {
  final String name;
  final List<RoadmapItem> items;

  RoadmapStage({required this.name, required this.items});

  factory RoadmapStage.fromJson(Map<String, dynamic> json) {
    return RoadmapStage(
      name: json['name'] ?? '',
      items: (json['items'] as List? ?? [])
          .map((i) => RoadmapItem.fromJson(i))
          .toList(),
    );
  }
}

class CareerRoadmap {
  final String id;
  final String title;
  final String description;
  final String icon;
  final String color;
  final List<RoadmapStage> stages;
  final List<String> skills;
  final String salaryRange;
  final List<String> companies;

  CareerRoadmap({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.stages,
    required this.skills,
    required this.salaryRange,
    required this.companies,
  });

  factory CareerRoadmap.fromJson(Map<String, dynamic> json) {
    return CareerRoadmap(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      color: json['color'] ?? '#7C3AED',
      stages: (json['stages'] as List? ?? [])
          .map((s) => RoadmapStage.fromJson(s))
          .toList(),
      skills: List<String>.from(json['skills'] ?? []),
      salaryRange: json['salaryRange'] ?? '',
      companies: List<String>.from(json['companies'] ?? []),
    );
  }
}

class ResumeSection {
  final String name;
  final List<String> bullets;

  ResumeSection({required this.name, required this.bullets});

  factory ResumeSection.fromJson(Map<String, dynamic> json) {
    return ResumeSection(
      name: json['name'] ?? '',
      bullets: List<String>.from(json['bullets'] ?? []),
    );
  }
}

class ResumeTemplate {
  final String id;
  final String title;
  final List<ResumeSection> sections;

  ResumeTemplate({
    required this.id,
    required this.title,
    required this.sections,
  });

  factory ResumeTemplate.fromJson(Map<String, dynamic> json) {
    return ResumeTemplate(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      sections: (json['sections'] as List? ?? [])
          .map((s) => ResumeSection.fromJson(s))
          .toList(),
    );
  }
}
