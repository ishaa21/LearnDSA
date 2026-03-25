import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/study_plan.dart';

class StudyPlanProvider with ChangeNotifier {
  List<StudyPlan> _plans = [];
  String? _activePlanId;
  int _activePlanStartDay = 0; // which day the user is on
  Map<String, Set<String>> _completedTasks = {}; // dayKey -> set of task indices
  Map<String, bool> _completedDays = {}; // dayKey -> completed

  List<StudyPlan> get plans => _plans;
  String? get activePlanId => _activePlanId;
  int get activePlanStartDay => _activePlanStartDay;

  StudyPlanProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadPlans();
    await _loadProgress();
  }

  Future<void> _loadPlans() async {
    try {
      final jsonStr =
          await rootBundle.loadString('assets/data/study_plans.json');
      final data = jsonDecode(jsonStr);
      _plans = (data['plans'] as List)
          .map((p) => StudyPlan.fromJson(p))
          .toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading study plans: $e');
    }
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    _activePlanId = prefs.getString('activePlanId');
    _activePlanStartDay = prefs.getInt('activePlanStartDay') ?? 0;

    final tasksJson = prefs.getString('studyCompletedTasks');
    if (tasksJson != null) {
      final Map<String, dynamic> decoded = jsonDecode(tasksJson);
      _completedTasks = decoded.map(
        (k, v) => MapEntry(k, Set<String>.from(v as List)),
      );
    }

    final daysJson = prefs.getString('studyCompletedDays');
    if (daysJson != null) {
      final Map<String, dynamic> decoded = jsonDecode(daysJson);
      _completedDays = decoded.map((k, v) => MapEntry(k, v as bool));
    }

    notifyListeners();
  }

  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    if (_activePlanId != null) {
      await prefs.setString('activePlanId', _activePlanId!);
    } else {
      await prefs.remove('activePlanId');
    }
    await prefs.setInt('activePlanStartDay', _activePlanStartDay);
    await prefs.setString(
      'studyCompletedTasks',
      jsonEncode(_completedTasks.map((k, v) => MapEntry(k, v.toList()))),
    );
    await prefs.setString(
      'studyCompletedDays',
      jsonEncode(_completedDays),
    );
  }

  StudyPlan? get activePlan {
    if (_activePlanId == null) return null;
    return _plans.cast<StudyPlan?>().firstWhere(
          (p) => p?.id == _activePlanId,
          orElse: () => null,
        );
  }

  /// Start a plan
  Future<void> startPlan(String planId) async {
    _activePlanId = planId;
    _activePlanStartDay = 1;
    _completedTasks.clear();
    _completedDays.clear();
    await _saveProgress();
    notifyListeners();
  }

  /// Toggle task completion
  Future<void> toggleTask(int day, int taskIndex) async {
    final key = '${_activePlanId}_$day';
    _completedTasks[key] ??= {};

    final taskStr = taskIndex.toString();
    if (_completedTasks[key]!.contains(taskStr)) {
      _completedTasks[key]!.remove(taskStr);
    } else {
      _completedTasks[key]!.add(taskStr);
    }

    // Check if all tasks for the day are completed
    final plan = activePlan;
    if (plan != null) {
      final dayData = plan.days.firstWhere((d) => d.day == day,
          orElse: () => StudyDay(day: 0, title: '', tasks: [], topic: ''));
      if (dayData.tasks.isNotEmpty) {
        final allDone = dayData.tasks.asMap().keys.every(
              (i) => _completedTasks[key]!.contains(i.toString()),
            );
        _completedDays[key] = allDone;
      }
    }

    await _saveProgress();
    notifyListeners();
  }

  bool isTaskCompleted(int day, int taskIndex) {
    final key = '${_activePlanId}_$day';
    return _completedTasks[key]?.contains(taskIndex.toString()) ?? false;
  }

  bool isDayCompleted(int day) {
    final key = '${_activePlanId}_$day';
    return _completedDays[key] ?? false;
  }

  /// Get overall progress percentage
  double getProgress() {
    final plan = activePlan;
    if (plan == null) return 0;

    int totalTasks = 0;
    int completedCount = 0;

    for (final day in plan.days) {
      totalTasks += day.tasks.length;
      final key = '${_activePlanId}_${day.day}';
      completedCount += (_completedTasks[key]?.length ?? 0);
    }

    return totalTasks == 0 ? 0 : completedCount / totalTasks;
  }

  /// Get number of completed days
  int getCompletedDays() {
    return _completedDays.values.where((v) => v).length;
  }

  /// Get current day (auto-advance if previous days done)
  int getCurrentDay() {
    final plan = activePlan;
    if (plan == null) return 1;

    for (final day in plan.days) {
      if (!isDayCompleted(day.day)) return day.day;
    }
    return plan.days.length;
  }

  /// Adjust plan for skipped days
  List<StudyDay> getAdjustedPlan() {
    final plan = activePlan;
    if (plan == null) return [];

    List<StudyDay> adjusted = [];
    List<StudyDay> skipped = [];

    for (final day in plan.days) {
      if (isDayCompleted(day.day)) {
        adjusted.add(day);
      } else {
        final key = '${_activePlanId}_${day.day}';
        final partiallyDone =
            (_completedTasks[key]?.isNotEmpty ?? false);
        if (!partiallyDone && day.day < getCurrentDay()) {
          skipped.add(day);
        } else {
          adjusted.add(day);
        }
      }
    }

    // Add skipped days' tasks to upcoming days
    // (simplified: just append skipped tasks to current day's description)
    return plan.days;
  }

  /// Stop/reset active plan
  Future<void> stopPlan() async {
    _activePlanId = null;
    _activePlanStartDay = 0;
    await _saveProgress();
    notifyListeners();
  }
}
