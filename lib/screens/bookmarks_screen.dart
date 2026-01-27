import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../model/topics.dart';
import '../services/topic_loader.dart';
import '../providers/user_progress_provider.dart';
import '../theme.dart';
import 'topic_screen.dart';
import 'subtopic_screen.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  List<Topic> _allTopics = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final topics = await loadTopics();
    if (mounted) {
      setState(() {
        _allTopics = topics;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Bookmarks", style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        foregroundColor: AppColors.textMain,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<UserProgressProvider>(
              builder: (context, progress, _) {
                final bookmarkedTopicNames = progress.bookmarkedTopics;
                final bookmarkedSubtopicIds = progress.bookmarkedSubtopics;

                final bookmarkedTopics = _allTopics
                    .where((t) => bookmarkedTopicNames.contains(t.name))
                    .toList();

                final List<Map<String, dynamic>> bookmarkedSubtopics = [];
                for (var topic in _allTopics) {
                  for (var sub in topic.subtopics) {
                    if (bookmarkedSubtopicIds.contains(sub)) {
                      bookmarkedSubtopics.add({
                        'topic': topic.name,
                        'subtopic': sub,
                      });
                    }
                  }
                }

                if (bookmarkedTopics.isEmpty && bookmarkedSubtopics.isEmpty) {
                  return _buildEmptyState();
                }

                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  children: [
                    if (bookmarkedTopics.isNotEmpty) ...[
                      _buildSectionHeader("Bookmarked Topics"),
                      const SizedBox(height: 16),
                      ...bookmarkedTopics.map((topic) => _buildTopicTile(context, topic)),
                      const SizedBox(height: 32),
                    ],
                    if (bookmarkedSubtopics.isNotEmpty) ...[
                      _buildSectionHeader("Bookmarked Subtopics"),
                      const SizedBox(height: 16),
                      ...bookmarkedSubtopics.map((item) => _buildSubtopicTile(
                            context,
                            item['topic'],
                            item['subtopic'],
                          )),
                    ],
                  ],
                );
              },
            ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.textMain,
      ),
    );
  }

  Widget _buildTopicTile(BuildContext context, Topic topic) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.textSub.withOpacity(0.05)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.accent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              topic.name[0],
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
                fontSize: 20,
              ),
            ),
          ),
        ),
        title: Text(
          topic.name,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: AppColors.textMain,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColors.textSub),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TopicScreen(topic: topic)),
          );
        },
      ),
    ).animate().fadeIn().slideX(begin: 0.1, end: 0);
  }

  Widget _buildSubtopicTile(BuildContext context, String topicName, String subtopicId) {
    final cleanSubtopic = subtopicId.replaceFirst(RegExp(r'^\d+_'), '').replaceAll('_', ' ');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.textSub.withOpacity(0.05)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.purpleAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.description_rounded, color: Colors.purpleAccent, size: 20),
        ),
        title: Text(
          cleanSubtopic,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: AppColors.textMain,
          ),
        ),
        subtitle: Text(
          topicName,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textSub,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColors.textSub),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SubtopicScreen(topic: topicName, subtopic: subtopicId),
            ),
          );
        },
      ),
    ).animate().fadeIn().slideX(begin: 0.1, end: 0);
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark_border_rounded, size: 80, color: AppColors.textSub.withOpacity(0.2)),
            const SizedBox(height: 24),
            Text(
              "No bookmarks yet 🌱",
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textMain,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Save topics or subtopics for quick revision and easy access later.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: AppColors.textSub,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
