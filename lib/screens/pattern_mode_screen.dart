import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../providers/user_progress_provider.dart';
import '../theme.dart';
import '../widgets/app_drawer.dart';
import 'pattern_detail_screen.dart';

// ── Data Model ───────────────────────────────────────────────────────────────

class PatternInfo {
  final String name;
  final String icon;
  final String description;
  final List<String> whenToUse;
  final List<String> commonTraps;
  final String timeComplexity;
  final String spaceComplexity;
  final Color color;

  const PatternInfo({
    required this.name,
    required this.icon,
    required this.description,
    required this.whenToUse,
    required this.commonTraps,
    required this.timeComplexity,
    required this.spaceComplexity,
    required this.color,
  });

  factory PatternInfo.fromJson(String name, Map<String, dynamic> j) {
    final hexStr = (j['color'] as String? ?? '#4FC3F7').replaceAll('#', '');
    final colorVal = int.parse('FF$hexStr', radix: 16);
    return PatternInfo(
      name: name,
      icon: j['icon'] ?? '🧩',
      description: j['description'] ?? '',
      whenToUse: List<String>.from(j['when_to_use'] ?? []),
      commonTraps: List<String>.from(j['common_traps'] ?? []),
      timeComplexity: j['time_complexity_idea'] ?? '',
      spaceComplexity: j['space_complexity_idea'] ?? '',
      color: Color(colorVal),
    );
  }
}

class PatternQuestion {
  final String id;
  final String title;
  final String pattern;
  final String difficulty;
  final String question;
  final String hint;
  final String solution;

  const PatternQuestion({
    required this.id,
    required this.title,
    required this.pattern,
    required this.difficulty,
    required this.question,
    required this.hint,
    required this.solution,
  });

  factory PatternQuestion.fromJson(Map<String, dynamic> j) {
    return PatternQuestion(
      id: j['id'] ?? '',
      title: j['title'] ?? '',
      pattern: j['pattern'] ?? '',
      difficulty: j['difficulty'] ?? 'Medium',
      question: j['question'] ?? '',
      hint: j['hint'] ?? '',
      solution: j['solution'] ?? '',
    );
  }
}

// ── Screen ───────────────────────────────────────────────────────────────────

class PatternModeScreen extends StatefulWidget {
  const PatternModeScreen({super.key});

  @override
  State<PatternModeScreen> createState() => _PatternModeScreenState();
}

class _PatternModeScreenState extends State<PatternModeScreen> {
  List<PatternInfo> patterns = [];
  Map<String, List<PatternQuestion>> questionsByPattern = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final patternRaw =
        await rootBundle.loadString('assets/data/patterns.json');
    final questionsRaw =
        await rootBundle.loadString('assets/data/pattern_questions.json');

    final Map<String, dynamic> patternData = jsonDecode(patternRaw);
    final List<dynamic> questionsData = jsonDecode(questionsRaw);

    final allQuestions = questionsData
        .map((q) => PatternQuestion.fromJson(q as Map<String, dynamic>))
        .toList();

    final Map<String, List<PatternQuestion>> byPattern = {};
    for (final q in allQuestions) {
      byPattern.putIfAbsent(q.pattern, () => []).add(q);
    }

    final loadedPatterns = patternData.entries
        .map((e) =>
            PatternInfo.fromJson(e.key, e.value as Map<String, dynamic>))
        .toList();

