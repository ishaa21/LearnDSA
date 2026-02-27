import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../providers/user_progress_provider.dart';
import '../theme.dart';
import '../widgets/app_drawer.dart';

class _Question {
  final String id;
  final String topic;
  final String difficulty;
  final String question;
  final String hint;
  final String solution;
  final List<String> options;
  final int correct;

  _Question({
    required this.id,
    required this.topic,
    required this.difficulty,
    required this.question,
    required this.hint,
    required this.solution,
    required this.options,
    required this.correct,
  });

  factory _Question.fromJson(Map<String, dynamic> j) {
    return _Question(
      id: j['id'],
      topic: j['topic'],
      difficulty: j['difficulty'],
      question: j['question'],
      hint: j['hint'],
      solution: j['solution'],
      options: List<String>.from(j['options']),
      correct: j['correct'],
    );
  }
}

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  List<_Question> allQuestions = [];
  List<_Question> todayQuestions = [];
  bool isLoading = true;
  bool sessionStarted = false;
  bool sessionDone = false;

  int currentIndex = 0;
  int? selectedOption;
  bool answered = false;
  int correctCount = 0;

  // Timer
  static const int timerSeconds = 30 * 60; // 30 min
  int remainingSeconds = timerSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    final raw =
        await rootBundle.loadString('assets/data/questions.json');
    final data = jsonDecode(raw);
    final all = (data['questions'] as List)
        .map((q) => _Question.fromJson(q))
        .toList();
    setState(() {
      allQuestions = all;
      isLoading = false;
    });
  }

  void _startSession() {
    final progress =
        Provider.of<UserProgressProvider>(context, listen: false);
    List<_Question> pool;

    if (progress.hasTodayPractice && progress.todayPracticeIds.isNotEmpty) {
      final ids = progress.todayPracticeIds.toSet();
      pool = allQuestions.where((q) => ids.contains(q.id)).toList();
      if (pool.isEmpty) pool = _pickRandom();
    } else {
      pool = _pickRandom();
      progress.setTodayPractice(pool.map((q) => q.id).toList());
    }

    setState(() {
      todayQuestions = pool;
      sessionStarted = true;
      currentIndex = 0;
      selectedOption = null;
      answered = false;
      correctCount = 0;
      remainingSeconds = timerSeconds;
    });
    _startTimer();
  }

  List<_Question> _pickRandom() {
    final rng = Random();
    final shuffled = List<_Question>.from(allQuestions)..shuffle(rng);
    return shuffled.take(5).toList();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          t.cancel();
          _endSession();
        }
      });
    });
  }

  void _selectOption(int idx) {
    if (answered) return;
    setState(() {
      selectedOption = idx;
      answered = true;
      if (idx == todayQuestions[currentIndex].correct) correctCount++;
    });
  }

  void _nextQuestion() {
    if (currentIndex < todayQuestions.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
        answered = false;
      });
    } else {
      _endSession();
    }
  }

  void _endSession() {
    _timer?.cancel();
    setState(() {
      sessionDone = true;
    });
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(activeItem: DrawerItem.practice),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Practice',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
        actions: sessionStarted && !sessionDone
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: remainingSeconds < 300
                            ? AppColors.error.withOpacity(0.15)
                            : accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.timer_rounded,
                              size: 16,
                              color: remainingSeconds < 300
                                  ? AppColors.error
                                  : accentColor),
                          const SizedBox(width: 4),
                          Text(
                            _formatTime(remainingSeconds),
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold,
                              color: remainingSeconds < 300
                                  ? AppColors.error
                                  : textMain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : sessionDone
              ? _buildSummary(textMain, textSub, cardBg, accentColor, isDark)
              : sessionStarted
                  ? _buildQuestion(
                      textMain, textSub, cardBg, accentColor, isDark)
                  : _buildLanding(
                      textMain, textSub, cardBg, accentColor, isDark),
    );
  }

  Widget _buildLanding(Color textMain, Color textSub, Color cardBg,
      Color accent, bool isDark) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🎯', style: TextStyle(fontSize: 72)),
            const SizedBox(height: 24),
            Text(
              'Daily Practice',
              style: GoogleFonts.outfit(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textMain),
            ),
            const SizedBox(height: 12),
            Text(
              '5 curated questions across all DSA topics.\nTimer: 30 minutes.',
              style:
                  GoogleFonts.inter(fontSize: 14, color: textSub, height: 1.6),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _startSession,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  'Start Practice Session',
                  style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ).animate().fadeIn(duration: 400.ms),
      ),
    );
  }

  Widget _buildQuestion(Color textMain, Color textSub, Color cardBg,
      Color accent, bool isDark) {
    if (todayQuestions.isEmpty) return const SizedBox();
    final q = todayQuestions[currentIndex];

    final diffColor = q.difficulty == 'Easy'
        ? AppColors.success
        : q.difficulty == 'Medium'
            ? AppColors.warning
            : AppColors.error;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Progress
        Row(
          children: [
            Text(
              'Q${currentIndex + 1} of ${todayQuestions.length}',
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold, color: textMain, fontSize: 16),
            ),
            const Spacer(),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: diffColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(q.difficulty,
                  style: GoogleFonts.outfit(
                      fontSize: 12,
                      color: diffColor,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(q.topic,
                  style: GoogleFonts.outfit(
                      fontSize: 12,
                      color: accent,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: (currentIndex + 1) / todayQuestions.length,
            minHeight: 4,
            backgroundColor: accent.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(accent),
          ),
        ),
        const SizedBox(height: 24),

        // Question card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: accent.withOpacity(0.15)),
          ),
          child: Text(
            q.question,
            style: GoogleFonts.inter(
                fontSize: 17, color: textMain, height: 1.6),
          ),
        ).animate().fadeIn(duration: 300.ms),
        const SizedBox(height: 20),

        // Options
        ...q.options.asMap().entries.map((entry) {
          final idx = entry.key;
          final opt = entry.value;

          Color? optColor;
          Color borderColor = accent.withOpacity(0.1);
          IconData? trailingIcon;

          if (answered) {
            if (idx == q.correct) {
              optColor = AppColors.success.withOpacity(0.12);
              borderColor = AppColors.success;
              trailingIcon = Icons.check_circle_rounded;
            } else if (idx == selectedOption) {
              optColor = AppColors.error.withOpacity(0.12);
              borderColor = AppColors.error;
              trailingIcon = Icons.cancel_rounded;
            }
          } else if (selectedOption == idx) {
            optColor = accent.withOpacity(0.12);
            borderColor = accent;
          }

          return GestureDetector(
            onTap: () => _selectOption(idx),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: optColor ?? cardBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: borderColor.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        ['A', 'B', 'C', 'D'][idx],
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            color: borderColor,
                            fontSize: 13),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(opt,
                        style: GoogleFonts.inter(
                            fontSize: 15, color: textMain)),
                  ),
                  if (trailingIcon != null)
                    Icon(trailingIcon, color: borderColor, size: 20),
                ],
              ),
            ).animate().fadeIn(delay: (idx * 60).ms),
          );
        }),

        // Solution card
        if (answered) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.info.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lightbulb_rounded,
                        color: AppColors.info, size: 18),
                    const SizedBox(width: 8),
                    Text('Explanation',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            color: AppColors.info,
                            fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(q.solution,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        color: isDark ? AppColors.textSub : AppColors.lightTextSub,
                        height: 1.6)),
              ],
            ),
          ).animate().fadeIn(duration: 300.ms),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: Text(
                currentIndex < todayQuestions.length - 1
                    ? 'Next Question →'
                    : 'See Results',
                style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildSummary(Color textMain, Color textSub, Color cardBg,
      Color accent, bool isDark) {
    final total = todayQuestions.length;
    final pct = total == 0 ? 0.0 : correctCount / total;
    final emoji = pct >= 0.8
        ? '🏆'
        : pct >= 0.6
            ? '👍'
            : '💪';

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
                  fontSize: 26, fontWeight: FontWeight.bold, color: textMain),
            ),
            const SizedBox(height: 8),
            Text(
              '$correctCount / $total correct  •  ${(pct * 100).toStringAsFixed(0)}%',
              style: GoogleFonts.inter(fontSize: 16, color: textSub),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: todayQuestions.asMap().entries.map((e) {
                  final q = e.value;
                  final isCorrect = e.key < todayQuestions.length &&
                      todayQuestions.indexOf(q) < todayQuestions.length;
                  return Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: textSub),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(q.topic,
                            style: GoogleFonts.inter(
                                fontSize: 13, color: textMain)),
                      ),
                      Text(q.difficulty,
                          style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: q.difficulty == 'Easy'
                                  ? AppColors.success
                                  : q.difficulty == 'Medium'
                                      ? AppColors.warning
                                      : AppColors.error)),
                    ],
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    sessionStarted = false;
                    sessionDone = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: accent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  'Practice Again',
                  style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ).animate().fadeIn(duration: 500.ms),
      ),
    );
  }
}
