import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../model/topics.dart';
import '../services/topic_loader.dart';
import '../providers/user_progress_provider.dart';
import '../theme.dart';
import '../widgets/app_drawer.dart';
import 'topic_screen.dart';

class TopicListScreen extends StatefulWidget {
  const TopicListScreen({super.key});

  @override
  State<TopicListScreen> createState() => _TopicListScreenState();
}

class _TopicListScreenState extends State<TopicListScreen>
    with SingleTickerProviderStateMixin {
  List<Topic> allTopics = [];
  bool isLoading = true;
  late TabController _tabController;
  String _search = '';

  final List<String> beginnerTopics = [
    "Arrays", "String", "Linkedlist", "Stack", "Queue"
  ];
  final List<String> intermediateTopics = [
    "Tree", "Hashing", "SortingAlgorithms", "SearchingAlgorithms", "Recursion"
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final topics = await loadTopics();
    setState(() {
      allTopics = topics;
      isLoading = false;
    });
  }

  List<Topic> getTopicsForLevel(int level) {
    final q = _search.toLowerCase();
    List<Topic> filtered;
    if (level == 0) {
      filtered =
          allTopics.where((t) => beginnerTopics.contains(t.name)).toList();
    } else if (level == 1) {
      filtered = allTopics
          .where((t) => intermediateTopics.contains(t.name))
          .toList();
    } else {
      filtered = allTopics
          .where((t) =>
              !beginnerTopics.contains(t.name) &&
              !intermediateTopics.contains(t.name))
          .toList();
    }
    if (q.isEmpty) return filtered;
    return filtered.where((t) => t.name.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final surfaceBg = isDark ? AppColors.surface : AppColors.lightSurface;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(activeItem: DrawerItem.topics),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Topics',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Column(
            children: [
              // Search bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  onChanged: (v) => setState(() => _search = v),
                  style: GoogleFonts.inter(color: textMain),
                  decoration: InputDecoration(
                    hintText: 'Search topics...',
                    hintStyle: GoogleFonts.inter(color: textSub),
                    prefixIcon: Icon(Icons.search_rounded, color: textSub),
                    fillColor: surfaceBg,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              // Tab bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: surfaceBg,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: accentColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: textSub,
                  labelStyle: GoogleFonts.outfit(
                      fontWeight: FontWeight.bold, fontSize: 13),
                  overlayColor:
                      WidgetStateProperty.all(Colors.transparent),
                  padding: const EdgeInsets.all(4),
                  tabs: const [
                    Tab(text: "Beginner"),
                    Tab(text: "Intermediate"),
                    Tab(text: "Advanced"),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _TopicList(
                    topics: getTopicsForLevel(0),
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    cardColor: cardBg),
                _TopicList(
                    topics: getTopicsForLevel(1),
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    cardColor: cardBg),
                _TopicList(
                    topics: getTopicsForLevel(2),
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    cardColor: cardBg),
              ],
            ),
    );
  }
}

class _TopicList extends StatelessWidget {
  final List<Topic> topics;
  final Color accentColor;
  final Color textMain;
  final Color textSub;
  final Color cardColor;

  const _TopicList({
    required this.topics,
    required this.accentColor,
    required this.textMain,
    required this.textSub,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    if (topics.isEmpty) {
      return Center(
          child: Text("No topics found.",
              style: GoogleFonts.inter(fontSize: 16, color: textSub)));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: topics.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _TopicCard(
          topic: topics[index],
          accentColor: accentColor,
          textMain: textMain,
          textSub: textSub,
          cardColor: cardColor,
        ).animate(delay: (index * 50).ms).fadeIn().slideX(begin: 0.1, end: 0);
      },
    );
  }
}

class _TopicCard extends StatelessWidget {
  final Topic topic;
  final Color accentColor;
  final Color textMain;
  final Color textSub;
  final Color cardColor;

  const _TopicCard({
    required this.topic,
    required this.accentColor,
    required this.textMain,
    required this.textSub,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        final done = topic.subtopics
            .where((s) => progress.completedSubtopics.contains(s.name))
            .length;
        final total = topic.subtopics.length;
        final pct = total == 0 ? 0.0 : done / total;
        final isWeak = progress.isWeakTopic(topic.name);

        return Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isWeak
                  ? AppColors.error.withOpacity(0.4)
                  : accentColor.withOpacity(0.1),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TopicScreen(topic: topic)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        topic.name[0],
                        style: GoogleFonts.outfit(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                topic.name,
                                style: GoogleFonts.outfit(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: textMain),
                              ),
                            ),
                            if (isWeak)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.error.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text('Weak',
                                    style: GoogleFonts.outfit(
                                        fontSize: 11,
                                        color: AppColors.error,
                                        fontWeight: FontWeight.bold)),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$done/$total subtopics completed',
                          style: GoogleFonts.inter(
                              fontSize: 12, color: textSub),
                        ),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: pct,
                            minHeight: 4,
                            backgroundColor: accentColor.withOpacity(0.1),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(accentColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 14, color: textSub),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
