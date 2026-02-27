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

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<Topic> allTopics = [];
  bool isLoading = true;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      isLoading = true;
      errorMsg = null;
    });
    try {
      final topics = await loadTopics();
      if (!mounted) return;
      setState(() {
        allTopics = topics;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        errorMsg = e.toString();
      });
    }
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
      drawer: const AppDrawer(activeItem: DrawerItem.progress),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Progress',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMsg != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline_rounded,
                            size: 48, color: AppColors.error),
                        const SizedBox(height: 16),
                        Text('Failed to load topics',
                            style: GoogleFonts.outfit(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: textMain)),
                        const SizedBox(height: 8),
                        Text(errorMsg!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: 12, color: textSub)),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: _load,
                          icon: const Icon(Icons.refresh_rounded),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                )
              : allTopics.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.hourglass_empty_rounded,
                              size: 48, color: AppColors.warning),
                          const SizedBox(height: 16),
                          Text('No topics found',
                              style: GoogleFonts.outfit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: textMain)),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: _load,
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text('Reload'),
                          ),
                        ],
                      ),
                    )
                  : Consumer<UserProgressProvider>(
              builder: (context, progress, _) {
                final totalSubtopics = allTopics.fold<int>(
                    0, (sum, t) => sum + t.subtopics.length);
                final done = progress.completedSubtopics.length;
                final totalTopics = allTopics.length;
                final startedTopics = progress.openedTopics.length;

                return ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    // ── Overall Progress Card ────────────────────────────
                    _buildOverallCard(
                        context, progress, totalSubtopics, done,
                        totalTopics, startedTopics, accentColor, textMain,
                        textSub, cardBg, isDark),
                    const SizedBox(height: 24),

                    // ── Streak ───────────────────────────────────────────
                    _buildStreakCard(context, progress, accentColor, textMain,
                        textSub, cardBg),
                    const SizedBox(height: 24),

                    // ── Topic Breakdown ──────────────────────────────────
                    Text('Topic Breakdown',
                        style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textMain)),
                    const SizedBox(height: 12),
                    ...allTopics.asMap().entries.map((entry) {
                      final t = entry.value;
                      final d = t.subtopics
                          .where((s) =>
                              progress.completedSubtopics.contains(s.name))
                          .length;
                      return _TopicRow(
                        topic: t,
                        done: d,
                        progress: progress,
                        accentColor: accentColor,
                        textMain: textMain,
                        textSub: textSub,
                        cardColor: cardBg,
                        isDark: isDark,
                      ).animate(delay: (entry.key * 40).ms).fadeIn();
                    }),
                    const SizedBox(height: 40),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildOverallCard(
    BuildContext context,
    UserProgressProvider progress,
    int totalSubtopics,
    int done,
    int totalTopics,
    int startedTopics,
    Color accent,
    Color textMain,
    Color textSub,
    Color cardBg,
    bool isDark,
  ) {
    final surfaceBg = isDark ? AppColors.surface : AppColors.lightSurface;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accent.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: progress.completionPercentage,
                      strokeWidth: 10,
                      backgroundColor: surfaceBg,
                      valueColor: AlwaysStoppedAnimation<Color>(accent),
                    ),
                    Center(
                      child: Text(
                        '${(progress.completionPercentage * 100).toStringAsFixed(0)}%',
                        style: GoogleFonts.outfit(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: textMain),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _statRow('Subtopics Done', '$done / $totalSubtopics',
                        AppColors.success, textSub),
                    const SizedBox(height: 8),
                    _statRow('Topics Started', '$startedTopics / $totalTopics',
                        AppColors.info, textSub),
                    const SizedBox(height: 8),
                    _statRow('Weak Topics',
                        '${progress.weakTopics.length}', AppColors.warning, textSub),
                    const SizedBox(height: 8),
                    _statRow('For Revision',
                        '${progress.revisionTopics.length}', AppColors.error, textSub),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _statRow(String label, String value, Color color, Color textSub) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value,
                style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: color)),
            Text(label,
                style: GoogleFonts.inter(fontSize: 11, color: textSub)),
          ],
        ),
      ],
    );
  }

  Widget _buildStreakCard(
    BuildContext context,
    UserProgressProvider progress,
    Color accent,
    Color textMain,
    Color textSub,
    Color cardBg,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.warning.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Text('🔥', style: TextStyle(fontSize: 40)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${progress.streakDays} Day Streak',
                  style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textMain),
                ),
                Text(
                  'Keep opening the app every day!',
                  style: GoogleFonts.inter(fontSize: 12, color: textSub),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms, delay: 100.ms);
  }
}

class _TopicRow extends StatelessWidget {
  final Topic topic;
  final int done;
  final UserProgressProvider progress;
  final Color accentColor;
  final Color textMain;
  final Color textSub;
  final Color cardColor;
  final bool isDark;

  const _TopicRow({
    required this.topic,
    required this.done,
    required this.progress,
    required this.accentColor,
    required this.textMain,
    required this.textSub,
    required this.cardColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final total = topic.subtopics.length;
    final pct = total == 0 ? 0.0 : done / total;
    final isWeak = progress.isWeakTopic(topic.name);
    final isRevision = progress.isRevisionTopic(topic.name);

    Color statusColor = accentColor;
    if (pct == 1.0) statusColor = AppColors.success;
    if (isWeak) statusColor = AppColors.error;

    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => TopicScreen(topic: topic))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: statusColor.withOpacity(0.15)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(topic.name[0],
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                            fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              topic.name,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.bold,
                                  color: textMain,
                                  fontSize: 14),
                            ),
                          ),
                          if (isWeak) ...[
                            const SizedBox(width: 4),
                            _Badge('Weak', AppColors.error),
                          ],
                          if (isRevision) ...[
                            const SizedBox(width: 4),
                            _Badge('Revision', AppColors.warning),
                          ],
                          if (pct == 1.0 && !isWeak) ...[
                            const SizedBox(width: 4),
                            _Badge('Done ✓', AppColors.success),
                          ],
                        ],
                      ),
                      Text('$done / $total subtopics',
                          style:
                              GoogleFonts.inter(fontSize: 11, color: textSub)),
                    ],
                  ),
                ),
                Text(
                  '${(pct * 100).toStringAsFixed(0)}%',
                  style: GoogleFonts.outfit(
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                      fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: pct,
                minHeight: 5,
                backgroundColor: statusColor.withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(statusColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          style: GoogleFonts.outfit(
              fontSize: 10, color: color, fontWeight: FontWeight.bold)),
    );
  }
}
