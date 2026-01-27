import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'model/topics.dart';
import 'services/topic_loader.dart';
import 'theme.dart';
import 'screens/topic_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/bookmarks_screen.dart';

import 'providers/settings_provider.dart';
import 'providers/user_progress_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<Topic> allTopics = [];
  bool isLoading = true;
  late TabController _tabController;

  final List<String> beginnerTopics = ["Arrays", "String", "Linkedlist", "Stack", "Queue"];
  final List<String> intermediateTopics = ["Tree", "Hashing", "SortingAlgorithms", "SearchingAlgorithms", "Recursion"];

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
    if (level == 0) { // Beginner
      return allTopics.where((t) => beginnerTopics.contains(t.name)).toList();
    } else if (level == 1) { // Intermediate
      return allTopics.where((t) => intermediateTopics.contains(t.name)).toList();
    } else { // Advanced (Everything else)
      return allTopics.where((t) => !beginnerTopics.contains(t.name) && !intermediateTopics.contains(t.name)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildProgressSummary(context),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.card.withOpacity(0.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.accent,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2)),
                  ],
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.textSub,
                labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                padding: const EdgeInsets.all(4),
                tabs: const [
                  Tab(text: "Beginner"),
                  Tab(text: "Intermediate"),
                  Tab(text: "Advanced"),
                ],
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        _TopicList(topics: getTopicsForLevel(0)),
                        _TopicList(topics: getTopicsForLevel(1)),
                        _TopicList(topics: getTopicsForLevel(2)),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSummary(BuildContext context) {
    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        final topicsCount = progress.openedTopics.length;
        final practicesCount = progress.openedPractices.length;

        if (topicsCount == 0 && practicesCount == 0) return const SizedBox.shrink();

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.accent.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.accent.withOpacity(0.1)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.rocket_launch_rounded, color: AppColors.accent, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Learning Journey",
                      style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textMain),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "You've explored $topicsCount topics and attempted $practicesCount practice challenges. Keep it up!",
                      style: GoogleFonts.inter(fontSize: 13, color: AppColors.textSub, height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animate().fadeIn().slideY(begin: 0.1, end: 0);
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getGreeting(),
                  style: GoogleFonts.outfit(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textMain,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  "Ready to master DSA today?",
                  style: GoogleFonts.inter(fontSize: 14, color: AppColors.textSub),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.card,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.bookmark_rounded, color: AppColors.textMain, size: 20),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BookmarksScreen())),
              ),
              const SizedBox(width: 12),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.card,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.settings_rounded, color: AppColors.textMain, size: 20),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen())),
              ),
            ],
          )
        ],
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 5) return "Hey Night Owl! 🦉";
    if (hour < 12) return "Good Morning! ☀️";
    if (hour < 17) return "Good Afternoon! 🚀";
    return "Good Evening! 🌙";
  }
}

class _TopicList extends StatelessWidget {
  final List<Topic> topics;

  const _TopicList({required this.topics});

  @override
  Widget build(BuildContext context) {
    if (topics.isEmpty) {
      return Center(child: Text("No topics found.", style: GoogleFonts.inter(fontSize: 16, color: AppColors.textSub)));
    }
    
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: topics.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return _TopicCard(topic: topics[index]).animate(delay: (index * 50).ms).fadeIn().slideX(begin: 0.1, end: 0);
      },
    );
  }
}

class _TopicCard extends StatelessWidget {
  final Topic topic;

  const _TopicCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        final isOpened = progress.openedTopics.contains(topic.name);
        
        return Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.textSub.withOpacity(0.05)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TopicScreen(topic: topic)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                   Container(
                     width: 52,
                     height: 52,
                     decoration: BoxDecoration(
                       color: isOpened ? AppColors.accent.withOpacity(0.1) : AppColors.surface,
                       borderRadius: BorderRadius.circular(14),
                     ),
                     child: Center(
                       child: Text(
                         topic.name[0],
                         style: GoogleFonts.outfit(
                           fontSize: 24, 
                           fontWeight: FontWeight.bold, 
                           color: isOpened ? AppColors.accent : AppColors.textMain
                         ),
                       ),
                     ),
                   ),
                   const SizedBox(width: 16),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           topic.name, 
                           style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textMain)
                         ),
                         const SizedBox(height: 4),
                         Text(
                           "${topic.subtopics.length} core concepts", 
                           style: GoogleFonts.inter(fontSize: 13, color: AppColors.textSub)
                         ),
                       ],
                     ),
                   ),
                   if (isOpened)
                     const Icon(Icons.check_circle_rounded, color: AppColors.accent, size: 20),
                   const SizedBox(width: 8),
                   const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textSub),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
