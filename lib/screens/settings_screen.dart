import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../providers/settings_provider.dart';
import '../providers/user_progress_provider.dart';
import '../theme.dart';
import '../widgets/app_drawer.dart';
import 'flashcards_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(activeItem: DrawerItem.settings),
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: Text('Settings',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Appearance ──────────────────────────────────────────────
            _SectionHeader(title: 'Appearance', accent: accentColor),
            const SizedBox(height: 12),
            _buildFontSizeControl(
                context, textMain, textSub, cardBg, accentColor, isDark),
            const SizedBox(height: 12),
            _buildDarkModeToggle(
                context, textMain, textSub, cardBg, accentColor, isDark),

            const SizedBox(height: 28),

            // ── Study Tools ──────────────────────────────────────────────
            _SectionHeader(title: 'Study Tools', accent: accentColor),
            const SizedBox(height: 12),

            _SettingsTile(
              icon: Icons.lightbulb_outline_rounded,
              label: 'Study Tips',
              subtitle: 'Best practices for mastering DSA',
              isDark: isDark,
              textMain: textMain,
              textSub: textSub,
              cardBg: cardBg,
              accentColor: accentColor,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const _StudyTipsPage())),
            ),

            const SizedBox(height: 28),

            // ── Data ────────────────────────────────────────────────────
            _SectionHeader(title: 'Data & Progress', accent: accentColor),
            const SizedBox(height: 12),
            _buildExportButton(
                context, textMain, textSub, cardBg, accentColor, isDark),
            const SizedBox(height: 10),
            _buildImportButton(
                context, textMain, textSub, cardBg, accentColor, isDark),
            const SizedBox(height: 10),
            _buildResetButton(
                context, textMain, textSub, cardBg, accentColor, isDark),
            const SizedBox(height: 10),
            _SettingsTile(
              icon: Icons.storage_rounded,
              label: 'Data Persistence',
              subtitle: 'Progress saved locally — no account needed',
              isDark: isDark,
              textMain: textMain,
              textSub: textSub,
              cardBg: cardBg,
              accentColor: accentColor,
              onTap: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: cardBg,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Text('Data Persistence',
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold, color: textMain)),
                  content: Text(
                    'All your progress — completed subtopics, streak, weak topics, revision lists — is stored locally on your device using SharedPreferences.\n\nNo internet or account is ever required. Use Export to back it up, and Import to restore it.',
                    style: GoogleFonts.inter(
                        fontSize: 14, color: textSub, height: 1.6),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Got it',
                          style: GoogleFonts.outfit(
                              color: accentColor,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            // ── Support ──────────────────────────────────────────────────
            _SectionHeader(title: 'Support', accent: accentColor),
            const SizedBox(height: 12),
            _SettingsTile(
              icon: Icons.email_outlined,
              label: 'Send Feedback',
              subtitle: 'Share your thoughts or report issues',
              isDark: isDark,
              textMain: textMain,
              textSub: textSub,
              cardBg: cardBg,
              accentColor: accentColor,
              onTap: _sendFeedback,
            ),
            _SettingsTile(
              icon: Icons.info_outline_rounded,
              label: 'About App',
              subtitle: 'The offline-first learning philosophy',
              isDark: isDark,
              textMain: textMain,
              textSub: textSub,
              cardBg: cardBg,
              accentColor: accentColor,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const _AboutAppPage())),
            ),
            _SettingsTile(
              icon: Icons.favorite_border_rounded,
              label: 'Developer Info',
              subtitle: 'Built for students, by students',
              isDark: isDark,
              textMain: textMain,
              textSub: textSub,
              cardBg: cardBg,
              accentColor: accentColor,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (_) => const _DeveloperInfoPage())),
            ),

            const SizedBox(height: 32),
            Center(
              child: Text(
                'Version 2.0.0',
                style: GoogleFonts.inter(fontSize: 12, color: textSub),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFontSizeControl(BuildContext context, Color textMain,
      Color textSub, Color cardBg, Color accent, bool isDark) {
    final surfaceBg = isDark ? AppColors.surface : AppColors.lightSurface;

    return Consumer<SettingsProvider>(builder: (context, settings, _) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: textSub.withOpacity(0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.format_size_rounded, color: textSub, size: 20),
                const SizedBox(width: 12),
                Text('Content Font Size',
                    style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w600, color: textMain)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _FontSizeChip(
                    label: 'Small',
                    size: AppFontSize.small,
                    settings: settings,
                    accent: accent,
                    surfaceBg: surfaceBg),
                const SizedBox(width: 10),
                _FontSizeChip(
                    label: 'Normal',
                    size: AppFontSize.medium,
                    settings: settings,
                    accent: accent,
                    surfaceBg: surfaceBg),
                const SizedBox(width: 10),
                _FontSizeChip(
                    label: 'Large',
                    size: AppFontSize.large,
                    settings: settings,
                    accent: accent,
                    surfaceBg: surfaceBg),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildDarkModeToggle(BuildContext context, Color textMain,
      Color textSub, Color cardBg, Color accent, bool isDark) {
    return Consumer<SettingsProvider>(builder: (context, settings, _) {
      return Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: textSub.withOpacity(0.08)),
        ),
        child: SwitchListTile(
          activeColor: accent,
          contentPadding: EdgeInsets.zero,
          secondary: Icon(
            isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            color: textSub,
            size: 22,
          ),
          title: Text('Dark Mode',
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600, color: textMain)),
          subtitle: Text('Switch between dark and light theme',
              style: GoogleFonts.inter(fontSize: 12, color: textSub)),
          value: settings.isDarkMode,
          onChanged: (v) => settings.setDarkMode(v),
        ),
      );
    });
  }

  Widget _buildExportButton(BuildContext context, Color textMain,
      Color textSub, Color cardBg, Color accent, bool isDark) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.success.withOpacity(0.3)),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: const Icon(Icons.upload_rounded,
            color: AppColors.success, size: 22),
        title: Text('Export Progress',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
        subtitle: Text('Save your progress as a JSON backup',
            style: GoogleFonts.inter(fontSize: 12, color: textSub)),
        trailing: TextButton(
          onPressed: () => _exportProgress(context),
          child: Text('Export',
              style: GoogleFonts.outfit(
                  color: AppColors.success, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildImportButton(BuildContext context, Color textMain,
      Color textSub, Color cardBg, Color accent, bool isDark) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.info.withOpacity(0.3)),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading:
            const Icon(Icons.download_rounded, color: AppColors.info, size: 22),
        title: Text('Import Progress',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
        subtitle: Text('Restore from a backup (paste JSON)',
            style: GoogleFonts.inter(fontSize: 12, color: textSub)),
        trailing: TextButton(
          onPressed: () => _importProgress(context),
          child: Text('Import',
              style: GoogleFonts.outfit(
                  color: AppColors.info, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildResetButton(BuildContext context, Color textMain,
      Color textSub, Color cardBg, Color accent, bool isDark) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: const Icon(Icons.delete_forever_rounded,
            color: AppColors.error, size: 22),
        title: Text('Reset All Progress',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
        subtitle: Text('This cannot be undone',
            style: GoogleFonts.inter(fontSize: 12, color: textSub)),
        trailing: TextButton(
          onPressed: () => _resetConfirm(context),
          child: Text('Reset',
              style: GoogleFonts.outfit(
                  color: AppColors.error, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  // ── Actions ─────────────────────────────────────────────────────────────────

  Future<void> _exportProgress(BuildContext context) async {
    final progress =
        Provider.of<UserProgressProvider>(context, listen: false);
    final data = progress.exportData();
    final jsonStr =
        const JsonEncoder.withIndent('  ').convert(data);
    await Share.share(jsonStr, subject: 'Learn DSA — Progress Backup');
  }

  Future<void> _importProgress(BuildContext context) async {
    final controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Import Progress'),
        content: TextField(
          controller: controller,
          maxLines: 6,
          decoration: const InputDecoration(
            hintText: 'Paste JSON data here...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              try {
                final data = jsonDecode(controller.text);
                if (!ctx.mounted) return;
                await Provider.of<UserProgressProvider>(ctx, listen: false)
                    .importData(data);
                if (!ctx.mounted) return;
                Navigator.pop(ctx);
                ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
                    content: Text('Progress imported successfully!')));
              } catch (e) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text('Invalid JSON data.')));
              }
            },
            child: const Text('Import'),
          ),
        ],
      ),
    );
    controller.dispose();
  }

  Future<void> _resetConfirm(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset All Progress?'),
        content: const Text(
            'This will delete all bookmarks, completed topics, notes, streak, and practice history. This cannot be undone.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Reset Everything',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    if (confirm == true && context.mounted) {
      await Provider.of<UserProgressProvider>(context, listen: false)
          .resetAll();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('All progress has been reset.')));
      }
    }
  }

  void _sendFeedback() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ishazalavadia@gmail.com',
      queryParameters: {'subject': 'DSA App Feedback'},
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }
}

