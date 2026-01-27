import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../providers/settings_provider.dart';
import '../theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Settings", style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        foregroundColor: AppColors.textMain,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("Appearance"),
            const SizedBox(height: 12),
            _buildFontSizeControl(context),
            
            const SizedBox(height: 32),
            _buildSectionHeader("Content"),
            const SizedBox(height: 12),
            _buildSettingsItem(
              context,
              icon: Icons.lightbulb_outline_rounded,
              title: "Study Tips",
              subtitle: "Best practices for mastering DSA",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _StudyTipsPage())),
            ),
            _buildSettingsItem(
              context,
              icon: Icons.info_outline_rounded,
              title: "About App",
              subtitle: "The offline-first learning philosophy",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _AboutAppPage())),
            ),

            const SizedBox(height: 32),
            _buildSectionHeader("Support"),
            const SizedBox(height: 12),
            _buildSettingsItem(
              context,
              icon: Icons.email_outlined,
              title: "Send Feedback",
              subtitle: "Share your thoughts or report issues",
              onTap: _sendFeedback,
            ),
            _buildSettingsItem(
              context,
              icon: Icons.favorite_border_rounded,
              title: "Developer Info",
              subtitle: "Built for students, by students",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _DeveloperInfoPage())),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                "Version 1.0.0",
                style: GoogleFonts.inter(fontSize: 12, color: AppColors.textSub),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.accent,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildFontSizeControl(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.textSub.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.format_size_rounded, color: AppColors.textSub, size: 20),
              const SizedBox(width: 12),
              Text("Content Font Size", style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: AppColors.textMain)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildFontSizeOption(context, AppFontSize.small, "Small"),
              const SizedBox(width: 12),
              _buildFontSizeOption(context, AppFontSize.medium, "Normal"),
              const SizedBox(width: 12),
              _buildFontSizeOption(context, AppFontSize.large, "Large"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFontSizeOption(BuildContext context, AppFontSize size, String label) {
    final settings = Provider.of<SettingsProvider>(context);
    final isSelected = settings.fontSize == size;

    return Expanded(
      child: InkWell(
        onTap: () => settings.setFontSize(size),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.accent : AppColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : AppColors.textSub,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.textSub.withOpacity(0.05)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        leading: Icon(icon, color: AppColors.textSub, size: 22),
        title: Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: AppColors.textMain)),
        subtitle: Text(subtitle, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textSub)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textSub),
      ),
    );
  }

  void _sendFeedback() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ishazalavadia@gmail.com',
      queryParameters: {
        'subject': 'DSA App Feedback',
      },
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }
}

// --- STATIC SUB-PAGES ---

class _StudyTipsPage extends StatelessWidget {
  const _StudyTipsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("Study Tips"), backgroundColor: AppColors.surface, elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildTipCard(
            "Visualize First",
            "Before jumping into code, try to understand the logic visually. Use our Visualizers to see how elements move and change.",
            Icons.visibility_rounded,
          ),
          _buildTipCard(
            "Implement from Scratch",
            "Copying code helps, but writing it yourself from a blank screen is where real learning happens.",
            Icons.edit_note_rounded,
          ),
          _buildTipCard(
            "Consistency > Intensity",
            "Study for 30 minutes every day rather than 5 hours once a week. DSA requires muscle memory.",
            Icons.timer_rounded,
          ),
          _buildTipCard(
            "Learn the 'Why'",
            "Don't just memorize algorithms. Ask why we use a Stack instead of an Array for a specific problem.",
            Icons.help_outline_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(String title, String desc, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.accent, size: 24),
              const SizedBox(width: 12),
              Text(title, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textMain)),
            ],
          ),
          const SizedBox(height: 12),
          Text(desc, style: GoogleFonts.inter(fontSize: 14, color: AppColors.textSub, height: 1.6)),
        ],
      ),
    );
  }
}

class _AboutAppPage extends StatelessWidget {
  const _AboutAppPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("About App"), backgroundColor: AppColors.surface, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Learning Philosophy", style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textMain)),
            const SizedBox(height: 16),
            Text(
              "This app was built with a clear goal: to make Data Structures and Algorithms accessible without the noise. No constant notifications, no competitive leaderboards, and absolutely no data tracking.",
              style: GoogleFonts.inter(fontSize: 16, color: AppColors.textSub, height: 1.6),
            ),
            const SizedBox(height: 24),
            _buildInfoPoint("100% Offline", "All content, code, and visualizers are built into the app. Learn anywhere, anytime."),
            _buildInfoPoint("Privacy First", "Your progress stays on your device. We don't have a backend because you don't need one to learn."),
            _buildInfoPoint("Focused Learning", "Designed for students who want to study at their own pace without external pressure."),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoPoint(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.accent)),
          const SizedBox(height: 8),
          Text(desc, style: GoogleFonts.inter(fontSize: 14, color: AppColors.textSub, height: 1.5)),
        ],
      ),
    );
  }
}

class _DeveloperInfoPage extends StatelessWidget {
  const _DeveloperInfoPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("Developer Info"), backgroundColor: AppColors.surface, elevation: 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Built for students, by students ❤️",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textMain),
              ),
              const SizedBox(height: 32),
              _buildDevCard("Isha Zalavadia", "ishazalavadia@gmail.com"),
              const SizedBox(height: 16),
              _buildDevCard("Rushika Kalariya", "rushikakalariya@gmail.com"),
              const SizedBox(height: 40),
              Text(
                "We hope this app helps you in your coding journey!",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 14, color: AppColors.textSub, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDevCard(String name, String email) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.textSub.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Text(name, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textMain)),
          const SizedBox(height: 4),
          Text(email, style: GoogleFonts.inter(fontSize: 14, color: AppColors.accent)),
        ],
      ),
    );
  }
}
