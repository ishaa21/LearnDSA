import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/user_progress_provider.dart';
import '../theme.dart';
import '../screens/settings_screen.dart';
import '../screens/topic_list_screen.dart';
import '../screens/progress_screen.dart';
import '../screens/practice_screen.dart';
import '../screens/time_complexity_screen.dart';
import '../screens/placement_notes_screen.dart';
import '../screens/pattern_mode_screen.dart';
import '../screens/flashcards_screen.dart';

enum DrawerItem {
  dashboard,
  topics,
  practice,
  progress,
  patternMode,
  flashcards,
  timeComplexity,
  placementNotes,
  settings,
}

class AppDrawer extends StatelessWidget {
  final DrawerItem activeItem;

  const AppDrawer({super.key, required this.activeItem});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.surface : AppColors.lightSurface;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    return Drawer(
      backgroundColor: bgColor,
      child: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────────────
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(Icons.data_array_rounded,
                        color: accentColor, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Learn DSA',
                          style: GoogleFonts.outfit(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: textMain,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Algorithms & Data Structures',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: textSub,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Streak badge ─────────────────────────────────────────────
            Consumer<UserProgressProvider>(
              builder: (context, progress, _) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: accentColor.withOpacity(0.15)),
                  ),
                  child: Row(
                    children: [
                      Text('🔥', style: const TextStyle(fontSize: 18)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${progress.streakDays} Day Streak',
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold,
                                color: textMain,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Keep the momentum going!',
                              style: GoogleFonts.inter(
                                  fontSize: 11, color: textSub),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 12),
            Divider(
                color: (isDark ? AppColors.textSub : AppColors.lightTextSub)
                    .withOpacity(0.15),
                height: 1),
            const SizedBox(height: 8),

            // ── Navigation Items ──────────────────────────────────────────
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                children: [
                  _DrawerNavItem(
                    icon: Icons.dashboard_rounded,
                    label: 'Dashboard',
                    isActive: activeItem == DrawerItem.dashboard,
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    onTap: () {
                      Navigator.pop(context);
                      if (activeItem != DrawerItem.dashboard) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (r) => false);
                      }
                    },
                  ),
                  _DrawerNavItem(
                    icon: Icons.menu_book_rounded,
                    label: 'Topics',
                    isActive: activeItem == DrawerItem.topics,
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const TopicListScreen()),
                      );
                    },
                  ),
                  _DrawerNavItem(
                    icon: Icons.fitness_center_rounded,
                    label: 'Practice',
                    isActive: activeItem == DrawerItem.practice,
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PracticeScreen()),
                      );
                    },
                  ),
                  _DrawerNavItem(
                    icon: Icons.insights_rounded,
                    label: 'Progress',
                    isActive: activeItem == DrawerItem.progress,
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ProgressScreen()),
                      );
                    },
                  ),
                  _DrawerNavItem(
                    icon: Icons.extension_rounded,
                    label: 'Pattern Mode',
                    isActive: activeItem == DrawerItem.patternMode,
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PatternModeScreen()),
                      );
                    },
                  ),
                  _DrawerNavItem(
                    icon: Icons.style_rounded,
                    label: 'Flashcards',
                    isActive: activeItem == DrawerItem.flashcards,
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const FlashcardsScreen()),
                      );
                    },
                  ),
                  _DrawerNavItem(
                    icon: Icons.speed_rounded,
                    label: 'Time Complexity Guide',
                    isActive: activeItem == DrawerItem.timeComplexity,
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const TimeComplexityScreen()),
                      );
                    },
                  ),
                  _DrawerNavItem(
                    icon: Icons.notes_rounded,
                    label: 'Placement Notes',
                    isActive: activeItem == DrawerItem.placementNotes,
                    accentColor: accentColor,
                    textMain: textMain,
                    textSub: textSub,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PlacementNotesScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            Divider(
                color: (isDark ? AppColors.textSub : AppColors.lightTextSub)
                    .withOpacity(0.15),
                height: 1),
            // ── Settings ──────────────────────────────────────────────────
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: _DrawerNavItem(
                icon: Icons.settings_rounded,
                label: 'Settings',
                isActive: activeItem == DrawerItem.settings,
                accentColor: accentColor,
                textMain: textMain,
                textSub: textSub,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color accentColor;
  final Color textMain;
  final Color textSub;
  final VoidCallback onTap;

  const _DrawerNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.accentColor,
    required this.textMain,
    required this.textSub,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isActive ? accentColor.withOpacity(0.12) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        leading: Icon(
          icon,
          color: isActive ? accentColor : textSub,
          size: 22,
        ),
        title: Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 15,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? accentColor : textMain,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