    if (!mounted) return;
    setState(() {
      patterns = loadedPatterns;
      questionsByPattern = byPattern;
      isLoading = false;
    });
  }

  int _easyCount(String pattern) =>
      (questionsByPattern[pattern] ?? [])
          .where((q) => q.difficulty == 'Easy')
          .length;

  int _mediumCount(String pattern) =>
      (questionsByPattern[pattern] ?? [])
          .where((q) => q.difficulty == 'Medium')
          .length;

  int _hardCount(String pattern) =>
      (questionsByPattern[pattern] ?? [])
          .where((q) => q.difficulty == 'Hard')
          .length;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(activeItem: DrawerItem.patternMode),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text(
          'Pattern Mode',
          style: GoogleFonts.outfit(
              fontWeight: FontWeight.bold, color: textMain),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<UserProgressProvider>(
              builder: (context, progress, _) {
                return ListView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
                  children: [
                    // ── Header ─────────────────────────────────────────────
                    _buildHeader(textMain, textSub, accentColor, progress),
                    const SizedBox(height: 24),

                    // ── Weak Patterns Alert ────────────────────────────────
                    if (progress.weakPatterns.isNotEmpty) ...[
                      _buildWeakPatternsAlert(
                          progress, textMain, textSub, isDark),
                      const SizedBox(height: 20),
                    ],

                    // ── Pattern Cards ──────────────────────────────────────
                    Text(
                      'All Patterns',
                      style: GoogleFonts.outfit(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: textMain,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...patterns.asMap().entries.map((entry) {
                      final i = entry.key;
                      final p = entry.value;
                      final qs = questionsByPattern[p.name] ?? [];
                      return _PatternCard(
                        pattern: p,
                        questions: qs,
                        easyCount: _easyCount(p.name),
                        mediumCount: _mediumCount(p.name),
                        hardCount: _hardCount(p.name),
                        progress: progress,
                        isDark: isDark,
                        textMain: textMain,
                        textSub: textSub,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PatternDetailScreen(
                              pattern: p,
                              questions: qs,
                            ),
                          ),
                        ),
                      ).animate(delay: (i * 50).ms).fadeIn().slideY(
                            begin: 0.08,
                            end: 0,
                            duration: 350.ms,
                            curve: Curves.easeOut,
                          );
                    }),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildHeader(Color textMain, Color textSub, Color accent,
      UserProgressProvider progress) {
    final total =
        questionsByPattern.values.fold(0, (s, q) => s + q.length);
    final done = progress.patternCompleted.values
        .fold(0, (s, set) => s + set.length);
    final pct = total == 0 ? 0.0 : done / total;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF7C3AED).withOpacity(0.85),
            const Color(0xFF4C1D95),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C3AED).withOpacity(0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🧩', style: TextStyle(fontSize: 36)),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pattern-Based Learning',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Master algorithms by their underlying patterns',
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Overall Mastery',
                          style: GoogleFonts.inter(
                              fontSize: 12, color: Colors.white70),
                        ),
                        Text(
                          '$done / $total solved',
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: pct,
                        minHeight: 8,
                        backgroundColor: Colors.white24,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _HeaderStat(
                  value: '${patterns.length}', label: 'Patterns'),
              const SizedBox(width: 16),
              _HeaderStat(value: '$total', label: 'Questions'),
              const SizedBox(width: 16),
              _HeaderStat(
                  value: '${progress.weakPatterns.length}',
                  label: 'Weak'),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 450.ms);
  }

  Widget _buildWeakPatternsAlert(UserProgressProvider progress, Color textMain,
      Color textSub, bool isDark) {
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.warning.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('⚠️', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text(
                'Needs More Practice',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  color: AppColors.warning,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: progress.weakPatterns
                .map((p) => _DiffBadge(
                    label: p,
                    color: AppColors.warning))
                .toList(),
          ),
        ],
      ),
    );
  }
}

// ── Pattern Card ─────────────────────────────────────────────────────────────

class _PatternCard extends StatelessWidget {
  final PatternInfo pattern;
  final List<PatternQuestion> questions;
  final int easyCount;
  final int mediumCount;
  final int hardCount;
  final UserProgressProvider progress;
  final bool isDark;
  final Color textMain;
  final Color textSub;
  final VoidCallback onTap;

  const _PatternCard({
    required this.pattern,
    required this.questions,
    required this.easyCount,
    required this.mediumCount,
    required this.hardCount,
    required this.progress,
    required this.isDark,
    required this.textMain,
    required this.textSub,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final total = questions.length;
    final done = progress.patternCompletedCount(pattern.name);
    final pct = total == 0 ? 0.0 : done / total;
    final isWeak = progress.isWeakPattern(pattern.name);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isWeak
                ? AppColors.warning.withOpacity(0.5)
                : pattern.color.withOpacity(0.25),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: pattern.color.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // ── Top Row ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon badge
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: pattern.color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: pattern.color.withOpacity(0.3), width: 1),
                    ),
                    child: Center(
                      child: Text(
                        pattern.icon,
                        style: const TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Title + description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                pattern.name,
                                style: GoogleFonts.outfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: textMain,
                                ),
                              ),
                            ),
                            if (isWeak)
                              _DiffBadge(
                                  label: 'Weak',
                                  color: AppColors.warning),
                            if (pct == 1.0 && total > 0)
                              _DiffBadge(
                                  label: '✓ Done',
                                  color: AppColors.success),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          pattern.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              color: textSub,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 14, color: textSub),
                ],
              ),
            ),

            // ── Progress Bar ─────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$done / $total solved',
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            color: textSub),
                      ),
                      Text(
                        '${(pct * 100).toStringAsFixed(0)}%',
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: pattern.color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: pct,
                      minHeight: 6,
                      backgroundColor: pattern.color.withOpacity(0.1),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(pattern.color),
                    ),
                  ),
                ],
              ),
            ),

            // ── Difficulty Badges ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  if (easyCount > 0)
                    _DiffBadge(
                        label: '$easyCount Easy',
                        color: AppColors.success),
                  if (mediumCount > 0)
                    _DiffBadge(
                        label: '$mediumCount Medium',
                        color: AppColors.warning),
                  if (hardCount > 0)
                    _DiffBadge(
                        label: '$hardCount Hard',
                        color: AppColors.error),
                  _DiffBadge(
                      label: pattern.timeComplexity,
                      color: pattern.color),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Helper Widgets ────────────────────────────────────────────────────────────

class _DiffBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _DiffBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.outfit(
            fontSize: 11, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _HeaderStat extends StatelessWidget {
  final String value;
  final String label;
  const _HeaderStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style:
              GoogleFonts.inter(fontSize: 11, color: Colors.white60),
        ),
      ],
    );
  }
}
