import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../providers/formula_provider.dart';
import '../models/formula.dart';
import '../widgets/app_drawer.dart';

class FormulaBankScreen extends StatefulWidget {
  const FormulaBankScreen({super.key});

  @override
  State<FormulaBankScreen> createState() => _FormulaBankScreenState();
}

class _FormulaBankScreenState extends State<FormulaBankScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  bool _isSearching = false;
  bool _showBookmarksOnly = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
      drawer: const AppDrawer(activeItem: DrawerItem.formulaBank),
      appBar: AppBar(
        backgroundColor: bg,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: GoogleFonts.inter(color: textMain),
                decoration: InputDecoration(hintText: 'Search formulas...', border: InputBorder.none, hintStyle: GoogleFonts.inter(color: textSub)),
                onChanged: (q) => setState(() {}),
              )
            : Text('Formula Bank', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search, color: textSub),
            onPressed: () => setState(() {
              _isSearching = !_isSearching;
              if (!_isSearching) _searchController.clear();
            }),
          ),
          IconButton(
            icon: Icon(_showBookmarksOnly ? Icons.bookmark : Icons.bookmark_border, color: _showBookmarksOnly ? AppColors.warning : textSub),
            onPressed: () => setState(() => _showBookmarksOnly = !_showBookmarksOnly),
          ),
          IconButton(
            icon: Icon(Icons.style_rounded, color: textSub),
            onPressed: () => _openFlashcardMode(context),
          ),
        ],
      ),
      body: Consumer<FormulaProvider>(
        builder: (context, provider, _) {
          if (provider.categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // Search results
          if (_isSearching && _searchController.text.isNotEmpty) {
            return _buildSearchResults(provider, textMain, textSub, cardColor, accentColor, isDark);
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Flashcard mode banner
              _buildFlashcardBanner(context, provider, accentColor, textMain),
              const SizedBox(height: 20),

              // Categories
              ...provider.categories.asMap().entries.map((entry) {
                final idx = entry.key;
                final category = entry.value;
                final color = Color(int.parse(category.color.replaceFirst('#', '0xFF')));

                return _buildCategorySection(
                  category, provider, color,
                  textMain, textSub, cardColor, isDark, idx,
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFlashcardBanner(BuildContext context, FormulaProvider provider, Color accent, Color textMain) {
    return GestureDetector(
      onTap: () => _openFlashcardMode(context),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [accent.withOpacity(0.8), accent], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Flashcard Revision', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text('Swipe through formulas to revise', style: GoogleFonts.inter(fontSize: 12, color: Colors.white70)),
                ],
              ),
            ),
            const Text('🃏', style: TextStyle(fontSize: 36)),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildCategorySection(FormulaCategory category, FormulaProvider provider, Color color, Color textMain, Color textSub, Color cardColor, bool isDark, int idx) {
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
            Text(category.name, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
          ],
        ).animate().fadeIn(duration: 400.ms, delay: (100 * idx).ms),
        const SizedBox(height: 12),

        ...category.topics.map((topic) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.15)),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(topic.name, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: textMain, fontSize: 15)),
                subtitle: Text('${topic.formulas.length} formulas', style: GoogleFonts.inter(fontSize: 11, color: textSub)),
                children: topic.formulas.map((formula) {
                  final key = '${category.id}_${topic.name}_${formula.title}';
                  final isBookmarked = provider.isBookmarked(key);

                  if (_showBookmarksOnly && !isBookmarked) return const SizedBox.shrink();

                  return Container(
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.surface : AppColors.lightSurface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(formula.title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain, fontSize: 14))),
                            GestureDetector(
                              onTap: () => provider.toggleBookmark(key),
                              child: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border, size: 20, color: isBookmarked ? AppColors.warning : textSub),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: color.withOpacity(0.15)),
                          ),
                          child: Text(formula.formula, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: color)),
                        ),
                        const SizedBox(height: 8),
                        Text(formula.description, style: GoogleFonts.inter(fontSize: 12, color: textSub, height: 1.4)),
                        if (formula.example.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text('Example: ${formula.example}', style: GoogleFonts.inter(fontSize: 12, color: textMain, fontStyle: FontStyle.italic)),
                        ],
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        }),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSearchResults(FormulaProvider provider, Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    final results = provider.searchFormulas(_searchController.text);
    if (results.isEmpty) {
      return Center(child: Text('No formulas found', style: GoogleFonts.inter(color: textSub)));
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: results.map((entry) {
        final category = entry.key;
        final formulas = entry.value;
        final color = Color(int.parse(category.color.replaceFirst('#', '0xFF')));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category.name, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: textMain)),
            const SizedBox(height: 8),
            ...formulas.map((formula) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(formula.title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
                  const SizedBox(height: 6),
                  Text(formula.formula, style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: color)),
                  const SizedBox(height: 4),
                  Text(formula.description, style: GoogleFonts.inter(fontSize: 12, color: textSub)),
                ],
              ),
            )),
            const SizedBox(height: 12),
          ],
        );
      }).toList(),
    );
  }

  void _openFlashcardMode(BuildContext context) {
    final provider = Provider.of<FormulaProvider>(context, listen: false);
    final formulas = provider.getAllFormulas();
    if (formulas.isEmpty) return;

    Navigator.push(context, MaterialPageRoute(builder: (_) => _FormulaFlashcardScreen(formulas: formulas)));
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'calculate': return Icons.calculate;
      case 'code': return Icons.code;
      case 'computer': return Icons.computer;
      case 'storage': return Icons.storage;
      default: return Icons.functions;
    }
  }
}

