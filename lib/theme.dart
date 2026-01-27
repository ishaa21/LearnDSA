import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // 🎨 Fixed Dark Palette
  static const Color background = Color(0xFF06141B);      // Primary Background
  static const Color surface = Color(0xFF11212D);         // Secondary Background
  static const Color card = Color(0xFF253745);            // Card Background
  static const Color accent = Color(0xFF4A5C6A);          // Elevated/Active
  static const Color textMain = Color(0xFFCCD0CF);        // Primary Text
  static const Color textSub = Color(0xFF9BA8AB);         // Secondary Text
  
  // Semantic Colors (Adjusted for dark mode contrast)
  static const Color success = Color(0xFF2E7D32);         // Darker Green for eyes
  static const Color error = Color(0xFFCF6679);           // Soft Red
  static const Color warning = Color(0xFFF57F17);         
}

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.surface,
    canvasColor: AppColors.background,
    
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accent,
      onPrimary: AppColors.textMain,
      secondary: AppColors.accent,
      onSecondary: AppColors.textMain,
      surface: AppColors.card,
      onSurface: AppColors.textMain,
      background: AppColors.background,
      onBackground: AppColors.textMain,
      error: AppColors.error,
    ),

    // ✍ Typography
    textTheme: TextTheme(
      displayLarge: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textMain),
      displayMedium: GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textMain),
      titleLarge: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textMain),
      titleMedium: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textMain),
      bodyLarge: GoogleFonts.inter(fontSize: 16, color: AppColors.textMain, height: 1.5),
      bodyMedium: GoogleFonts.inter(fontSize: 14, color: AppColors.textSub, height: 1.5),
      labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textMain),
    ),

    // 🧩 Cards
    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide.none, 
      ),
    ),

    // 🧭 AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(color: AppColors.textSub),
      titleTextStyle: GoogleFonts.outfit(
        color: AppColors.textMain,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: const IconThemeData(color: AppColors.textSub),
    ),

    // 🔘 Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.textMain,
        elevation: 2,
        shadowColor: Colors.black45,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textSub,
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
    ),

    // 🏷 Inputs / Search
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: GoogleFonts.inter(color: AppColors.textSub),
      prefixIconColor: AppColors.textSub,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accent, width: 1),
      ),
    ),
    
    // 🧱 Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.surface,
      thickness: 1,
      space: 24,
    ),

    // 🔍 Icons
    iconTheme: const IconThemeData(
      color: AppColors.textSub,
    ),
    
    // 🤏 Tabs
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.textMain,
      unselectedLabelColor: AppColors.textSub,
      indicatorColor: AppColors.accent,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent, 
    ),
  );
}
