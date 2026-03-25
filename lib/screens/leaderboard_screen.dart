import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../providers/leaderboard_provider.dart';
import '../models/leaderboard_entry.dart';
import '../widgets/app_drawer.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  int _selectedTab = 0; // 0=top, 1=recent, 2=badges

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
      drawer: const AppDrawer(activeItem: DrawerItem.leaderboard),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Leaderboard', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: Consumer<LeaderboardProvider>(
        builder: (context, provider, _) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Summary card
              _buildSummaryCard(provider, accentColor, textMain, textSub, cardColor, isDark),
              const SizedBox(height: 20),

              // Tab bar
              Row(
                children: [
                  _Tab(label: '🏆 Top Scores', isSelected: _selectedTab == 0, color: accentColor, onTap: () => setState(() => _selectedTab = 0)),
                  const SizedBox(width: 8),
                  _Tab(label: '🕐 Recent', isSelected: _selectedTab == 1, color: accentColor, onTap: () => setState(() => _selectedTab = 1)),
                  const SizedBox(width: 8),
                  _Tab(label: '🏅 Badges', isSelected: _selectedTab == 2, color: accentColor, onTap: () => setState(() => _selectedTab = 2)),
                ],
              ),
              const SizedBox(height: 16),

              if (_selectedTab == 0)
                _buildTopScores(provider, textMain, textSub, cardColor, accentColor, isDark)
              else if (_selectedTab == 1)
                _buildRecentScores(provider, textMain, textSub, cardColor, accentColor, isDark)
              else
                _buildBadges(provider, textMain, textSub, cardColor, accentColor, isDark),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard(LeaderboardProvider provider, Color accent, Color textMain, Color textSub, Color cardColor, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [accent.withOpacity(0.8), accent], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: accent.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SummaryItem(label: 'Tests Taken', value: '${provider.totalTests}', icon: '📝'),
              _SummaryItem(label: 'Avg Accuracy', value: '${provider.averageAccuracy.toStringAsFixed(1)}%', icon: '🎯'),
              _SummaryItem(label: 'Badges', value: '${provider.earnedBadges.length}/${provider.badges.length}', icon: '🏅'),
            ],
          ),
          if (provider.bestScore != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)),
              child: Text(
                '🏆 Best: ${provider.bestScore!.accuracy.toStringAsFixed(1)}% in ${provider.bestScore!.sectionName}',
                style: GoogleFonts.inter(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.1);
  }

  Widget _buildTopScores(LeaderboardProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    final topScores = provider.getTopScores(limit: 20);

    if (topScores.isEmpty) {
      return _buildEmptyState('No scores yet. Take a test to see your ranking!', textMain, textSub);
    }

    return Column(
      children: topScores.asMap().entries.map((entry) {
        final idx = entry.key;
        final score = entry.value;
        return _buildScoreCard(score, idx, textMain, textSub, cardColor, accent, isDark);
      }).toList(),
    );
  }

  Widget _buildRecentScores(LeaderboardProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    final recent = provider.getRecent(limit: 20);

    if (recent.isEmpty) {
      return _buildEmptyState('No recent tests. Start practicing!', textMain, textSub);
    }

    return Column(
      children: recent.asMap().entries.map((entry) {
        final idx = entry.key;
        final score = entry.value;
        return _buildScoreCard(score, idx, textMain, textSub, cardColor, accent, isDark, showDate: true);
      }).toList(),
    );
  }

  Widget _buildScoreCard(LeaderboardEntry score, int idx, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark, {bool showDate = false}) {
    final accColor = score.accuracy >= 70 ? AppColors.success : score.accuracy >= 40 ? AppColors.warning : AppColors.error;
    final medal = idx == 0 ? '🥇' : idx == 1 ? '🥈' : idx == 2 ? '🥉' : '${idx + 1}';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: idx < 3 ? accColor.withOpacity(0.3) : Colors.transparent),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Center(
              child: idx < 3
                  ? Text(medal, style: const TextStyle(fontSize: 22))
                  : Text(medal, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: textSub)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(score.sectionName, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: textMain, fontSize: 14)),
                Text(
                  showDate
                      ? '${_formatDate(score.timestamp)} • ${score.score}/${score.totalQuestions}'
                      : '${score.score}/${score.totalQuestions} correct • ${_formatTime(score.timeSeconds)}',
                  style: GoogleFonts.inter(fontSize: 11, color: textSub),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: accColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Text('${score.accuracy.toStringAsFixed(0)}%', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: accColor)),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms, delay: (50 * idx).ms);
  }

  Widget _buildBadges(LeaderboardProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: provider.badges.map((badge) {
        return Container(
          width: (MediaQuery.of(context).size.width - 52) / 2,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: badge.earned ? AppColors.warning.withOpacity(0.4) : Colors.transparent),
          ),
          child: Column(
            children: [
              Text(badge.icon, style: TextStyle(fontSize: 36, color: badge.earned ? null : Colors.grey)),
              const SizedBox(height: 8),
              Text(badge.name, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: badge.earned ? textMain : textSub), textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text(badge.description, style: GoogleFonts.inter(fontSize: 11, color: textSub), textAlign: TextAlign.center),
              if (badge.earned && badge.earnedAt != null) ...[
                const SizedBox(height: 6),
                Text('Earned ${_formatDate(badge.earnedAt!)}', style: GoogleFonts.inter(fontSize: 9, color: AppColors.success, fontWeight: FontWeight.w600)),
              ],
              if (!badge.earned) ...[
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: textSub.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                  child: Text('Locked', style: GoogleFonts.inter(fontSize: 10, color: textSub)),
                ),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState(String msg, Color textMain, Color textSub) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          const Text('📊', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 12),
          Text(msg, style: GoogleFonts.inter(color: textSub), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m}m ${s}s';
  }

  String _formatDate(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}

class _SummaryItem extends StatelessWidget {
  final String label, value, icon;
  const _SummaryItem({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: GoogleFonts.inter(fontSize: 10, color: Colors.white70)),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;
  const _Tab({required this.label, required this.isSelected, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.15) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withOpacity(isSelected ? 0.5 : 0.15)),
          ),
          child: Center(child: Text(label, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: color, fontSize: 12))),
        ),
      ),
    );
  }
}
