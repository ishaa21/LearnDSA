import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:google_fonts/google_fonts.dart';

import '../visualizers/visualizer_factory.dart';
import '../model/topic_content.dart';
import '../providers/user_progress_provider.dart';
import '../providers/settings_provider.dart';
import '../theme.dart';
import '../visualization_screen.dart';
import '../visualizers/visual_support.dart'; // verify path

class SubtopicScreen extends StatefulWidget {
  final String topic;
  final String subtopic;

  const SubtopicScreen({super.key, required this.topic, required this.subtopic});

  @override
  State<SubtopicScreen> createState() => _SubtopicScreenState();
}

class _SubtopicScreenState extends State<SubtopicScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  TopicContent? _content;
  bool _miniPracticeCompleted = false;
  
  // Code related
  final List<Map<String, String>> _allLanguages = [
    {'name': 'Python', 'ext': 'py'},
    {'name': 'Java', 'ext': 'java'},
    {'name': 'C++', 'ext': 'cpp'},
    {'name': 'C', 'ext': 'c'},
    {'name': 'C#', 'ext': 'cs'},
  ];
  Map<String, String> _codeMap = {};
  Map<String, String> _outputMap = {};
  int _selectedLangIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 3) { // Practice Tab
        Provider.of<UserProgressProvider>(context, listen: false).recordPracticeOpened(widget.subtopic);
      }
    });
    _loadAllData();
    
    // Record progress
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProgressProvider>(context, listen: false).recordSubtopicOpened(widget.subtopic);
    });
  }
  
  @override
  void dispose() {
    _tabController.removeListener(() {}); // Just to be safe
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadAllData() async {
    // 1. Load Markdown Content
    try {
      final mdString = await rootBundle.loadString('DSA/${widget.topic}/Content/${widget.subtopic}.md');
      _content = TopicContent.fromMarkdown(mdString);
    } catch (e) {
      // Fallback if no specific content file found
      print('Content not found: $e');
    }

    // 2. Load Code
    for (var lang in _allLanguages) {
      final ext = lang['ext']!;
      try {
        final code = await rootBundle.loadString('DSA/${widget.topic}/Code/${widget.subtopic}.$ext');
        _codeMap[ext] = code;
      } catch (_) {}
      
      try {
        final output = await rootBundle.loadString('DSA/${widget.topic}/Code/${widget.subtopic}.$ext.output.txt');
        _outputMap[ext] = output;
      } catch (_) {}
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      
      // Mark as completed if user spends some time? Or just on open?
      // For now, let's mark as completed when they reach the Practice tab or similar.
      // But user requirement says "Visual progress indicator".
      // Let's add a "Mark as Complete" button at the end.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColors.surface,
        elevation: 0,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.textSub.withOpacity(0.1)),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              color: AppColors.textMain,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  widget.topic,
                  style: GoogleFonts.inter(fontSize: 12, color: AppColors.textSub, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.chevron_right_rounded, size: 14, color: AppColors.textSub),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    _prettify(widget.subtopic),
                    style: GoogleFonts.inter(fontSize: 12, color: AppColors.accent, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              _prettify(widget.subtopic),
              style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textMain),
            ),
          ],
        ),
        actions: [
          Consumer<UserProgressProvider>(
            builder: (context, progress, _) {
              final isBookmarked = progress.isSubtopicBookmarked(widget.subtopic);
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.textSub.withOpacity(0.1)),
                  ),
                  child: IconButton(
                    icon: Icon(isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, size: 22),
                    color: isBookmarked ? AppColors.accent : AppColors.textSub,
                    onPressed: () => progress.toggleSubtopicBookmark(widget.subtopic),
                  ),
                ),
              );
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.textSub.withOpacity(0.05)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.textMain,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                   BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2)),
                ],
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: AppColors.background,
              unselectedLabelColor: AppColors.textSub,
              labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 14),
              tabs: const [
                Tab(text: "Learn"),
                Tab(text: "Visual"),
                Tab(text: "Code"),
                Tab(text: "Practice"),
              ],
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _buildLearnTab(),
                _buildVisualTab(),
                _buildCodeTab(),
                _buildPracticeTab(),
              ],
            ),
    );
  }

  Widget _buildLearnTab() {
    if (_content == null) {
      return Center(child: Text("Detailed content coming soon!", style: GoogleFonts.inter(fontSize: 16, color: AppColors.textMain)));
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. What is this?
          _LearnContentCard(
            title: "What is this?",
            icon: Icons.help_outline_rounded,
            content: _content!.whatIsIt,
            color: Colors.blueAccent,
          ),
          
          // 2. Why do we need it?
          _LearnContentCard(
            title: "Why do we need it?",
            icon: Icons.lightbulb_outline_rounded,
            content: _content!.whyDoWeNeedIt,
            color: Colors.orangeAccent,
          ),

          // 3. Algorithm Logic
          _LearnContentCard(
            title: "Algorithm Logic",
            icon: Icons.settings_suggest_rounded,
            content: _content!.algorithmLogic,
            color: Colors.purpleAccent,
          ),

          // 4. Common Mistakes
          _LearnContentCard(
            title: "Common Mistakes",
            icon: Icons.warning_amber_rounded,
            content: _content!.commonMistakes,
            color: AppColors.error,
          ),

          // 5. Real Life Use
          _LearnContentCard(
            title: "Real Life Use",
            icon: Icons.public_rounded,
            content: _content!.realLifeApplication,
            color: Colors.greenAccent,
          ),

          // 6. Complexity
          Row(
            children: [
              Expanded(child: _ComplexityCard(label: "Time Complexity", value: _content!.timeComplexity, color: AppColors.accent)),
              const SizedBox(width: 12),
              Expanded(child: _ComplexityCard(label: "Space Complexity", value: _content!.spaceComplexity, color: AppColors.success)),
            ],
          ),
          const SizedBox(height: 16),

          // 6. Key Takeaways
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.textSub.withOpacity(0.1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.vpn_key_rounded, color: AppColors.warning, size: 24),
                    const SizedBox(width: 12),
                    Text("Key Takeaways", style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textMain)),
                  ],
                ),
                const SizedBox(height: 16),
                if (_content!.keyTakeaways.isEmpty)
                  Text("Essential points for this topic will appear here.", style: GoogleFonts.inter(color: AppColors.textSub)),
                ..._content!.keyTakeaways.map((point) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_rounded, size: 20, color: AppColors.success),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Consumer<SettingsProvider>(
                          builder: (context, settings, _) {
                            return Text(point, style: GoogleFonts.inter(fontSize: settings.bodySize, color: AppColors.textMain, height: 1.5));
                          }
                        )
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 7. Mini Practice Preview
          if (_content!.practices.isNotEmpty)
            _LearnContentCard(
              title: "Quick Challenge",
              icon: Icons.fitness_center_rounded,
              content: _content!.practices.first.question,
              color: AppColors.warning,
            ),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildVisualTab() {
     return VisualizerFactory.get(
       topic: widget.topic,
       subtopic: widget.subtopic,
     );
  }

  Widget _buildCodeTab() {
    final lang = _allLanguages[_selectedLangIndex];
    final ext = lang['ext']!;
    final code = _codeMap[ext] ?? "Code not available for ${lang['name']}";
    final output = _outputMap[ext] ?? "Output will be shown here.";

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Language Chips
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _allLanguages.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final isSelected = index == _selectedLangIndex;
                return ChoiceChip(
                  label: Text(_allLanguages[index]['name']!),
                  selected: isSelected,
                  onSelected: (val) => setState(() => _selectedLangIndex = index),
                  selectedColor: AppColors.accent,
                  backgroundColor: AppColors.surface,
                  labelStyle: GoogleFonts.outfit(
                    color: isSelected ? Colors.white : AppColors.textSub,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          
          // Code Block
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF282A36),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.code_rounded, color: Colors.white54, size: 16),
                          const SizedBox(width: 8),
                          Text("${lang['name']} Code", style: GoogleFonts.inter(color: Colors.white54, fontSize: 12)),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy_rounded, color: Colors.white54, size: 16),
                        onPressed: () {
                           Clipboard.setData(ClipboardData(text: code));
                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied!')));
                        },
                      )
                    ],
                  ),
                ),
                Divider(height: 1, color: Colors.white.withOpacity(0.1)),
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<SettingsProvider>(
                      builder: (context, settings, _) {
                        return HighlightView(
                          code,
                          language: ext == 'cs' ? 'cs' : ext, // highlight_view might need specific mapping
                          theme: draculaTheme,
                          padding: const EdgeInsets.all(20),
                          textStyle: GoogleFonts.firaCode(fontSize: settings.codeSize, height: 1.5),
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Output
          Text("Output", style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textMain)),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.textSub.withOpacity(0.2)),
            ),
            child: Consumer<SettingsProvider>(
              builder: (context, settings, _) {
                return Text(
                  output, 
                  style: GoogleFonts.firaCode(color: AppColors.success, fontSize: settings.codeSize),
                );
              }
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildPracticeTab() {
    final hasPractices = _content != null && _content!.practices.isNotEmpty;

    if (!hasPractices) {
      return Center(child: Text("Practice content coming soon!", style: GoogleFonts.inter(color: AppColors.textSub)));
    }

    return SingleChildScrollView(
       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           // Mini Practice
           if (hasPractices) ...[
             Text("Mini Practice", style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textMain)),
             const SizedBox(height: 16),
             ..._content!.practices.map((practice) {
                // Check if progress marks this as completed (re-check provider)
                final isCompleted = Provider.of<UserProgressProvider>(context).isCompleted(widget.subtopic);
                
                return Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.fitness_center_rounded, color: AppColors.warning, size: 20),
                          const SizedBox(width: 8),
                          Text("Quick Challenge", style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textSub)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Consumer<SettingsProvider>(
                        builder: (context, settings, _) {
                          return Text(practice.question, style: GoogleFonts.outfit(fontSize: settings.bodySize + 3, fontWeight: FontWeight.bold, color: AppColors.textMain));
                        }
                      ),
                      if (practice.description.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Consumer<SettingsProvider>(
                          builder: (context, settings, _) {
                            return Text(practice.description, style: GoogleFonts.inter(fontSize: settings.bodySize - 1, color: AppColors.textSub, height: 1.5));
                          }
                        ),
                      ],
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (practice.input != "N/A" && practice.input != "(None)") ...[
                              Text("Input:", style: GoogleFonts.firaCode(fontWeight: FontWeight.bold, color: AppColors.textSub, fontSize: 12)),
                              Consumer<SettingsProvider>(
                                builder: (context, settings, _) {
                                  return Text(practice.input, style: GoogleFonts.firaCode(color: AppColors.textMain, fontSize: settings.codeSize));
                                }
                              ),
                              const SizedBox(height: 8),
                            ],
                            Text("Target Output:", style: GoogleFonts.firaCode(fontWeight: FontWeight.bold, color: AppColors.textSub, fontSize: 12)),
                            Consumer<SettingsProvider>(
                                builder: (context, settings, _) {
                                  return Text(practice.output, style: GoogleFonts.firaCode(color: AppColors.success, fontSize: settings.codeSize));
                                }
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Hint & Solution toggles
                      _SimpleExpansion(title: "Show Hint", content: practice.hint, icon: Icons.lightbulb_outline_rounded),
                      const SizedBox(height: 8),
                      _SimpleExpansion(title: "Show Solution", content: practice.solution, icon: Icons.visibility_outlined),

                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: Consumer<UserProgressProvider>(
                          builder: (context, progress, _) {
                            final isCompleted = progress.openedSubtopics.contains(widget.subtopic);
                            return ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isCompleted ? AppColors.success : AppColors.accent,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                elevation: 0,
                              ),
                              onPressed: () {
                                progress.recordSubtopicOpened(widget.subtopic);
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Great job! Practice explored 🎉")));
                              },
                              icon: Icon(isCompleted ? Icons.check_circle : Icons.check_circle_outline, color: Colors.white),
                              label: Text(
                                isCompleted ? "Explored" : "Mark as Explored", 
                                style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)
                              ),
                            );
                          }
                        ),
                      ),
                    ],
                  ),
                );
             }),
           ],
           const SizedBox(height: 40),
         ]
       ),
    );
  }

  String _prettify(String raw) {
    String text = raw.replaceFirst(RegExp(r'^\d+_'), '').replaceAll('_', ' ');
    return text;
  }
}