// ── Reusable Widgets ──────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final Color accent;

  const _SectionHeader({required this.title, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: accent,
        letterSpacing: 0.5,
      ),
    );
  }
}

class _FontSizeChip extends StatelessWidget {
  final String label;
  final AppFontSize size;
  final SettingsProvider settings;
  final Color accent;
  final Color surfaceBg;

  const _FontSizeChip({
    required this.label,
    required this.size,
    required this.settings,
    required this.accent,
    required this.surfaceBg,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = settings.fontSize == size;

    return Expanded(
      child: InkWell(
        onTap: () => settings.setFontSize(size),
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? accent : surfaceBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : accent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final bool isDark;
  final Color textMain;
  final Color textSub;
  final Color cardBg;
  final Color accentColor;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.isDark,
    required this.textMain,
    required this.textSub,
    required this.cardBg,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: textSub.withOpacity(0.08)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(icon, color: textSub, size: 22),
        title: Text(label,
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.w600, color: textMain)),
        subtitle: Text(subtitle,
            style: GoogleFonts.inter(fontSize: 12, color: textSub)),
        trailing: Icon(Icons.arrow_forward_ios_rounded,
            size: 14, color: textSub),
      ),
    );
  }
}

// ── Static Sub-pages ──────────────────────────────────────────────────────────

