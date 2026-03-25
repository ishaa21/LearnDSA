import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../providers/interview_provider.dart';
import '../models/interview_question.dart';
import '../widgets/app_drawer.dart';

class InterviewPrepScreen extends StatefulWidget {
  const InterviewPrepScreen({super.key});

  @override
  State<InterviewPrepScreen> createState() => _InterviewPrepScreenState();
}

class _InterviewPrepScreenState extends State<InterviewPrepScreen> {
  final _searchController = TextEditingController();
  bool _isSearching = false;
  bool _showFavoritesOnly = false;
  int _selectedTab = 0; // 0=categories, 1=tips

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
      drawer: const AppDrawer(activeItem: DrawerItem.interviewPrep),
      appBar: AppBar(
        backgroundColor: bg,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: GoogleFonts.inter(color: textMain),
                decoration: InputDecoration(hintText: 'Search questions...', border: InputBorder.none, hintStyle: GoogleFonts.inter(color: textSub)),
                onChanged: (_) => setState(() {}),
              )
            : Text('Interview Prep', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search, color: textSub),
            onPressed: () => setState(() { _isSearching = !_isSearching; if (!_isSearching) _searchController.clear(); }),
          ),
          IconButton(
            icon: Icon(_showFavoritesOnly ? Icons.favorite : Icons.favorite_border, color: _showFavoritesOnly ? AppColors.error : textSub),
            onPressed: () => setState(() => _showFavoritesOnly = !_showFavoritesOnly),
          ),
        ],
      ),
      body: Consumer<InterviewProvider>(
        builder: (context, provider, _) {
          if (provider.categories.isEmpty) return const Center(child: CircularProgressIndicator());

          // Search mode
          if (_isSearching && _searchController.text.isNotEmpty) {
            return _buildSearchResults(provider, textMain, textSub, cardColor, accentColor, isDark);
          }

          // Favorites mode
          if (_showFavoritesOnly) {
            return _buildFavorites(provider, textMain, textSub, cardColor, accentColor, isDark);
          }

          return Column(
            children: [
              // Tab bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    _TabButton(label: 'Questions', isSelected: _selectedTab == 0, color: accentColor, onTap: () => setState(() => _selectedTab = 0)),
                    const SizedBox(width: 8),
                    _TabButton(label: 'Tips', isSelected: _selectedTab == 1, color: accentColor, onTap: () => setState(() => _selectedTab = 1)),
                  ],
                ),
              ),

              Expanded(
                child: _selectedTab == 0
                    ? _buildCategoriesList(provider, textMain, textSub, cardColor, accentColor, isDark)
                    : _buildTipsList(provider, textMain, textSub, cardColor, accentColor, isDark),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoriesList(InterviewProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: provider.categories.asMap().entries.map((entry) {
        final idx = entry.key;
        final category = entry.value;
        final color = Color(int.parse(category.color.replaceFirst('#', '0xFF')));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36, height: 36,
                  decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
                  child: Icon(_getIcon(category.icon), color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(category.name, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain))),
              ],
            ).animate().fadeIn(duration: 400.ms, delay: (80 * idx).ms),
            const SizedBox(height: 12),

            ...category.subcategories.map((sub) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(16), border: Border.all(color: color.withOpacity(0.15))),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: Text(sub.name, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: textMain, fontSize: 15)),
                    subtitle: Text('${sub.questions.length} questions', style: GoogleFonts.inter(fontSize: 11, color: textSub)),
                    children: sub.questions.map((q) => _buildQuestionTile(q, provider, textMain, textSub, cardColor, accent, color, isDark)).toList(),
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildQuestionTile(InterviewQuestion q, InterviewProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, Color catColor, bool isDark) {
    final isFav = provider.isFavorite(q.id);
    final diffColor = q.difficulty == 'Easy' ? AppColors.success : q.difficulty == 'Medium' ? AppColors.warning : AppColors.error;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 14),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          title: Text(q.question, style: GoogleFonts.inter(fontSize: 13, color: textMain, fontWeight: FontWeight.w500)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: diffColor.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                child: Text(q.difficulty, style: GoogleFonts.inter(fontSize: 9, color: diffColor, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: () => provider.toggleFavorite(q.id),
                child: Icon(isFav ? Icons.favorite : Icons.favorite_border, size: 18, color: isFav ? AppColors.error : textSub),
              ),
            ],
          ),
          children: [
            SelectableText(q.answer, style: GoogleFonts.inter(fontSize: 13, color: textMain, height: 1.6)),
            if (q.tags.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                children: q.tags.map((tag) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: accent.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                  child: Text(tag, style: GoogleFonts.inter(fontSize: 10, color: accent)),
                )).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTipsList(InterviewProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: provider.tips.asMap().entries.map((entry) {
        final idx = entry.key;
        final tip = entry.value;
        final tipColor = tip.category == 'Interview' ? const Color(0xFF4A90D9) : tip.category == 'Technical' ? const Color(0xFF7C3AED) : const Color(0xFF2ECC71);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(16), border: Border.all(color: tipColor.withOpacity(0.2))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: tipColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                    child: Text(tip.category, style: GoogleFonts.inter(fontSize: 10, color: tipColor, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(tip.title, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: textMain)),
              const SizedBox(height: 8),
              Text(tip.content, style: GoogleFonts.inter(fontSize: 13, color: textSub, height: 1.5)),
            ],
          ),
        ).animate().fadeIn(duration: 400.ms, delay: (80 * idx).ms);
      }).toList(),
    );
  }

  Widget _buildSearchResults(InterviewProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    final results = provider.search(_searchController.text);
    if (results.isEmpty) return Center(child: Text('No results found', style: GoogleFonts.inter(color: textSub)));

    return ListView(
      padding: const EdgeInsets.all(20),
      children: results.map((q) => _buildQuestionTile(q, provider, textMain, textSub, cardColor, accent, accent, isDark)).toList(),
    );
  }

  Widget _buildFavorites(InterviewProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    final favs = provider.getFavorites();
    if (favs.isEmpty) return Center(child: Text('No favorites yet', style: GoogleFonts.inter(color: textSub)));

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('${favs.length} favorite${favs.length != 1 ? 's' : ''}', style: GoogleFonts.inter(fontSize: 12, color: textSub)),
        const SizedBox(height: 12),
        ...favs.map((q) => _buildQuestionTile(q, provider, textMain, textSub, cardColor, accent, accent, isDark)),
      ],
    );
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'code': return Icons.code;
      case 'people': return Icons.people;
      case 'school': return Icons.school;
      case 'pattern': return Icons.extension;
      default: return Icons.quiz;
    }
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;
  const _TabButton({required this.label, required this.isSelected, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.15) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withOpacity(isSelected ? 0.5 : 0.15)),
          ),
          child: Center(child: Text(label, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: color, fontSize: 14))),
        ),
      ),
    );
  }
}
