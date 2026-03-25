import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../providers/mistake_provider.dart';
import '../models/mistake.dart';
import '../widgets/app_drawer.dart';

class MistakeTrackerScreen extends StatefulWidget {
  const MistakeTrackerScreen({super.key});

  @override
  State<MistakeTrackerScreen> createState() => _MistakeTrackerScreenState();
}

class _MistakeTrackerScreenState extends State<MistakeTrackerScreen> {
  String _filter = 'all'; // all, unresolved, repeated
  String? _topicFilter;

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
      drawer: const AppDrawer(activeItem: DrawerItem.mistakeTracker),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Mistake Tracker', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: Consumer<MistakeProvider>(
        builder: (context, provider, _) {
          if (provider.mistakes.isEmpty) {
            return _buildEmptyState(textMain, textSub);
          }

          final stats = provider.getImprovementStats();
          List<MistakeEntry> filtered;
          switch (_filter) {
            case 'unresolved': filtered = provider.getUnresolved(); break;
            case 'repeated': filtered = provider.getRepeatedMistakes(); break;
            default: filtered = provider.mistakes;
          }

          if (_topicFilter != null) {
            filtered = filtered.where((m) => m.topic == _topicFilter).toList();
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Stats
              _buildStatsRow(stats, textMain, textSub, cardColor, isDark),
              const SizedBox(height: 20),

              // Filters
              _buildFilters(provider, textMain, textSub, cardColor, accentColor),
              const SizedBox(height: 16),

              // Topic filter chips
              _buildTopicChips(provider, textMain, textSub, accentColor),
              const SizedBox(height: 16),

              // Mistake list
              Text('${filtered.length} mistake${filtered.length != 1 ? 's' : ''}', style: GoogleFonts.inter(fontSize: 12, color: textSub)),
              const SizedBox(height: 8),

              ...filtered.asMap().entries.map((entry) {
                final idx = entry.key;
                final mistake = entry.value;
                return _buildMistakeCard(mistake, provider, textMain, textSub, cardColor, accentColor, isDark, idx);
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(Color textMain, Color textSub) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('🎉', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 16),
          Text('No Mistakes Yet!', style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: textMain)),
          const SizedBox(height: 8),
          Text('Wrong answers from tests will appear here', style: GoogleFonts.inter(fontSize: 14, color: textSub)),
        ],
      ),
    );
  }

  Widget _buildStatsRow(Map<String, dynamic> stats, Color textMain, Color textSub, Color cardColor, bool isDark) {
    final rate = (stats['resolutionRate'] as double);
    return Row(
      children: [
        _StatBox(label: 'Total', value: '${stats['total']}', color: AppColors.info, cardColor: cardColor, textMain: textMain, textSub: textSub),
        _StatBox(label: 'Resolved', value: '${stats['resolved']}', color: AppColors.success, cardColor: cardColor, textMain: textMain, textSub: textSub),
        _StatBox(label: 'Repeated', value: '${stats['repeated']}', color: AppColors.error, cardColor: cardColor, textMain: textMain, textSub: textSub),
        _StatBox(label: 'Fix Rate', value: '${rate.toStringAsFixed(0)}%', color: rate > 50 ? AppColors.success : AppColors.warning, cardColor: cardColor, textMain: textMain, textSub: textSub),
      ],
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildFilters(MistakeProvider provider, Color textMain, Color textSub, Color cardColor, Color accentColor) {
    return Row(
      children: [
        _FilterChip(label: 'All', isSelected: _filter == 'all', color: accentColor, onTap: () => setState(() => _filter = 'all')),
        _FilterChip(label: 'Unresolved', isSelected: _filter == 'unresolved', color: AppColors.warning, onTap: () => setState(() => _filter = 'unresolved')),
        _FilterChip(label: 'Repeated', isSelected: _filter == 'repeated', color: AppColors.error, onTap: () => setState(() => _filter = 'repeated')),
      ],
    );
  }

  Widget _buildTopicChips(MistakeProvider provider, Color textMain, Color textSub, Color accentColor) {
    final topicCounts = provider.getTopicMistakeCounts();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() => _topicFilter = null),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: _topicFilter == null ? accentColor.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: accentColor.withOpacity(0.3)),
              ),
              child: Text('All Topics', style: GoogleFonts.inter(fontSize: 12, color: accentColor, fontWeight: FontWeight.w600)),
            ),
          ),
          ...topicCounts.map((entry) => GestureDetector(
            onTap: () => setState(() => _topicFilter = _topicFilter == entry.key ? null : entry.key),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: _topicFilter == entry.key ? AppColors.error.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.error.withOpacity(0.3)),
              ),
              child: Text('${entry.key} (${entry.value})', style: GoogleFonts.inter(fontSize: 12, color: AppColors.error, fontWeight: FontWeight.w600)),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildMistakeCard(MistakeEntry mistake, MistakeProvider provider, Color textMain, Color textSub, Color cardColor, Color accentColor, bool isDark, int idx) {
    final borderColor = mistake.resolved ? AppColors.success : mistake.repeatCount > 1 ? AppColors.error : AppColors.warning;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor.withOpacity(0.3)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Container(
            width: 40, height: 40,
            decoration: BoxDecoration(color: borderColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: mistake.resolved
                  ? const Icon(Icons.check_circle, color: AppColors.success, size: 20)
                  : Text('${mistake.repeatCount}x', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: borderColor, fontSize: 14)),
            ),
          ),
          title: Text(mistake.question, style: GoogleFonts.inter(fontSize: 13, color: textMain, fontWeight: FontWeight.w500), maxLines: 2, overflow: TextOverflow.ellipsis),
          subtitle: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                child: Text(mistake.topic, style: GoogleFonts.inter(fontSize: 10, color: accentColor)),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: _diffColor(mistake.difficulty).withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                child: Text(mistake.difficulty, style: GoogleFonts.inter(fontSize: 10, color: _diffColor(mistake.difficulty))),
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DetailRow(label: 'Your Answer', value: mistake.userAnswer, color: AppColors.error),
                  const SizedBox(height: 6),
                  _DetailRow(label: 'Correct Answer', value: mistake.correctAnswer, color: AppColors.success),
                  const SizedBox(height: 6),
                  _DetailRow(label: 'Times Wrong', value: '${mistake.repeatCount}', color: mistake.repeatCount > 1 ? AppColors.error : textSub),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (!mistake.resolved)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => provider.resolveMistake(mistake.questionId),
                            icon: const Icon(Icons.check, size: 16),
                            label: const Text('Mark Resolved'),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.success, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 10)),
                          ),
                        )
                      else
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle, size: 16, color: AppColors.success),
                                const SizedBox(width: 6),
                                Text('Resolved!', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: AppColors.success)),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () => provider.removeMistake(mistake.questionId),
                        icon: const Icon(Icons.delete_outline, color: AppColors.error, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 300.ms, delay: (50 * idx).ms);
  }

  Color _diffColor(String diff) {
    switch (diff) {
      case 'Easy': return AppColors.success;
      case 'Medium': return AppColors.warning;
      case 'Hard': return AppColors.error;
      default: return AppColors.info;
    }
  }
}

class _StatBox extends StatelessWidget {
  final String label, value;
  final Color color, cardColor, textMain, textSub;
  const _StatBox({required this.label, required this.value, required this.color, required this.cardColor, required this.textMain, required this.textSub});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: color.withOpacity(0.2))),
        child: Column(
          children: [
            Text(value, style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            Text(label, style: GoogleFonts.inter(fontSize: 10, color: textSub)),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;
  const _FilterChip({required this.label, required this.isSelected, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(isSelected ? 0.5 : 0.2)),
        ),
        child: Text(label, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: color)),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label, value;
  final Color color;
  const _DetailRow({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 110, child: Text(label, style: GoogleFonts.inter(fontSize: 12, color: Theme.of(context).brightness == Brightness.dark ? AppColors.textSub : AppColors.lightTextSub))),
        Expanded(child: Text(value, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: color))),
      ],
    );
  }
}