// ============================================================================
// HELPER CLASSES
// ============================================================================

class _LearnContentCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;

  const _LearnContentCard({required this.title, required this.content, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, _) {
        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                 child: Row(
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
                     Text(title, style: GoogleFonts.outfit(fontSize: settings.titleSize - 4, fontWeight: FontWeight.bold, color: AppColors.textMain)),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: MarkdownBody(
                   data: content,
                   styleSheet: MarkdownStyleSheet(
                     p: GoogleFonts.inter(fontSize: settings.bodySize, height: 1.6, color: AppColors.textSub),
                     listBullet: GoogleFonts.inter(fontSize: settings.bodySize, color: AppColors.textSub),
                   ),
                 ),
               ),
            ],
          ),
        );
      }
    );
  }
}

class _ComplexityCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ComplexityCard({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 12, color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(value, style: GoogleFonts.firaCode(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textMain)),
        ],
      ),
    );
  }
}

class _SimpleExpansion extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const _SimpleExpansion({required this.title, required this.content, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 12),
          collapsedBackgroundColor: AppColors.background,
          backgroundColor: AppColors.background,
          leading: Icon(icon, color: AppColors.textSub, size: 20),
          title: Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textMain)),
          children: [
             Container(
               alignment: Alignment.topLeft,
               padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
               child: Text(content, style: GoogleFonts.inter(color: AppColors.textMain, height: 1.5)),
             ),
          ],
        ),
      ),
    );
  }
}
