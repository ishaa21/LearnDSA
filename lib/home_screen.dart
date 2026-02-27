import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'model/topics.dart';
import 'services/topic_loader.dart';
import 'theme.dart';
import 'screens/topic_screen.dart';
import 'screens/practice_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/revision_screen.dart';
import 'screens/topic_list_screen.dart';
import 'screens/pattern_mode_screen.dart';

import 'providers/user_progress_provider.dart';
import 'widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Topic> allTopics = [];
  bool isLoading = true;

  final List<String> beginnerTopics = [
    "Arrays", "String", "Linkedlist", "Stack", "Queue"
  ];
  final List<String> intermediateTopics = [
    "Tree", "Hashing", "SortingAlgorithms", "SearchingAlgorithms", "Recursion"
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final topics = await loadTopics();
    final progress =
        Provider.of<UserProgressProvider>(context, listen: false);

    // Calculate total subtopics for completion %
    int total = 0;
    for (final t in topics) {
      total += t.subtopics.length;
    }
    progress.totalSubtopics = total;

    setState(() {
      allTopics = topics;
      isLoading = false;
    });
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 5) return "Hey Night Owl! 🦉";
    if (hour < 12) return "Good Morning! ☀️";
    if (hour < 17) return "Good Afternoon! 🚀";
    return "Good Evening! 🌙";
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(activeItem: DrawerItem.dashboard),
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: Text(
          'DSA Dashboard',
          style: GoogleFonts.outfit(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: textMain,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded, color: textSub),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TopicListScreen()),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _load,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 8),

                  // ── Greeting ──────────────────────────────────────────
                  _buildGreeting(context, textMain, textSub),
                  const SizedBox(height: 24),

                  // ── Streak + Completion Row ───────────────────────────
                  _buildStatsRow(context, accentColor, textMain, textSub, isDark),
                  const SizedBox(height: 24),

                  // ── Today's Practice ──────────────────────────────────
                  _buildSectionTitle('🎯 Today\'s Practice', textMain),
                  const SizedBox(height: 12),
                  _buildPracticeCard(context, accentColor, textMain, textSub, isDark),
                  const SizedBox(height: 24),

                  // ── Continue Learning ─────────────────────────────────
                  _buildSectionTitle('📖 Continue Learning', textMain),
                  const SizedBox(height: 12),
                  _buildContinueLearning(context, accentColor, textMain, textSub, isDark),
                  const SizedBox(height: 24),

                  // ── Progress Overview ─────────────────────────────────
                  _buildSectionTitle('📊 Progress Overview', textMain),
                  const SizedBox(height: 12),
                  _buildProgressOverview(context, accentColor, textMain, textSub, isDark),
                  const SizedBox(height: 24),

                  // ── Quick Revision ────────────────────────────────────
                  _buildSectionTitle('⚡ Quick Revision', textMain),
                  const SizedBox(height: 12),
                  _buildRevisionCard(context, accentColor, textMain, textSub, isDark),
                  const SizedBox(height: 24),

                  // ── Pattern Mode ──────────────────────────────────────
                  _buildSectionTitle('🧩 Pattern Mode', textMain),
                  const SizedBox(height: 12),
                  _buildPatternShortcut(context, accentColor, textMain, textSub, isDark),
                  const SizedBox(height: 24),

                  // ── Weak Topics ───────────────────────────────────────
                  _buildSectionTitle('⚠️ Weak Topics', textMain),
                  const SizedBox(height: 12),
                  _buildWeakTopics(context, accentColor, textMain, textSub, isDark),
                  const SizedBox(height: 40),

                ],
              ),
            ),
    );
  }

  // ── Widgets ────────────────────────────────────────────────────────────────

  Widget _buildSectionTitle(String title, Color textMain) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textMain,
      ),
    );
  }

  Widget _buildGreeting(
      BuildContext context, Color textMain, Color textSub) {
    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getGreeting(),
              style: GoogleFonts.outfit(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: textMain,
                letterSpacing: -0.5,
              ),
            ),
            Text(
              'Ready to master DSA today?',
              style: GoogleFonts.inter(fontSize: 14, color: textSub),
            ),
          ],
        ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1, end: 0);
      },
    );
  }

  Widget _buildStatsRow(BuildContext context, Color accent, Color textMain,
      Color textSub, bool isDark) {
    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        final cardColor = isDark ? AppColors.card : AppColors.lightCard;
        return Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: '🔥',
                value: '${progress.streakDays}',
                label: 'Day Streak',
                cardColor: cardColor,
                textMain: textMain,
                textSub: textSub,
                borderColor: accent.withOpacity(0.3),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: '✅',
                value:
                    '${(progress.completionPercentage * 100).toStringAsFixed(0)}%',
                label: 'Completed',
                cardColor: cardColor,
                textMain: textMain,
                textSub: textSub,
                borderColor: AppColors.success.withOpacity(0.3),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: '📝',
                value: '${progress.openedTopics.length}',
                label: 'Topics Started',
                cardColor: cardColor,
                textMain: textMain,
                textSub: textSub,
                borderColor: AppColors.info.withOpacity(0.3),
              ),
            ),
          ],
        ).animate().fadeIn(duration: 500.ms, delay: 100.ms);
      },
    );
  }

  Widget _buildPracticeCard(BuildContext context, Color accent, Color textMain,
      Color textSub, bool isDark) {
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;

    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const PracticeScreen())),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [accent.withOpacity(0.8), accent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: accent.withOpacity(0.3),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5 Questions Ready',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Daily practice • 30 min timer',
                    style: GoogleFonts.inter(
                        fontSize: 12, color: Colors.white70),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Start Practice →',
                      style: GoogleFonts.outfit(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text('🎯', style: TextStyle(fontSize: 44)),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms, delay: 150.ms);
  }

  Widget _buildContinueLearning(BuildContext context, Color accent,
      Color textMain, Color textSub, bool isDark) {
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;

    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        // Find topics that are opened but not all subtopics completed
        final inProgress = allTopics.where((t) {
          if (!progress.openedTopics.contains(t.name)) return false;
          final done = t.subtopics
              .where((s) => progress.completedSubtopics.contains(s.name))
              .length;
          return done < t.subtopics.length;
        }).toList();

        if (inProgress.isEmpty) {
          // Show all beginner topics as starting point
          final starters = allTopics
              .where((t) => beginnerTopics.contains(t.name))
              .take(3)
              .toList();
          return Column(
            children: starters
                .map((t) => _TopicProgressCard(
                      topic: t,
                      progress: progress,
                      accent: accent,
                      textMain: textMain,
                      textSub: textSub,
                      cardColor: cardColor,
                    ))
                .toList(),
          );
        }

        return Column(
          children: inProgress
              .take(3)
              .map((t) => _TopicProgressCard(
                    topic: t,
                    progress: progress,
                    accent: accent,
                    textMain: textMain,
                    textSub: textSub,
                    cardColor: cardColor,
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _buildProgressOverview(BuildContext context, Color accent,
      Color textMain, Color textSub, bool isDark) {
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;

    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        final total = allTopics.length;
        final started = progress.openedTopics.length;
        final completed = allTopics.where((t) {
          final done = t.subtopics
              .where((s) => progress.completedSubtopics.contains(s.name))
              .length;
          return done == t.subtopics.length && t.subtopics.isNotEmpty;
        }).length;
        final weak = progress.weakTopics.length;

        return GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ProgressScreen())),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: (isDark ? AppColors.textSub : AppColors.lightTextSub)
                      .withOpacity(0.1)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Overall Progress',
                      style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textMain),
                    ),
                    Text(
                      '${(progress.completionPercentage * 100).toStringAsFixed(0)}%',
                      style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: accent),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress.completionPercentage,
                    minHeight: 8,
                    backgroundColor:
                        (isDark ? AppColors.surface : AppColors.lightSurface),
                    valueColor: AlwaysStoppedAnimation<Color>(accent),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _ProgressStat(
                        label: 'Total', value: '$total', color: textSub),
                    _ProgressStat(
                        label: 'Started',
                        value: '$started',
                        color: AppColors.info),
                    _ProgressStat(
                        label: 'Done',
                        value: '$completed',
                        color: AppColors.success),
                    _ProgressStat(
                        label: 'Weak',
                        value: '$weak',
                        color: AppColors.warning),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Tap to see detailed progress →',
                  style:
                      GoogleFonts.inter(fontSize: 12, color: textSub),
                ),
              ],
            ),
          ),
        ).animate().fadeIn(duration: 500.ms, delay: 250.ms);
      },
    );
  }

  Widget _buildRevisionCard(BuildContext context, Color accent, Color textMain,
      Color textSub, bool isDark) {
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;

    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const RevisionScreen())),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.warning.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.refresh_rounded,
                  color: AppColors.warning, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Revision Mode',
                    style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textMain),
                  ),
                  Text(
                    'Weak • Not Completed • Marked',
                    style:
                        GoogleFonts.inter(fontSize: 12, color: textSub),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 14, color: textSub),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms, delay: 300.ms);
  }

  Widget _buildPatternShortcut(BuildContext context, Color accent,
      Color textMain, Color textSub, bool isDark) {
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;
    const patternColor = Color(0xFF7C3AED);

    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        final weakPatterns = progress.weakPatterns;
        final subtitle = weakPatterns.isNotEmpty
            ? '⚠️ Weak: ${weakPatterns.take(2).join(', ')}${weakPatterns.length > 2 ? '...' : ''}'
            : 'Learn by pattern — Two Pointers, Sliding Window, DP & more';

        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const PatternModeScreen())),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: patternColor.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: patternColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Center(
                    child: Text('🧩', style: TextStyle(fontSize: 26)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pattern-Based Learning',
                        style: GoogleFonts.outfit(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textMain),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                            fontSize: 12, color: textSub),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 14, color: textSub),
              ],
            ),
          ),
        ).animate().fadeIn(duration: 500.ms, delay: 325.ms);
      },
    );
  }


  Widget _buildWeakTopics(BuildContext context, Color accent, Color textMain,
      Color textSub, bool isDark) {
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;

    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        if (progress.weakTopics.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: (isDark ? AppColors.textSub : AppColors.lightTextSub)
                      .withOpacity(0.1)),
            ),
            child: Row(
              children: [
                const Text('💪', style: TextStyle(fontSize: 28)),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'No weak topics! Mark topics as weak from the topic screen to track them here.',
                    style: GoogleFonts.inter(fontSize: 13, color: textSub),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 500.ms, delay: 350.ms);
        }

        final weakList = allTopics
            .where((t) => progress.weakTopics.contains(t.name))
            .toList();

        return Column(
          children: weakList
              .map(
                (t) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border:
                        Border.all(color: AppColors.error.withOpacity(0.3)),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => TopicScreen(topic: t)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.error.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              t.name[0],
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold,
                                color: AppColors.error,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t.name,
                                  style: GoogleFonts.outfit(
                                      fontWeight: FontWeight.bold,
                                      color: textMain)),
                              Text('${t.subtopics.length} subtopics',
                                  style: GoogleFonts.inter(
                                      fontSize: 12, color: textSub)),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded,
                            size: 14, color: AppColors.error),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ).animate().fadeIn(duration: 500.ms, delay: 350.ms);
      },
    );
  }
}