class _StudyTipsPage extends StatelessWidget {
  const _StudyTipsPage();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final accent = isDark ? AppColors.accent : AppColors.lightAccent;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Study Tips',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _Tip('Visualize First',
              'Before jumping into code, understand the logic visually. Trace through small examples by hand.',
              Icons.visibility_rounded, accent, textMain, textSub, cardBg),
          _Tip('Implement from Scratch',
              'Copying code helps, but writing it yourself from a blank screen is where real learning happens.',
              Icons.edit_note_rounded, accent, textMain, textSub, cardBg),
          _Tip('Consistency > Intensity',
              'Study 30 minutes every day rather than 5 hours once a week. DSA requires muscle memory.',
              Icons.timer_rounded, accent, textMain, textSub, cardBg),
          _Tip('Learn the "Why"',
              'Don\'t just memorize algorithms. Ask why we use a Stack instead of an Array for a specific problem.',
              Icons.help_outline_rounded, accent, textMain, textSub, cardBg),
          _Tip('Practice on Paper',
              'Before coding, trace through the algorithm by hand. This reveals edge cases early.',
              Icons.draw_rounded, accent, textMain, textSub, cardBg),
          _Tip('Use the Complexity Guide',
              'Always know the time and space complexity of what you write. Reviewers always ask this.',
              Icons.speed_rounded, accent, textMain, textSub, cardBg),
        ],
      ),
    );
  }
}

