import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../providers/user_progress_provider.dart';
import '../services/topic_loader.dart';
import '../model/topics.dart';
import '../theme.dart';
import '../widgets/app_drawer.dart';
import 'topic_screen.dart';

enum _RevisionFilter { weak, notCompleted, revision }

class RevisionScreen extends StatefulWidget {
  const RevisionScreen({super.key});

  @override
  State<RevisionScreen> createState() => _RevisionScreenState();
}

class _RevisionScreenState extends State<RevisionScreen> {
  List<Topic> allTopics = [];
  bool isLoading = true;
  Set<_RevisionFilter> activeFilters = {_RevisionFilter.weak};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final topics = await loadTopics();
    setState(() {
      allTopics = topics;
      isLoading = false;
    });
  }

  List<Topic> _getFiltered(UserProgressProvider progress) {
    return allTopics.where((t) {
      bool show = false;
      if (activeFilters.contains(_RevisionFilter.weak) &&
          progress.isWeakTopic(t.name)) show = true;
      if (activeFilters.contains(_RevisionFilter.revision) &&
          progress.isRevisionTopic(t.name)) show = true;
      if (activeFilters.contains(_RevisionFilter.notCompleted)) {
        final done = t.subtopics
            .where((s) => progress.completedSubtopics.contains(s.name))
            .length;
        if (done < t.subtopics.length) show = true;
      }
      return show;
    }).toList();
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
      drawer: const AppDrawer(activeItem: DrawerItem.dashboard),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Revision Mode',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<UserProgressProvider>(
              builder: (context, progress, _) {
                final filtered = _getFiltered(progress);

                return Column(
                  children: [
                    // ── Filter chips ──────────────────────────────────────
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                      child: Row(
                        children: [
                          _FilterChip(
                            label: '⚠️ Weak',
                            isActive: activeFilters
                                .contains(_RevisionFilter.weak),
                            color: AppColors.error,
                            onTap: () => setState(() {
                              activeFilters.contains(_RevisionFilter.weak)
                                  ? activeFilters.remove(_RevisionFilter.weak)
                                  : activeFilters.add(_RevisionFilter.weak);
                            }),
                          ),
                          const SizedBox(width: 8),
                          _FilterChip(
                            label: '🔄 Revision',
                            isActive: activeFilters
                                .contains(_RevisionFilter.revision),
                            color: AppColors.warning,
                            onTap: () => setState(() {
                              activeFilters.contains(_RevisionFilter.revision)
                                  ? activeFilters
                                      .remove(_RevisionFilter.revision)
                                  : activeFilters
                                      .add(_RevisionFilter.revision);
                            }),
                          ),
                          const SizedBox(width: 8),
                          _FilterChip(
                            label: '📌 Incomplete',
                            isActive: activeFilters
                                .contains(_RevisionFilter.notCompleted),
                            color: AppColors.info,
                            onTap: () => setState(() {
                              activeFilters
                                      .contains(_RevisionFilter.notCompleted)
                                  ? activeFilters
                                      .remove(_RevisionFilter.notCompleted)
                                  : activeFilters
                                      .add(_RevisionFilter.notCompleted);
                            }),
                          ),
                        ],
                      ),
                    ),

                    // Info bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${filtered.length} topics matched',
                          style: GoogleFonts.inter(
                              fontSize: 12, color: textSub),
                        ),
                      ),
                    ),

                    // List
                    Expanded(
                      child: filtered.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('🎉',
                                      style: TextStyle(fontSize: 48)),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No topics match the selected filters.',
                                    style: GoogleFonts.inter(
                                        fontSize: 16, color: textSub),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : ListView.separated(
                              padding: const EdgeInsets.all(16),
                              itemCount: filtered.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final t = filtered[index];
                                final done = t.subtopics
                                    .where((s) => progress.completedSubtopics
                                        .contains(s.name))
                                    .length;
                                final pct = t.subtopics.isEmpty
                                    ? 0.0
                                    : done / t.subtopics.length;
                                final isWeak =
                                    progress.isWeakTopic(t.name);
                                final isRevision =
                                    progress.isRevisionTopic(t.name);

                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            TopicScreen(topic: t)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: cardBg,
                                      borderRadius:
                                          BorderRadius.circular(18),
                                      border: Border.all(
                                          color: isWeak
                                              ? AppColors.error
                                                  .withOpacity(0.3)
                                              : accentColor
                                                  .withOpacity(0.15)),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 44,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                color: accentColor
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  t.name[0],
                                                  style: GoogleFonts.outfit(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 18,
                                                    color: accentColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(t.name,
                                                      style:
                                                          GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: textMain,
                                                        fontSize: 16,
                                                      )),
                                                  Text(
                                                      '$done/${t.subtopics.length} subtopics',
                                                      style:
                                                          GoogleFonts.inter(
                                                              fontSize: 12,
                                                              color: textSub)),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                if (isWeak)
                                                  _RevBadge(
                                                      '⚠️ Weak',
                                                      AppColors.error),
                                                if (isRevision)
                                                  _RevBadge(
                                                      '🔄 Revision',
                                                      AppColors.warning),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: LinearProgressIndicator(
                                            value: pct,
                                            minHeight: 5,
                                            backgroundColor: accentColor
                                                .withOpacity(0.1),
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    isWeak
                                                        ? AppColors.error
                                                        : accentColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).animate(delay: (index * 50).ms).fadeIn();
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final Color color;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? color.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: isActive ? color : color.withOpacity(0.3)),
        ),
        child: Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 13,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _RevBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _RevBadge(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label,
          style: GoogleFonts.outfit(
              fontSize: 11, color: color, fontWeight: FontWeight.bold)),
    );
  }
}