// ── Reusable Widgets ──────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final Color cardColor;
  final Color textMain;
  final Color textSub;
  final Color borderColor;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.cardColor,
    required this.textMain,
    required this.textSub,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textMain,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: GoogleFonts.inter(fontSize: 10, color: textSub),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopicProgressCard extends StatelessWidget {
  final Topic topic;
  final UserProgressProvider progress;
  final Color accent;
  final Color textMain;
  final Color textSub;
  final Color cardColor;

  const _TopicProgressCard({
    required this.topic,
    required this.progress,
    required this.accent,
    required this.textMain,
    required this.textSub,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    final done = topic.subtopics
        .where((s) => progress.completedSubtopics.contains(s.name))
        .length;
    final total = topic.subtopics.length;
    final pct = total == 0 ? 0.0 : done / total;

    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => TopicScreen(topic: topic))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: accent.withOpacity(0.15)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  topic.name[0],
                  style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: accent),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(topic.name,
                          style: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: textMain)),
                      Text('$done/$total',
                          style: GoogleFonts.inter(
                              fontSize: 12, color: textSub)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: pct,
                      minHeight: 5,
                      backgroundColor: accent.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(accent),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ProgressStat(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(value,
                style: GoogleFonts.outfit(
                    fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(label,
                style: GoogleFonts.inter(fontSize: 10, color: color)),
          ),
        ],
      ),
    );
  }
}
