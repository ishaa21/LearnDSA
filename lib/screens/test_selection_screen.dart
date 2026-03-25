import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../providers/mock_test_provider.dart';
import '../providers/leaderboard_provider.dart';
import '../models/mock_test.dart';
import '../widgets/app_drawer.dart';
import 'test_screen.dart';

class TestSelectionScreen extends StatelessWidget {
  const TestSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(activeItem: DrawerItem.mockTest),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Mock Tests', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: Consumer<MockTestProvider>(
        builder: (context, provider, _) {
          if (provider.sections.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Suggested difficulty
              _buildSuggestionBanner(context, provider, accentColor, textMain, textSub, cardColor),
              const SizedBox(height: 24),

              // Recent scores
              if (provider.history.isNotEmpty) ...[
                Text('📊 Recent Performance', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                const SizedBox(height: 12),
                _buildRecentScores(provider, textMain, textSub, cardColor, isDark),
                const SizedBox(height: 24),
              ],

              // Sections
              Text('📝 Choose Section', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
              const SizedBox(height: 12),
              ...provider.sections.asMap().entries.map((entry) {
                final idx = entry.key;
                final section = entry.value;
                return _buildSectionCard(
                  context, section, provider, idx,
                  textMain, textSub, cardColor, accentColor, isDark,
                ).animate().fadeIn(duration: 400.ms, delay: (100 * idx).ms).slideX(begin: 0.05);
              }),

              const SizedBox(height: 24),

              // Weak topics
              if (provider.getWeakTopics().isNotEmpty) ...[
                Text('⚠️ Weak Topics', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                const SizedBox(height: 12),
                _buildWeakTopics(provider, textMain, textSub, cardColor),
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _buildSuggestionBanner(BuildContext context, MockTestProvider provider, Color accent, Color textMain, Color textSub, Color cardColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [accent.withOpacity(0.8), accent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: accent.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 6))],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Smart Test Generator', style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 4),
                Text(
                  provider.history.isEmpty
                      ? 'Take your first test to get personalized recommendations!'
                      : 'Tests adapt based on your performance & weak areas',
                  style: GoogleFonts.inter(fontSize: 13, color: Colors.white70),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => _showQuickTestDialog(context, provider),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)),
                    child: Text('Quick Start →', style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const Text('🧠', style: TextStyle(fontSize: 48)),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.1);
  }

  Widget _buildRecentScores(MockTestProvider provider, Color textMain, Color textSub, Color cardColor, bool isDark) {
    final recent = provider.getRecentAttempts(limit: 3);
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recent.length,
        itemBuilder: (context, index) {
          final attempt = recent[index];
          final accColor = attempt.accuracy >= 70
              ? AppColors.success
              : attempt.accuracy >= 40
                  ? AppColors.warning
                  : AppColors.error;
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: accColor.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(attempt.sectionName, style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, color: textMain), overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text('${attempt.accuracy.toStringAsFixed(0)}%', style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: accColor)),
                Text('${attempt.correctAnswers}/${attempt.totalQuestions} correct', style: GoogleFonts.inter(fontSize: 10, color: textSub)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, MockTestSection section, MockTestProvider provider, int index,
      Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    final sectionIcons = {'quantitative': Icons.calculate, 'logical': Icons.psychology, 'verbal': Icons.text_fields, 'dsa': Icons.code};
    final sectionColors = [const Color(0xFF4A90D9), const Color(0xFFE67E22), const Color(0xFF2ECC71), const Color(0xFF7C3AED)];
    final color = sectionColors[index % sectionColors.length];
    final icon = sectionIcons[section.id] ?? Icons.quiz;
    final suggested = provider.suggestDifficulty(section.id);
    final best = provider.getBestScore(section.id);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(14)),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(section.name, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: textMain)),
                    Text('${section.questions.length} questions available', style: GoogleFonts.inter(fontSize: 12, color: textSub)),
                  ],
                ),
              ),
              if (best != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                  child: Text('Best: ${best.accuracy.toStringAsFixed(0)}%', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.success)),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: Text('Suggested: $suggested', style: GoogleFonts.inter(fontSize: 11, color: color, fontWeight: FontWeight.w600)),
              ),
              const Spacer(),
              ...['Easy', 'Medium', 'Hard'].map((diff) => Padding(
                padding: const EdgeInsets.only(left: 6),
                child: _DifficultyChip(
                  label: diff,
                  color: diff == 'Easy' ? AppColors.success : diff == 'Medium' ? AppColors.warning : AppColors.error,
                  onTap: () => _startTest(context, section, diff),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeakTopics(MockTestProvider provider, Color textMain, Color textSub, Color cardColor) {
    final weak = provider.getWeakTopics();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: weak.map((topic) {
        final accuracy = provider.topicAccuracy[topic] ?? 0;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.error.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning_amber_rounded, size: 16, color: AppColors.error),
              const SizedBox(width: 6),
              Text('$topic (${accuracy.toStringAsFixed(0)}%)', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.error)),
            ],
          ),
        );
      }).toList(),
    );
  }

  void _startTest(BuildContext context, MockTestSection section, String difficulty) {
    final provider = Provider.of<MockTestProvider>(context, listen: false);
    final questions = provider.generateTest(sectionId: section.id, difficulty: difficulty);

    if (questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No $difficulty questions available in ${section.name}')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TestScreen(
          questions: questions,
          sectionId: section.id,
          sectionName: section.name,
          difficulty: difficulty,
        ),
      ),
    );
  }

  void _showQuickTestDialog(BuildContext context, MockTestProvider provider) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;

    showModalBottomSheet(
      context: context,
      backgroundColor: cardColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Quick Start', style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: textMain)),
              const SizedBox(height: 16),
              ...provider.sections.map((section) {
                final suggested = provider.suggestDifficulty(section.id);
                return ListTile(
                  title: Text(section.name, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: textMain)),
                  subtitle: Text('Recommended: $suggested', style: GoogleFonts.inter(fontSize: 12)),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () {
                    Navigator.pop(ctx);
                    _startTest(context, section, suggested);
                  },
                );
              }),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _DifficultyChip({required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Text(label, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: color)),
      ),
    );
  }
}
