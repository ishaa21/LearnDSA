import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../providers/study_plan_provider.dart';
import '../models/study_plan.dart';
import '../widgets/app_drawer.dart';

class StudyPlanScreen extends StatelessWidget {
  const StudyPlanScreen({super.key});

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
      drawer: const AppDrawer(activeItem: DrawerItem.studyPlans),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Study Plans', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: Consumer<StudyPlanProvider>(
        builder: (context, provider, _) {
          if (provider.plans.isEmpty) return const Center(child: CircularProgressIndicator());

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Show active plan progress at top if one is active
              if (provider.activePlan != null) ...[
                _ActivePlanHeader(provider: provider, isDark: isDark, textMain: textMain, textSub: textSub, cardColor: cardColor, accentColor: accentColor),
                const SizedBox(height: 24),
                // Day list for active plan
                _ActivePlanDays(provider: provider, isDark: isDark, textMain: textMain, textSub: textSub, cardColor: cardColor, accentColor: accentColor),
                const SizedBox(height: 24),
                Divider(color: textSub.withOpacity(0.15)),
                const SizedBox(height: 12),
                Text('Other Plans', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                Text('You can browse other plans below', style: GoogleFonts.inter(fontSize: 12, color: textSub)),
                const SizedBox(height: 12),
              ],

              if (provider.activePlan == null) ...[
                Text('Choose a Plan', style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: textMain)),
                Text('Select a study plan and track your daily progress', style: GoogleFonts.inter(fontSize: 13, color: textSub)),
                const SizedBox(height: 20),
              ],

              // Show ALL plans (active one marked, others browsable)
              ...provider.plans.asMap().entries.map((entry) {
                final idx = entry.key;
                final plan = entry.value;
                final color = Color(int.parse(plan.color.replaceFirst('#', '0xFF')));
                final isActive = provider.activePlanId == plan.id;

                return GestureDetector(
                  onTap: () {
                    if (isActive) return; // Already active, do nothing
                    if (provider.activePlan != null) {
                      // Another plan is active — show sweet quote dialog
                      _showParallelPlanWarning(context);
                      return;
                    }
                    _showPlanPreview(context, plan, color, provider, isDark, textMain, textSub, cardColor);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isActive ? color.withOpacity(0.6) : color.withOpacity(0.2),
                        width: isActive ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 56, height: 56,
                          decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(16)),
                          child: Center(child: Text(_planEmoji(plan.id), style: const TextStyle(fontSize: 28))),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text(plan.name, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: textMain))),
                                  if (isActive)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(color: AppColors.success.withOpacity(0.15), borderRadius: BorderRadius.circular(6)),
                                      child: Text('ACTIVE', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.success)),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(plan.description, style: GoogleFonts.inter(fontSize: 12, color: textSub), maxLines: 2, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 6),
                              Text('${plan.duration} days', style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600, color: color)),
                            ],
                          ),
                        ),
                        Icon(isActive ? Icons.check_circle : Icons.arrow_forward_ios_rounded, size: 16, color: isActive ? AppColors.success : textSub),
                      ],
                    ),
                  ),
                ).animate().fadeIn(duration: 400.ms, delay: (100 * idx).ms);
              }),
            ],
          );
        },
      ),
    );
  }

  void _showParallelPlanWarning(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? AppColors.card : AppColors.lightCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Text('🧘', style: TextStyle(fontSize: 28)),
            const SizedBox(width: 10),
            Expanded(child: Text('One Step at a Time', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 18))),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.warning.withOpacity(0.2)),
              ),
              child: Text(
                '"The man who chases two rabbits catches neither."\n\n— Confucius',
                style: GoogleFonts.inter(fontSize: 14, fontStyle: FontStyle.italic, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'You already have an active study plan. Focus on completing it first before starting a new one. Consistency beats quantity! 💪',
              style: GoogleFonts.inter(fontSize: 13, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Got it!', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _showSwitchConfirmation(context);
            },
            child: Text('Switch Plan', style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: AppColors.warning)),
          ),
        ],
      ),
    );
  }

  void _showSwitchConfirmation(BuildContext context) {
    final provider = Provider.of<StudyPlanProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Switch Plan?', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        content: const Text('Your current progress will be saved. You can start a different plan.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () { Navigator.pop(ctx); provider.stopPlan(); },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.warning),
            child: const Text('Switch', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showPlanPreview(BuildContext context, StudyPlan plan, Color color, StudyPlanProvider provider, bool isDark, Color textMain, Color textSub, Color cardColor) {
    showModalBottomSheet(
      context: context,
      backgroundColor: cardColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7, maxChildSize: 0.9, expand: false,
          builder: (_, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: ListView(
                controller: scrollController,
                children: [
                  Text(plan.name, style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: textMain)),
                  const SizedBox(height: 4),
                  Text(plan.description, style: GoogleFonts.inter(fontSize: 13, color: textSub)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () { provider.startPlan(plan.id); Navigator.pop(ctx); },
                    style: ElevatedButton.styleFrom(backgroundColor: color, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: Text('Start This Plan', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  Text('Plan Overview', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: textMain)),
                  const SizedBox(height: 12),
                  ...plan.days.take(10).map((day) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.surface : AppColors.lightSurface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: [
                      Container(
                        width: 32, height: 32,
                        decoration: BoxDecoration(color: color.withOpacity(0.15), shape: BoxShape.circle),
                        child: Center(child: Text('${day.day}', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, color: color))),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(day.title, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: textMain, fontSize: 13)),
                        Text('${day.tasks.length} tasks', style: GoogleFonts.inter(fontSize: 11, color: textSub)),
                      ])),
                    ]),
                  )),
                  if (plan.days.length > 10) Center(child: Text('...and ${plan.days.length - 10} more days', style: GoogleFonts.inter(fontSize: 12, color: textSub))),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _planEmoji(String id) {
    switch (id) {
      case '30day': return '🚀';
      case '60day': return '📅';
      case '7day': return '⚡';
      default: return '📖';
    }
  }
}

