import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../models/study_plan.dart';
import '../widgets/app_drawer.dart';

class ResumeCareerScreen extends StatefulWidget {
  const ResumeCareerScreen({super.key});

  @override
  State<ResumeCareerScreen> createState() => _ResumeCareerScreenState();
}

class _ResumeCareerScreenState extends State<ResumeCareerScreen> {
  List<ResumeTemplate> _templates = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final jsonStr = await rootBundle.loadString('assets/data/career_roadmaps.json');
      final data = jsonDecode(jsonStr);
      _templates = (data['resumeTemplates'] as List).map((t) => ResumeTemplate.fromJson(t)).toList();
      setState(() {});
    } catch (e) {
      debugPrint('Error loading career data: $e');
    }
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
      drawer: const AppDrawer(activeItem: DrawerItem.resumeCareer),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Resume & Career', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ── ATS Resume Guide Banner ──
          _buildATSBanner(accentColor, textMain, textSub, cardColor, isDark),
          const SizedBox(height: 24),

          // ── ATS Checklist ──
          _buildATSChecklist(textMain, textSub, cardColor, accentColor, isDark),
          const SizedBox(height: 24),

          // ── Must-Have Sections ──
          _buildMustHaveSections(textMain, textSub, cardColor, accentColor, isDark),
          const SizedBox(height: 24),

          // ── Common Mistakes ──
          _buildCommonMistakes(textMain, textSub, cardColor, isDark),
          const SizedBox(height: 24),

          // ── Resume Templates ──
          Text('Resume Templates', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
          Text('Predefined bullet points to help you build your resume', style: GoogleFonts.inter(fontSize: 13, color: textSub)),
          const SizedBox(height: 16),
          ..._templates.map((template) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(20)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
                  child: Row(children: [
                    Icon(Icons.description_outlined, color: accentColor),
                    const SizedBox(width: 12),
                    Text(template.title, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: textMain)),
                  ]),
                ),
                ...template.sections.map((section) => Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 18),
                    title: Text(section.name, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: textMain, fontSize: 14)),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: section.bullets.map((b) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('• ', style: GoogleFonts.inter(color: accentColor, fontWeight: FontWeight.bold)),
                            Expanded(child: SelectableText(b, style: GoogleFonts.inter(fontSize: 13, color: textMain, height: 1.4))),
                          ]),
                        )).toList()),
                      ),
                    ],
                  ),
                )),
              ]),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildATSBanner(Color accent, Color textMain, Color textSub, Color cardColor, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [accent.withOpacity(0.85), accent], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('📄', style: TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('ATS Resume Guide', style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            Text('Build a resume that passes ATS scanners', style: GoogleFonts.inter(fontSize: 12, color: Colors.white70)),
          ])),
        ]),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
          child: Text(
            '90% of Fortune 500 companies use ATS (Applicant Tracking System) to filter resumes before a human ever sees them.',
            style: GoogleFonts.inter(fontSize: 12, color: Colors.white, height: 1.4),
          ),
        ),
      ]),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildATSChecklist(Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    final items = [
      {'icon': '✅', 'title': 'Use Standard Section Headings', 'desc': 'Use "Experience", "Education", "Skills" — not creative names like "My Journey"'},
      {'icon': '✅', 'title': 'Simple Formatting', 'desc': 'No tables, columns, graphics, or text boxes. Use a single-column layout'},
      {'icon': '✅', 'title': 'Use Keywords from Job Description', 'desc': 'Mirror exact words: "React.js" not just "React", "Machine Learning" not "ML"'},
      {'icon': '✅', 'title': '.docx or .pdf Format', 'desc': 'Most ATS parse .docx best. PDF is second choice. Never use images or fancy formats'},
      {'icon': '✅', 'title': 'Standard Fonts', 'desc': 'Use Arial, Calibri, Times New Roman, or Garamond. 10-12pt size'},
      {'icon': '✅', 'title': 'Include Contact Info at Top', 'desc': 'Name, Phone, Email, LinkedIn, GitHub — not in headers/footers'},
      {'icon': '✅', 'title': 'Quantify Achievements', 'desc': 'Use numbers: "Improved API response time by 40%" instead of "Made APIs faster"'},
      {'icon': '✅', 'title': 'One Page (for freshers)', 'desc': 'Keep it concise. 1 page for <5 years experience, 2 pages max for senior roles'},
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('ATS Checklist', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
      Text('Follow these rules to pass ATS filters', style: GoogleFonts.inter(fontSize: 13, color: textSub)),
      const SizedBox(height: 12),
      ...items.asMap().entries.map((e) {
        final idx = e.key;
        final item = e.value;
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: accent.withOpacity(0.1))),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(item['icon']!, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item['title']!, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: textMain)),
              const SizedBox(height: 2),
              Text(item['desc']!, style: GoogleFonts.inter(fontSize: 12, color: textSub, height: 1.4)),
            ])),
          ]),
        ).animate().fadeIn(duration: 300.ms, delay: (80 * idx).ms);
      }),
    ]);
  }

  Widget _buildMustHaveSections(Color textMain, Color textSub, Color cardColor, Color accent, bool isDark) {
    final sections = [
      {'emoji': '👤', 'name': 'Header / Contact Info', 'items': 'Full Name, Phone, Professional Email, LinkedIn URL, GitHub/Portfolio link, City'},
      {'emoji': '🎓', 'name': 'Education', 'items': 'Degree, University/College, Year, CGPA/Percentage, Relevant Coursework'},
      {'emoji': '💼', 'name': 'Experience / Internships', 'items': 'Role title, Company, Duration, 2-4 bullet points with action verbs + metrics'},
      {'emoji': '🛠️', 'name': 'Skills', 'items': 'Languages (C++, Python), Frameworks (React, Flutter), Tools (Git, Docker), Databases'},
      {'emoji': '🚀', 'name': 'Projects', 'items': 'Project Name | Tech Stack, What you built, Key feature implemented, Outcome/metric'},
      {'emoji': '🏆', 'name': 'Achievements', 'items': 'Coding contests ranking, Hackathon wins, Certifications, Open source contributions'},
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Must-Have Resume Sections', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
      Text('Every ATS-friendly resume needs these', style: GoogleFonts.inter(fontSize: 13, color: textSub)),
      const SizedBox(height: 12),
      ...sections.asMap().entries.map((e) {
        final idx = e.key;
        final s = e.value;
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s['emoji']!, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(s['name']!, style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.bold, color: textMain)),
              const SizedBox(height: 4),
              Text(s['items']!, style: GoogleFonts.inter(fontSize: 12, color: textSub, height: 1.5)),
            ])),
          ]),
        ).animate().fadeIn(duration: 300.ms, delay: (80 * idx).ms);
      }),
    ]);
  }

  Widget _buildCommonMistakes(Color textMain, Color textSub, Color cardColor, bool isDark) {
    final mistakes = [
      {'bad': 'Using fancy templates with icons, graphs, progress bars', 'good': 'Clean single-column layout with standard headings'},
      {'bad': 'Writing "Responsible for managing team"', 'good': '"Led a team of 5 engineers, delivering project 2 weeks early"'},
      {'bad': 'Listing every technology you\'ve ever heard of', 'good': 'List only skills you can confidently discuss in interviews'},
      {'bad': 'Including photo, age, gender, marital status', 'good': 'Only professional info: name, contact, links'},
      {'bad': 'Generic objective: "Seeking a challenging role..."', 'good': 'Skip objective OR write a specific professional summary'},
      {'bad': 'Spelling mistakes and inconsistent formatting', 'good': 'Proofread multiple times. Use consistent date formats & bullet styles'},
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Common Mistakes to Avoid', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
      const SizedBox(height: 12),
      ...mistakes.asMap().entries.map((e) {
        final idx = e.key;
        final m = e.value;
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('❌', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Expanded(child: Text(m['bad']!, style: GoogleFonts.inter(fontSize: 12, color: AppColors.error, height: 1.4, decoration: TextDecoration.lineThrough))),
            ]),
            const SizedBox(height: 6),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('✅', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Expanded(child: Text(m['good']!, style: GoogleFonts.inter(fontSize: 12, color: AppColors.success, height: 1.4))),
            ]),
          ]),
        ).animate().fadeIn(duration: 300.ms, delay: (80 * idx).ms);
      }),
    ]);
  }
}