// ── Flashcard Screen ──────────────────────────────────────────────────────────

class _FormulaFlashcardScreen extends StatefulWidget {
  final List<Formula> formulas;
  const _FormulaFlashcardScreen({required this.formulas});

  @override
  State<_FormulaFlashcardScreen> createState() => _FormulaFlashcardScreenState();
}

class _FormulaFlashcardScreenState extends State<_FormulaFlashcardScreen> {
  late PageController _pageController;
  int _current = 0;
  bool _showAnswer = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Flashcards (${_current + 1}/${widget.formulas.length})', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain, fontSize: 16)),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.formulas.length,
        onPageChanged: (i) => setState(() { _current = i; _showAnswer = false; }),
        itemBuilder: (_, index) {
          final formula = widget.formulas[index];
          return Padding(
            padding: const EdgeInsets.all(24),
            child: GestureDetector(
              onTap: () => setState(() => _showAnswer = !_showAnswer),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: Container(
                  key: ValueKey(_showAnswer),
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.card : AppColors.lightCard,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: accentColor.withOpacity(0.2)),
                    boxShadow: [BoxShadow(color: accentColor.withOpacity(0.1), blurRadius: 20)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _showAnswer
                        ? [
                            Text(formula.formula, style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold, color: accentColor), textAlign: TextAlign.center),
                            const SizedBox(height: 20),
                            Text(formula.description, style: GoogleFonts.inter(fontSize: 14, color: textSub, height: 1.5), textAlign: TextAlign.center),
                            const SizedBox(height: 16),
                            if (formula.example.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(color: AppColors.info.withOpacity(0.08), borderRadius: BorderRadius.circular(10)),
                                child: Text('Example: ${formula.example}', style: GoogleFonts.inter(fontSize: 13, color: textMain), textAlign: TextAlign.center),
                              ),
                            const SizedBox(height: 20),
                            Text('Tap to see question', style: GoogleFonts.inter(fontSize: 11, color: textSub)),
                          ]
                        : [
                            const Text('🤔', style: TextStyle(fontSize: 48)),
                            const SizedBox(height: 20),
                            Text(formula.title, style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: textMain), textAlign: TextAlign.center),
                            const SizedBox(height: 12),
                            Text('Tap to reveal formula', style: GoogleFonts.inter(fontSize: 13, color: textSub)),
                          ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
