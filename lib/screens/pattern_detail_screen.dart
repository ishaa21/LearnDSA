import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../providers/user_progress_provider.dart';
import '../theme.dart';
import 'pattern_mode_screen.dart';

// ══════════════════════════════════════════════════════════════════════════════
// Pattern Detail Screen
// ══════════════════════════════════════════════════════════════════════════════

class PatternDetailScreen extends StatelessWidget {
  final PatternInfo pattern;
  final List<PatternQuestion> questions;

  const PatternDetailScreen({
    super.key,
    required this.pattern,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;

    return Scaffold(
      backgroundColor: bg,
      body: CustomScrollView(
        slivers: [
          // ── Hero AppBar ────────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: bg,
            foregroundColor: textMain,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      pattern.color.withOpacity(0.85),
                      pattern.color.withOpacity(0.4),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 56, 24, 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(pattern.icon,
                            style: const TextStyle(fontSize: 52)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pattern.name,
                                style: GoogleFonts.outfit(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${questions.length} practice questions',
                                style: GoogleFonts.inter(
                                    fontSize: 13, color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Body ──────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<UserProgressProvider>(
                builder: (context, progress, _) {
                  final done = progress.patternCompletedCount(pattern.name);
                  final total = questions.length;
                  final pct =
                      total == 0 ? 0.0 : done / total;
                  final isWeak = progress.isWeakPattern(pattern.name);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Mastery Card ──────────────────────────────────
                      _MasteryCard(
                        pattern: pattern,
                        done: done,
                        total: total,
                        pct: pct,
                        isWeak: isWeak,
                        textMain: textMain,
                        textSub: textSub,
                        cardBg: cardBg,
                        onReset: () async {
                          final confirmed = await _confirmReset(context);
                          if (confirmed) {
                            await progress.resetPatternProgress(pattern.name);
                          }
                        },
                      ),
                      const SizedBox(height: 20),

                      // ── Description ───────────────────────────────────
                      _InfoSection(
                        title: '📖 Description',
                        color: pattern.color,
                        textMain: textMain,
                        textSub: textSub,
                        cardBg: cardBg,
                        child: Text(
                          pattern.description,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: textSub,
                              height: 1.65),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // ── When to Use ───────────────────────────────────
                      _InfoSection(
                        title: '✅ When to Use',
                        color: AppColors.success,
                        textMain: textMain,
                        textSub: textSub,
                        cardBg: cardBg,
                        child: Column(
                          children: pattern.whenToUse
                              .map((item) => _BulletRow(
                                    text: item,
                                    color: AppColors.success,
                                    textSub: textSub,
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // ── Common Traps ──────────────────────────────────
                      _InfoSection(
                        title: '⚠️ Common Traps',
                        color: AppColors.warning,
                        textMain: textMain,
                        textSub: textSub,
                        cardBg: cardBg,
                        child: Column(
                          children: pattern.commonTraps
                              .map((item) => _BulletRow(
                                    text: item,
                                    color: AppColors.warning,
                                    textSub: textSub,
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // ── Complexity ────────────────────────────────────
                      _InfoSection(
                        title: '⚡ Complexity',
                        color: AppColors.info,
                        textMain: textMain,
                        textSub: textSub,
                        cardBg: cardBg,
                        child: Column(
                          children: [
                            _ComplexityRow(
                                label: 'Time',
                                value: pattern.timeComplexity,
                                textMain: textMain,
                                textSub: textSub),
                            const SizedBox(height: 6),
                            _ComplexityRow(
                                label: 'Space',
                                value: pattern.spaceComplexity,
                                textMain: textMain,
                                textSub: textSub),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // ── Practice Questions List ───────────────────────
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '🎯 Practice Questions',
                              style: GoogleFonts.outfit(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: textMain,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$done/$total done',
                            style: GoogleFonts.inter(
                                fontSize: 12, color: textSub),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...questions.asMap().entries.map((entry) {
                        final q = entry.value;
                        final isDone = progress.isPatternQuestionDone(
                            pattern.name, q.id);
                        return _QuestionListTile(
                          question: q,
                          isDone: isDone,
                          patternColor: pattern.color,
                          textMain: textMain,
                          textSub: textSub,
                          cardBg: cardBg,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PatternPracticeScreen(
                                pattern: pattern,
                                questions: questions,
                                startIndex: entry.key,
                              ),
                            ),
                          ),
                        ).animate(delay: (entry.key * 40).ms).fadeIn();
                      }),

                      const SizedBox(height: 24),

                      // ── Start Practice Button ─────────────────────────
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PatternPracticeScreen(
                                pattern: pattern,
                                questions: questions,
                                startIndex: 0,
                                shuffled: true,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pattern.color,
                            foregroundColor: Colors.white,
                            padding:
                                const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Text(
                            'Start Practice Session  🚀',
                            style: GoogleFonts.outfit(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _confirmReset(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Reset Progress',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
            content: Text(
                'This will clear all completed questions for ${pattern.name}. Are you sure?',
                style: GoogleFonts.inter()),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error),
                  child: const Text('Reset')),
            ],
          ),
        ) ??
        false;
  }
}

// ── Helper sub-widgets for Detail Screen ────────────────────────────────────

class _MasteryCard extends StatelessWidget {
  final PatternInfo pattern;
  final int done;
  final int total;
  final double pct;
  final bool isWeak;
  final Color textMain;
  final Color textSub;
  final Color cardBg;
  final VoidCallback onReset;

  const _MasteryCard({
    required this.pattern,
    required this.done,
    required this.total,
    required this.pct,
    required this.isWeak,
    required this.textMain,
    required this.textSub,
    required this.cardBg,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: pattern.color.withOpacity(0.25)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 72,
                height: 72,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: pct,
                      strokeWidth: 8,
                      backgroundColor: pattern.color.withOpacity(0.1),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(pattern.color),
                    ),
                    Center(
                      child: Text(
                        '${(pct * 100).toStringAsFixed(0)}%',
                        style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textMain),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$done of $total questions solved',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: textMain),
                    ),
                    const SizedBox(height: 4),
                    if (isWeak)
                      _StatusBadge(
                          label: '⚠️ Needs Practice',
                          color: AppColors.warning)
                    else if (pct == 1.0 && total > 0)
                      _StatusBadge(
                          label: '✓ Mastered!',
                          color: AppColors.success)
                    else if (done > 0)
                      _StatusBadge(
                          label: '⏳ In Progress',
                          color: AppColors.info)
                    else
                      _StatusBadge(
                          label: '🆕 Not Started',
                          color: textSub),
                  ],
                ),
              ),
              if (done > 0)
                IconButton(
                  icon: const Icon(Icons.refresh_rounded, size: 20),
                  color: textSub,
                  tooltip: 'Reset progress',
                  onPressed: onReset,
                ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _StatusBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: GoogleFonts.outfit(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color)),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final Color color;
  final Color textMain;
  final Color textSub;
  final Color cardBg;
  final Widget child;

  const _InfoSection({
    required this.title,
    required this.color,
    required this.textMain,
    required this.textSub,
    required this.cardBg,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: color),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _BulletRow extends StatelessWidget {
  final String text;
  final Color color;
  final Color textSub;
  const _BulletRow(
      {required this.text, required this.color, required this.textSub});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration:
                BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: GoogleFonts.inter(
                    fontSize: 13, color: textSub, height: 1.5)),
          ),
        ],
      ),
    );
  }
}

class _ComplexityRow extends StatelessWidget {
  final String label;
  final String value;
  final Color textMain;
  final Color textSub;
  const _ComplexityRow(
      {required this.label,
      required this.value,
      required this.textMain,
      required this.textSub});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 52,
          padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.info.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.info),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(value,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  color: textSub,
                  fontStyle: FontStyle.italic)),
        ),
      ],
    );
  }
}

class _QuestionListTile extends StatelessWidget {
  final PatternQuestion question;
  final bool isDone;
  final Color patternColor;
  final Color textMain;
  final Color textSub;
  final Color cardBg;
  final VoidCallback onTap;

  const _QuestionListTile({
    required this.question,
    required this.isDone,
    required this.patternColor,
    required this.textMain,
    required this.textSub,
    required this.cardBg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final diffColor = question.difficulty == 'Easy'
        ? AppColors.success
        : question.difficulty == 'Medium'
            ? AppColors.warning
            : AppColors.error;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isDone
                ? AppColors.success.withOpacity(0.3)
                : patternColor.withOpacity(0.15),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isDone
                    ? AppColors.success.withOpacity(0.12)
                    : patternColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  isDone
                      ? Icons.check_rounded
                      : Icons.circle_outlined,
                  size: 16,
                  color:
                      isDone ? AppColors.success : patternColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                question.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textMain),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: diffColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                question.difficulty,
                style: GoogleFonts.outfit(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: diffColor),
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios_rounded,
                size: 12, color: textSub),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// Pattern Practice Screen
// ══════════════════════════════════════════════════════════════════════════════

class PatternPracticeScreen extends StatefulWidget {
  final PatternInfo pattern;
  final List<PatternQuestion> questions;
  final int startIndex;
  final bool shuffled;

  const PatternPracticeScreen({
    super.key,
    required this.pattern,
    required this.questions,
    this.startIndex = 0,
    this.shuffled = false,
  });

  @override
  State<PatternPracticeScreen> createState() =>
      _PatternPracticeScreenState();
}

class _PatternPracticeScreenState
    extends State<PatternPracticeScreen> {
  late List<PatternQuestion> sessionQuestions;
  int currentIndex = 0;
  bool showHint = false;
  bool showSolution = false;
  bool markedDone = false;
  int correctCount = 0;
  bool sessionComplete = false;

  // Timer
  bool timerRunning = false;
  int _elapsed = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    sessionQuestions = List<PatternQuestion>.from(widget.questions);
    if (widget.shuffled) {
      sessionQuestions.shuffle(Random());
    }
    currentIndex = widget.startIndex.clamp(0, sessionQuestions.length - 1);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    timerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _elapsed++);
    });
  }

  String get _timerDisplay {
    final m = (_elapsed ~/ 60).toString().padLeft(2, '0');
    final s = (_elapsed % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  PatternQuestion get _current => sessionQuestions[currentIndex];

  void _markDone(BuildContext context, bool wasCorrect) {
    if (markedDone) return;
    final progress =
        Provider.of<UserProgressProvider>(context, listen: false);
    progress.markPatternQuestionDone(
        widget.pattern.name, _current.id, wasCorrect);
    setState(() {
      markedDone = true;
      if (wasCorrect) correctCount++;
    });
  }

  void _next() {
    if (currentIndex < sessionQuestions.length - 1) {
      setState(() {
        currentIndex++;
        showHint = false;
        showSolution = false;
        markedDone = false;
      });
    } else {
      _timer?.cancel();
      setState(() => sessionComplete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain =
        isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub =
        isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final accent = widget.pattern.color;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Text(
          widget.pattern.name,
          style: GoogleFonts.outfit(
              fontWeight: FontWeight.bold, color: textMain),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.timer_rounded,
                        size: 14, color: accent),
                    const SizedBox(width: 4),
                    Text(
                      _timerDisplay,
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold,
                          color: textMain,
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: sessionComplete
          ? _buildSummary(textMain, textSub, cardBg, accent)
          : _buildQuestion(textMain, textSub, cardBg, accent, isDark),
    );
  }

  Widget _buildQuestion(Color textMain, Color textSub, Color cardBg,
      Color accent, bool isDark) {
    if (sessionQuestions.isEmpty) return const SizedBox();
    final q = _current;
    final diffColor = q.difficulty == 'Easy'
        ? AppColors.success
        : q.difficulty == 'Medium'
            ? AppColors.warning
            : AppColors.error;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // ── Progress header ──────────────────────────────────────────
        Row(
          children: [
            Text(
              'Q${currentIndex + 1} of ${sessionQuestions.length}',
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  color: textMain,
                  fontSize: 15),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: diffColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(q.difficulty,
                  style: GoogleFonts.outfit(
                      fontSize: 11,
                      color: diffColor,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: (currentIndex + 1) / sessionQuestions.length,
            minHeight: 5,
            backgroundColor: accent.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(accent),
          ),
        ),
        const SizedBox(height: 20),

        // ── Pattern badge ────────────────────────────────────────────
        Row(
          children: [
            Text(widget.pattern.icon,
                style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.pattern.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: accent),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // ── Title ───────────────────────────────────────────────────
        Text(
          q.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.outfit(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textMain),
        ),
        const SizedBox(height: 16),

        // ── Question Card ────────────────────────────────────────────
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: accent.withOpacity(0.2)),
          ),
          child: Text(
            q.question,
            style: GoogleFonts.inter(
                fontSize: 15, color: textMain, height: 1.65),
          ),
        ).animate().fadeIn(duration: 300.ms),
        const SizedBox(height: 16),

        // ── Action Buttons ───────────────────────────────────────────
        if (!showHint && !showSolution) ...[
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => setState(() => showHint = true),
                  icon: const Icon(Icons.lightbulb_rounded, size: 16),
                  label: Text('Show Hint',
                      style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.warning,
                    side:
                        BorderSide(color: AppColors.warning.withOpacity(0.5)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => setState(() => showSolution = true),
                  icon: const Icon(Icons.visibility_rounded, size: 16),
                  label: Text('Solution',
                      style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],

        // ── Hint Card ────────────────────────────────────────────────
        if (showHint) ...[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              border:
                  Border.all(color: AppColors.warning.withOpacity(0.35)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lightbulb_rounded,
                        color: AppColors.warning, size: 18),
                    const SizedBox(width: 8),
                    Text('Hint',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            color: AppColors.warning,
                            fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(q.hint,
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        color: textSub,
                        height: 1.6)),
              ],
            ),
          ).animate().fadeIn(duration: 250.ms),
          const SizedBox(height: 12),
          if (!showSolution)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => setState(() => showSolution = true),
                icon: const Icon(Icons.visibility_rounded, size: 16),
                label: Text('Show Solution',
                    style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w600)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
        ],

        // ── Solution Card ─────────────────────────────────────────────
        if (showSolution) ...[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.07),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.info.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.code_rounded,
                        color: AppColors.info, size: 18),
                    const SizedBox(width: 8),
                    Text('Solution Approach',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            color: AppColors.info,
                            fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(q.solution,
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        color: textSub,
                        height: 1.65)),
              ],
            ),
          ).animate().fadeIn(duration: 250.ms),
          const SizedBox(height: 20),

          // Mark completed
          if (!markedDone) ...[
            Text(
              'Did you solve it correctly?',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.outfit(color: textMain, fontSize: 15),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _markDone(context, false),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: BorderSide(
                          color: AppColors.error.withOpacity(0.5)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    child: Text('❌  Not Yet',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _markDone(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    child: Text('✅  Got It!',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ] else ...[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _next,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  currentIndex < sessionQuestions.length - 1
                      ? 'Next Question →'
                      : 'See Results 🏆',
                  style: GoogleFonts.outfit(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ],
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildSummary(
      Color textMain, Color textSub, Color cardBg, Color accent) {
    final total = sessionQuestions.length;
    final pct = total == 0 ? 0.0 : correctCount / total;
    final emoji = pct >= 0.8 ? '🏆' : pct >= 0.5 ? '👍' : '💪';

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 72)),
            const SizedBox(height: 16),
            Text(
              'Session Complete!',
              style: GoogleFonts.outfit(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: textMain),
            ),
            const SizedBox(height: 8),
            Text(
              '$correctCount / $total correct  •  ${(pct * 100).toStringAsFixed(0)}%',
              style: GoogleFonts.inter(fontSize: 16, color: textSub),
            ),
            const SizedBox(height: 8),
            Text(
              'Time: $_timerDisplay',
              style: GoogleFonts.inter(fontSize: 13, color: textSub),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: accent.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('🧩', style: TextStyle(fontSize: 24)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.pattern.name,
                          style: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: textMain),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: pct,
                      minHeight: 8,
                      backgroundColor: accent.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          pct >= 0.8 ? AppColors.success : accent),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pct >= 0.8
                        ? 'Great mastery! Pattern understood.'
                        : pct >= 0.5
                            ? 'Good effort! Keep practicing.'
                            : 'Needs more practice. Review the theory.',
                    style: GoogleFonts.inter(
                        fontSize: 13, color: textSub),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    child: Text('Back',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sessionQuestions.shuffle(Random());
                        currentIndex = 0;
                        showHint = false;
                        showSolution = false;
                        markedDone = false;
                        correctCount = 0;
                        sessionComplete = false;
                        _elapsed = 0;
                      });
                      _startTimer();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    child: Text('Retry',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ).animate().fadeIn(duration: 500.ms),
      ),
    );
  }
}
