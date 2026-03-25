// Formula & Shortcut Bank Models

class Formula {
  final String title;
  final String formula;
  final String description;
  final String example;

  Formula({
    required this.title,
    required this.formula,
    required this.description,
    required this.example,
  });

  factory Formula.fromJson(Map<String, dynamic> json) {
    return Formula(
      title: json['title'] ?? '',
      formula: json['formula'] ?? '',
      description: json['description'] ?? '',
      example: json['example'] ?? '',
    );
  }
}

class FormulaTopic {
  final String name;
  final List<Formula> formulas;

  FormulaTopic({required this.name, required this.formulas});

  factory FormulaTopic.fromJson(Map<String, dynamic> json) {
    return FormulaTopic(
      name: json['name'] ?? '',
      formulas: (json['formulas'] as List? ?? [])
          .map((f) => Formula.fromJson(f))
          .toList(),
    );
  }
}

class FormulaCategory {
  final String id;
  final String name;
  final String icon;
  final String color;
  final List<FormulaTopic> topics;

  FormulaCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.topics,
  });

  factory FormulaCategory.fromJson(Map<String, dynamic> json) {
    return FormulaCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      color: json['color'] ?? '#7C3AED',
      topics: (json['topics'] as List? ?? [])
          .map((t) => FormulaTopic.fromJson(t))
          .toList(),
    );
  }
}