class _Tip extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;
  final Color accent;
  final Color textMain;
  final Color textSub;
  final Color cardBg;

  const _Tip(this.title, this.desc, this.icon, this.accent, this.textMain,
      this.textSub, this.cardBg);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accent, size: 24),
              const SizedBox(width: 12),
              Text(title,
                  style: GoogleFonts.outfit(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: textMain)),
            ],
          ),
          const SizedBox(height: 10),
          Text(desc,
              style:
                  GoogleFonts.inter(fontSize: 14, color: textSub, height: 1.6)),
        ],
      ),
    );
  }
}

class _AboutAppPage extends StatelessWidget {
  const _AboutAppPage();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final accent = isDark ? AppColors.accent : AppColors.lightAccent;

    final features = [
      ('🧠', 'Offline AI Assistant', 'Rule-based DSA reasoning engine — no internet needed.'),
      ('⚡', '100% Offline', 'Every topic, guide, and practice question lives on your device.'),
      ('🔒', 'Zero Data Collection', 'Your progress is yours. No backend, no tracking, no accounts.'),
      ('🎯', 'Placement-Focused', 'Built around what actually matters in technical interviews.'),
      ('🔥', 'Streak System', 'Stay consistent — daily practice builds lasting mastery.'),
    ];

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('About App',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [accent, accent.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('⚡', style: TextStyle(fontSize: 36)),
                  const SizedBox(height: 12),
                  Text('Learn DSA',
                      style: GoogleFonts.outfit(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 6),
                  Text(
                    'Your offline companion for cracking DSA interviews.\nSmarter prep. Zero fluff.',
                    style: GoogleFonts.inter(
                        fontSize: 14, color: Colors.white70, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            Text('What makes it special?',
                style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textMain)),
            const SizedBox(height: 16),

            ...features.map((f) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Text(f.$1, style: const TextStyle(fontSize: 24)),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(f.$2,
                                style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold,
                                    color: textMain,
                                    fontSize: 14)),
                            Text(f.$3,
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: textSub,
                                    height: 1.4)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),

            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: accent.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: accent.withOpacity(0.2)),
              ),
              child: Text(
                '"Consistency beats intensity.\nShow up daily — that\'s how you crack DSA." 💪',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                    fontSize: 15,
                    color: accent,
                    fontWeight: FontWeight.w600,
                    height: 1.6),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _InfoPoint extends StatelessWidget {
  final String title;
  final String desc;
  final Color accent;
  final Color textMain;
  final Color textSub;

  const _InfoPoint(this.title, this.desc, this.accent, this.textMain, this.textSub);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.outfit(
                  fontSize: 18, fontWeight: FontWeight.bold, color: accent)),
          const SizedBox(height: 8),
          Text(desc,
              style: GoogleFonts.inter(
                  fontSize: 14, color: textSub, height: 1.5)),
        ],
      ),
    );
  }
}

class _DeveloperInfoPage extends StatelessWidget {
  const _DeveloperInfoPage();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final accent = isDark ? AppColors.accent : AppColors.lightAccent;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Developer Info',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Built for students, by students ❤️',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textMain)),
              const SizedBox(height: 32),
              _DevCard('Isha Zalavadia', 'ishazalavadia@gmail.com',
                  cardBg, textMain, accent),
              const SizedBox(height: 16),
              _DevCard('Rushika Kalariya', 'rushikakalariya@gmail.com',
                  cardBg, textMain, accent),
              const SizedBox(height: 40),
              Text(
                'We hope this app helps you in your coding journey!',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 14,
                    color: textSub,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DevCard extends StatelessWidget {
  final String name;
  final String email;
  final Color cardBg;
  final Color textMain;
  final Color accent;

  const _DevCard(this.name, this.email, this.cardBg, this.textMain, this.accent);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(name,
              style: GoogleFonts.outfit(
                  fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
          const SizedBox(height: 4),
          Text(email,
              style: GoogleFonts.inter(fontSize: 14, color: accent)),
        ],
      ),
    );
  }
}
