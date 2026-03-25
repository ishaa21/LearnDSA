import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../providers/aptitude_provider.dart';
import '../models/aptitude.dart';
import '../widgets/app_drawer.dart';

class AptitudeScreen extends StatefulWidget {
  const AptitudeScreen({super.key});

  @override
  State<AptitudeScreen> createState() => _AptitudeScreenState();
}

class _AptitudeScreenState extends State<AptitudeScreen> {
  final _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
      drawer: const AppDrawer(activeItem: DrawerItem.aptitude),
      appBar: AppBar(
        backgroundColor: bg,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: GoogleFonts.inter(color: textMain),
                decoration: InputDecoration(hintText: 'Search topics...', border: InputBorder.none, hintStyle: GoogleFonts.inter(color: textSub)),
                onChanged: (_) => setState(() {}),
              )
            : Text('Aptitude', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search, color: textSub),
            onPressed: () => setState(() { _isSearching = !_isSearching; if (!_isSearching) _searchController.clear(); }),
          ),
        ],
      ),
      body: Consumer<AptitudeProvider>(
        builder: (context, provider, _) {
          if (provider.sections.isEmpty) return const Center(child: CircularProgressIndicator());

          if (_isSearching && _searchController.text.isNotEmpty) {
            return _buildSearchResults(provider, textMain, textSub, cardColor, accentColor, isDark);
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Hero banner
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [accentColor.withOpacity(0.85), const Color(0xFF7C3AED)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    const Text('🧠', style: TextStyle(fontSize: 36)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Aptitude Mastery', style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text('${provider.totalTopics} topics across ${provider.sections.length} categories', style: GoogleFonts.inter(fontSize: 12, color: Colors.white70)),
                    ])),
                  ]),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
                    child: Text('Master all aptitude concepts with formulas, key points, and solved examples.', style: GoogleFonts.inter(fontSize: 12, color: Colors.white, height: 1.4)),
                  ),
                ]),
              ).animate().fadeIn(duration: 500.ms),
              const SizedBox(height: 24),

              // Sections
              ...provider.sections.asMap().entries.map((entry) {
                final idx = entry.key;
                final section = entry.value;
                final color = Color(int.parse(section.color.replaceFirst('#', '0xFF')));

                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text(section.emoji, style: const TextStyle(fontSize: 24)),
                    const SizedBox(width: 10),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(section.name, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                      Text('${section.topics.length} topics', style: GoogleFonts.inter(fontSize: 12, color: textSub)),
                    ])),
                  ]).animate().fadeIn(duration: 400.ms, delay: (100 * idx).ms),
                  const SizedBox(height: 12),

                  ...section.topics.asMap().entries.map((topicEntry) {
                    final tIdx = topicEntry.key;
                    final topic = topicEntry.value;

                    return GestureDetector(
                      onTap: () => _openTopicDetail(context, topic, color, section.emoji),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: color.withOpacity(0.12)),
                        ),
                        child: Row(children: [
                          Container(
                            width: 40, height: 40,
                            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                            child: Center(child: Text('${tIdx + 1}', style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: color))),
                          ),
                          const SizedBox(width: 14),
                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(topic.name, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: textMain)),
                            const SizedBox(height: 2),
                            Text(topic.description, style: GoogleFonts.inter(fontSize: 11, color: textSub), maxLines: 2, overflow: TextOverflow.ellipsis),
                          ])),
                          Icon(Icons.arrow_forward_ios_rounded, size: 14, color: textSub),
                        ]),
                      ),
                    ).animate().fadeIn(duration: 300.ms, delay: (50 * tIdx).ms);
                  }),
                  const SizedBox(height: 16),
                ]);
              }),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchResults(AptitudeProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    final results = provider.searchTopics(_searchController.text);
    if (results.isEmpty) return Center(child: Text('No topics found', style: GoogleFonts.inter(color: textSub)));
    return ListView(
      padding: const EdgeInsets.all(20),
      children: results.map((topic) => GestureDetector(
        onTap: () => _openTopicDetail(context, topic, accent, '📖'),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(topic.name, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
            const SizedBox(height: 4),
            Text(topic.description, style: GoogleFonts.inter(fontSize: 12, color: textSub), maxLines: 2, overflow: TextOverflow.ellipsis),
          ]),
        ),
      )).toList(),
    );
  }

  void _openTopicDetail(BuildContext context, AptitudeTopic topic, Color color, String emoji) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => _AptitudeTopicDetailScreen(topic: topic, color: color, emoji: emoji)));
  }
}

// ── Topic Detail Screen ────────────────────────────────────────────────────
class _AptitudeTopicDetailScreen extends StatelessWidget {
  final AptitudeTopic topic;
  final Color color;
  final String emoji;
  const _AptitudeTopicDetailScreen({required this.topic, required this.color, required this.emoji});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(backgroundColor: bg, title: Text(topic.name, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain, fontSize: 18))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color.withOpacity(0.8), color], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('$emoji ${topic.name}', style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 8),
              Text(topic.description, style: GoogleFonts.inter(fontSize: 13, color: Colors.white.withOpacity(0.9), height: 1.5)),
            ]),
          ).animate().fadeIn(duration: 400.ms),
          const SizedBox(height: 20),

          // Key Points
          if (topic.keyPoints.isNotEmpty) ...[
            _sectionTitle('📌 Key Points', textMain),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(16)),
              child: Column(children: topic.keyPoints.asMap().entries.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      width: 24, height: 24, margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(color: color.withOpacity(0.12), shape: BoxShape.circle),
                      child: Center(child: Text('${e.key + 1}', style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.bold, color: color))),
                    ),
                    Expanded(child: Text(e.value, style: GoogleFonts.inter(fontSize: 13, color: textMain, height: 1.5))),
                  ]),
                );
              }).toList()),
            ).animate().fadeIn(duration: 400.ms, delay: 100.ms),
            const SizedBox(height: 20),
          ],

          // Formulas
          if (topic.formulas.isNotEmpty) ...[
            _sectionTitle('📝 Formulas', textMain),
            const SizedBox(height: 10),
            ...topic.formulas.asMap().entries.map((e) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color.withOpacity(0.15)),
                ),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.functions_rounded, size: 18, color: color),
                  const SizedBox(width: 10),
                  Expanded(child: Text(e.value, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: textMain, height: 1.4))),
                ]),
              ).animate().fadeIn(duration: 300.ms, delay: (50 * e.key).ms);
            }),
            const SizedBox(height: 20),
          ],

          // Solved Example
          if (topic.example != null) ...[
            _sectionTitle('💡 Solved Example', textMain),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withOpacity(0.2)),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(12)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Question', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
                    const SizedBox(height: 6),
                    Text(topic.example!.question, style: GoogleFonts.inter(fontSize: 14, color: textMain, height: 1.5)),
                  ]),
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.success.withOpacity(0.15)),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Solution', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.success)),
                    const SizedBox(height: 6),
                    Text(topic.example!.solution, style: GoogleFonts.inter(fontSize: 13, color: textMain, height: 1.6)),
                  ]),
                ),
              ]),
            ).animate().fadeIn(duration: 400.ms, delay: 200.ms),
          ],

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, Color textMain) {
    return Text(title, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: textMain));
  }
}
