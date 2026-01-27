import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/topics.dart';
import '../providers/user_progress_provider.dart';
import 'subtopic_screen.dart';
import '../theme.dart';

class TopicScreen extends StatefulWidget {
  final Topic topic;

  const TopicScreen({super.key, required this.topic});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  void initState() {
    super.initState();
    // Record progress
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProgressProvider>(context, listen: false).recordTopicOpened(widget.topic.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            pinned: true,
            backgroundColor: AppColors.background,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textMain),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Consumer<UserProgressProvider>(
                builder: (context, progress, _) {
                  final isBookmarked = progress.isTopicBookmarked(widget.topic.name);
                  return IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                      color: isBookmarked ? AppColors.accent : AppColors.textMain,
                    ),
                    onPressed: () => progress.toggleTopicBookmark(widget.topic.name),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 16),
              title: Text(
                widget.topic.name,
                style: GoogleFonts.outfit(
                  color: AppColors.textMain,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Divider(color: AppColors.textSub.withOpacity(0.1), thickness: 1),
            ),
          ),
          
          // 1. Topic Info
          if (widget.topic.description != null)
            SliverToBoxAdapter(
              child: _SectionCard(
                title: "Topic Info",
                icon: Icons.description_rounded,
                content: widget.topic.description!,
                color: Colors.blueAccent,
                delay: 0,
              ),
            ),

          // 2. Real World Application
          if (widget.topic.realWorldApplication != null)
            SliverToBoxAdapter(
              child: _SectionCard(
                title: "Real World Application",
                icon: Icons.public_rounded,
                content: widget.topic.realWorldApplication!,
                color: Colors.green,
                delay: 100,
              ),
            ),

          // 3. Algorithm (only if applicable)
          if (widget.topic.algorithm != null)
            SliverToBoxAdapter(
              child: _SectionCard(
                title: "Algorithm",
                icon: Icons.code_rounded,
                content: widget.topic.algorithm!,
                codeFont: true,
                color: Colors.purpleAccent,
                delay: 200,
              ),
            ),

          // 4. Time & Space Complexity
          if (widget.topic.timeComplexity != null)
            SliverToBoxAdapter(
              child: _SectionCard(
                title: "Complexity",
                icon: Icons.timer_rounded,
                content: widget.topic.timeComplexity!,
                codeFont: true,
                color: Colors.orangeAccent,
                delay: 300,
              ),
            ),

          // 5. Subtopics List
           SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Subtopics", 
                style: GoogleFonts.outfit(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: AppColors.textMain
                )
              ),
            ),
          ),
          
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final subtopic = widget.topic.subtopics[index];
                  return _SubtopicCard(topic: widget.topic.name, subtopic: subtopic, index: index)
                      .animate(delay: (index * 50 + 400).ms).fadeIn().slideX(begin: 0.05, end: 0);
                },
                childCount: widget.topic.subtopics.length,
              ),
            ),
          ),
          
          const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;
  final bool codeFont;
  final int delay;

  const _SectionCard({
    required this.title,
    required this.content,
    required this.icon,
    required this.color,
    this.codeFont = false,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: codeFont 
                ? GoogleFonts.firaCode(fontSize: 14, color: AppColors.textSub, height: 1.6)
                : GoogleFonts.inter(fontSize: 15, color: AppColors.textSub, height: 1.6),
            ),
          ],
        ),
      ),
    ).animate(delay: delay.ms).fadeIn().slideY(begin: 0.1, end: 0);
  }
}

class _SubtopicCard extends StatelessWidget {
  final String topic;
  final String subtopic;
  final int index;

  const _SubtopicCard({required this.topic, required this.subtopic, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProgressProvider>(
      builder: (context, progress, _) {
        final isOpened = progress.openedSubtopics.contains(subtopic);
        final isBookmarked = progress.isSubtopicBookmarked(subtopic);

        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 12),
          color: AppColors.card,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: isOpened ? BorderSide(color: AppColors.accent.withOpacity(0.3), width: 1) : BorderSide.none
            ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SubtopicScreen(topic: topic, subtopic: subtopic),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isOpened ? AppColors.accent.withOpacity(0.1) : AppColors.surface,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: isOpened 
                        ? const Icon(Icons.check_circle_rounded, color: AppColors.accent, size: 20)
                        : Text("${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textSub)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      _prettify(subtopic),
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isOpened ? AppColors.textMain : AppColors.textMain.withOpacity(0.8),
                      ),
                    ),
                  ),
                  if (isBookmarked)
                    const Icon(Icons.bookmark_rounded, color: AppColors.accent, size: 20),
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
  
  String _prettify(String raw) {
    String text = raw.replaceFirst(RegExp(r'^\d+_'), '');
    text = text.replaceAll('_', ' ');
    text = text.replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (Match m) => '${m[1]} ${m[2]}');
    return text;
  }
}
