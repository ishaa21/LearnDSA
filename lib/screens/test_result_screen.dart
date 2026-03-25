import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../models/mock_test.dart';

class TestResultScreen extends StatelessWidget {
  final TestAttempt attempt;
  final List<MockTestQuestion> questions;
  final Map<int, int> answers;

  const TestResultScreen({
    super.key,
    required this.attempt,
    required this.questions,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    final accColor = attempt.accuracy >= 70
        ? AppColors.success
        : attempt.accuracy >= 40
            ? AppColors.warning
            : AppColors.error;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
      child: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: bg,
          title: Text('Test Results', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              child: Text('Done', style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: accentColor)),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Score Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [accColor.withOpacity(0.8), accColor], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: accColor.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 8))],
              ),
              child: Column(
                children: [
                  Text(_getEmoji(attempt.accuracy), style: const TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text('${attempt.accuracy.toStringAsFixed(1)}%', style: GoogleFonts.outfit(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(_getMessage(attempt.accuracy), style: GoogleFonts.inter(fontSize: 16, color: Colors.white70)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _ScoreStat(label: 'Correct', value: '${attempt.correctAnswers}', icon: Icons.check_circle),
                      _ScoreStat(label: 'Wrong', value: '${attempt.totalQuestions - attempt.correctAnswers}', icon: Icons.cancel),
                      _ScoreStat(label: 'Time', value: _formatTime(attempt.totalTimeSeconds), icon: Icons.timer),
                    ],
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 600.ms).scale(begin: const Offset(0.9, 0.9)),
            const SizedBox(height: 24),

            // Stats Row
            Row(
              children: [
                Expanded(child: _InfoCard(title: 'Avg Time/Q', value: '${attempt.avgTimePerQuestion.toStringAsFixed(1)}s', cardColor: cardColor, textMain: textMain, textSub: textSub)),
                const SizedBox(width: 12),
                Expanded(child: _InfoCard(title: 'Section', value: attempt.sectionName, cardColor: cardColor, textMain: textMain, textSub: textSub)),
                const SizedBox(width: 12),
                Expanded(child: _InfoCard(title: 'Difficulty', value: attempt.difficulty, cardColor: cardColor, textMain: textMain, textSub: textSub)),
              ],
            ).animate().fadeIn(duration: 500.ms, delay: 200.ms),
            const SizedBox(height: 24),

            // Topic Breakdown
            Text('📊 Topic Breakdown', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
            const SizedBox(height: 12),
            ...attempt.topicTotal.entries.map((entry) {
              final topic = entry.key;
              final total = entry.value;
              final correct = attempt.topicCorrect[topic] ?? 0;
              final pct = total > 0 ? correct / total : 0.0;
              final color = pct >= 0.7 ? AppColors.success : pct >= 0.4 ? AppColors.warning : AppColors.error;

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: color.withOpacity(0.2))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(topic, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: textMain)),
                        Text('$correct/$total', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: color)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(value: pct, minHeight: 6, backgroundColor: color.withOpacity(0.1), valueColor: AlwaysStoppedAnimation(color)),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 24),

            // Question Review
            Text('📝 Question Review', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
            const SizedBox(height: 12),
            ...questions.asMap().entries.map((entry) {
              final idx = entry.key;
              final q = entry.value;
              final userAns = answers[idx];
              final isCorrect = userAns == q.correct;
              final statusColor = isCorrect ? AppColors.success : AppColors.error;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: statusColor.withOpacity(0.3)),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Container(
                      width: 36, height: 36,
                      decoration: BoxDecoration(color: statusColor.withOpacity(0.1), shape: BoxShape.circle),
                      child: Icon(isCorrect ? Icons.check : Icons.close, color: statusColor, size: 20),
                    ),
                    title: Text('Q${idx + 1}: ${q.question}', style: GoogleFonts.inter(fontSize: 13, color: textMain, fontWeight: FontWeight.w500), maxLines: 2, overflow: TextOverflow.ellipsis),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...q.options.asMap().entries.map((opt) {
                              final isCorrectOpt = opt.key == q.correct;
                              final isUserOpt = opt.key == userAns;
                              Color optColor = textSub;
                              if (isCorrectOpt) optColor = AppColors.success;
                              if (isUserOpt && !isCorrectOpt) optColor = AppColors.error;

                              return Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: isCorrectOpt ? AppColors.success.withOpacity(0.08) : isUserOpt ? AppColors.error.withOpacity(0.08) : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Text('${String.fromCharCode(65 + opt.key)}. ', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: optColor)),
                                    Expanded(child: Text(opt.value, style: GoogleFonts.inter(color: optColor))),
                                    if (isCorrectOpt) const Icon(Icons.check_circle, size: 16, color: AppColors.success),
                                    if (isUserOpt && !isCorrectOpt) const Icon(Icons.cancel, size: 16, color: AppColors.error),
                                  ],
                                ),
                              );
                            }),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.info.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.info_outline, size: 16, color: AppColors.info),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(q.solution, style: GoogleFonts.inter(fontSize: 12, color: textMain, height: 1.4))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  String _getEmoji(double accuracy) {
    if (accuracy >= 90) return '🏆';
    if (accuracy >= 70) return '🎉';
    if (accuracy >= 50) return '👍';
    if (accuracy >= 30) return '💪';
    return '📚';
  }

  String _getMessage(double accuracy) {
    if (accuracy >= 90) return 'Outstanding Performance!';
    if (accuracy >= 70) return 'Great Job!';
    if (accuracy >= 50) return 'Good Effort!';
    if (accuracy >= 30) return 'Keep Practicing!';
    return 'More Practice Needed';
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m}m ${s}s';
  }
}

class _ScoreStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _ScoreStat({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: GoogleFonts.inter(fontSize: 11, color: Colors.white60)),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color cardColor;
  final Color textMain;
  final Color textSub;

  const _InfoCard({required this.title, required this.value, required this.cardColor, required this.textMain, required this.textSub});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          Text(title, style: GoogleFonts.inter(fontSize: 11, color: textSub)),
          const SizedBox(height: 4),
          Text(value, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: textMain), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