// ── Active Plan Header ──────────────────────────────────────────────────────
class _ActivePlanHeader extends StatelessWidget {
  final StudyPlanProvider provider;
  final bool isDark;
  final Color textMain, textSub, cardColor, accentColor;
  const _ActivePlanHeader({required this.provider, required this.isDark, required this.textMain, required this.textSub, required this.cardColor, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    final plan = provider.activePlan!;
    final color = Color(int.parse(plan.color.replaceFirst('#', '0xFF')));
    final progress = provider.getProgress();
    final completedDays = provider.getCompletedDays();
    final currentDay = provider.getCurrentDay();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color.withOpacity(0.8), color], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(plan.name, style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))),
          GestureDetector(
            onTap: () => _confirmStopPlan(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
              child: Text('Switch Plan', style: GoogleFonts.inter(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        ]),
        const SizedBox(height: 12),
        Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Day $currentDay / ${plan.duration}', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
            Text('$completedDays days completed', style: GoogleFonts.inter(fontSize: 12, color: Colors.white70)),
          ]),
          const Spacer(),
          Text('${(progress * 100).toStringAsFixed(0)}%', style: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
        ]),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(value: progress, minHeight: 8, backgroundColor: Colors.white24, valueColor: const AlwaysStoppedAnimation(Colors.white)),
        ),
      ]),
    ).animate().fadeIn(duration: 500.ms);
  }

  void _confirmStopPlan(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Switch Plan?', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        content: const Text('Your current progress will be saved. You can start a different plan.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () { Navigator.pop(ctx); provider.stopPlan(); },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.warning),
            child: const Text('Switch', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// ── Active Plan Days ────────────────────────────────────────────────────────
class _ActivePlanDays extends StatelessWidget {
  final StudyPlanProvider provider;
  final bool isDark;
  final Color textMain, textSub, cardColor, accentColor;
  const _ActivePlanDays({required this.provider, required this.isDark, required this.textMain, required this.textSub, required this.cardColor, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    final plan = provider.activePlan!;
    final color = Color(int.parse(plan.color.replaceFirst('#', '0xFF')));
    final currentDay = provider.getCurrentDay();

    return Column(
      children: plan.days.map((day) {
        final isDone = provider.isDayCompleted(day.day);
        final isCurrent = day.day == currentDay;

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isCurrent ? color.withOpacity(0.5) : isDone ? AppColors.success.withOpacity(0.3) : Colors.transparent),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: isCurrent,
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  color: isDone ? AppColors.success.withOpacity(0.1) : isCurrent ? color.withOpacity(0.1) : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: isDone ? AppColors.success : isCurrent ? color : textSub.withOpacity(0.2)),
                ),
                child: Center(
                  child: isDone
                      ? const Icon(Icons.check, size: 18, color: AppColors.success)
                      : Text('${day.day}', style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.bold, color: isCurrent ? color : textSub)),
                ),
              ),
              title: Text(day.title, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: isDone ? AppColors.success : textMain, fontSize: 14)),
              subtitle: Text(day.topic, style: GoogleFonts.inter(fontSize: 11, color: textSub)),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    children: day.tasks.asMap().entries.map((taskEntry) {
                      final taskIdx = taskEntry.key;
                      final task = taskEntry.value;
                      final taskDone = provider.isTaskCompleted(day.day, taskIdx);

                      return GestureDetector(
                        onTap: () => provider.toggleTask(day.day, taskIdx),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          margin: const EdgeInsets.only(bottom: 6),
                          decoration: BoxDecoration(
                            color: taskDone ? AppColors.success.withOpacity(0.05) : (isDark ? AppColors.surface : AppColors.lightSurface),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(children: [
                            Container(
                              width: 22, height: 22,
                              decoration: BoxDecoration(
                                color: taskDone ? AppColors.success : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(color: taskDone ? AppColors.success : textSub.withOpacity(0.3)),
                              ),
                              child: taskDone ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
                            ),
                            const SizedBox(width: 12),
                            Expanded(child: Text(task, style: GoogleFonts.inter(fontSize: 13, color: taskDone ? textSub : textMain, decoration: taskDone ? TextDecoration.lineThrough : null))),
                          ]),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
