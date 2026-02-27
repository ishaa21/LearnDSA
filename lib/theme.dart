import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // 🎨 Dark Palette
  static const Color background = Color(0xFF06141B);
  static const Color surface = Color(0xFF11212D);
  static const Color card = Color(0xFF253745);
  static const Color accent = Color(0xFF4A5C6A);
  static const Color textMain = Color(0xFFCCD0CF);
  static const Color textSub = Color(0xFF9BA8AB);

  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFCF6679);
  static const Color warning = Color(0xFFF57F17);
  static const Color info = Color(0xFF1976D2);

  // 🌅 Light Palette
  static const Color lightBackground = Color(0xFFF5F7FA);
  static const Color lightSurface = Color(0xFFEEF1F5);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightAccent = Color(0xFF3D5A6C);
  static const Color lightTextMain = Color(0xFF1A2332);
  static const Color lightTextSub = Color(0xFF5A6A75);
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
      error: AppColors.error,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.outfit(
          fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textMain),
      displayMedium: GoogleFonts.outfit(
          fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textMain),
      titleLarge: GoogleFonts.outfit(
          fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textMain),
      titleMedium: GoogleFonts.outfit(
          fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textMain),
      bodyLarge:
          GoogleFonts.inter(fontSize: 16, color: AppColors.textMain, height: 1.5),
      bodyMedium:
          GoogleFonts.inter(fontSize: 14, color: AppColors.textSub, height: 1.5),
      labelLarge: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textMain),
    ),
    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide.none,
      ),
    ),
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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: GoogleFonts.inter(color: AppColors.textSub),
      prefixIconColor: AppColors.textSub,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
    dividerTheme: const DividerThemeData(
      color: AppColors.surface,
      thickness: 1,
      space: 24,
    ),
    iconTheme: const IconThemeData(color: AppColors.textSub),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.textMain,
      unselectedLabelColor: AppColors.textSub,
      indicatorColor: AppColors.accent,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.surface,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.lightSurface,
    canvasColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightAccent,
      onPrimary: Colors.white,
      secondary: AppColors.lightAccent,
      onSecondary: Colors.white,
      surface: AppColors.lightCard,
      onSurface: AppColors.lightTextMain,
      error: AppColors.error,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.outfit(
          fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.lightTextMain),
      displayMedium: GoogleFonts.outfit(
          fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.lightTextMain),
      titleLarge: GoogleFonts.outfit(
          fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.lightTextMain),
      titleMedium: GoogleFonts.outfit(
          fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.lightTextMain),
      bodyLarge: GoogleFonts.inter(
          fontSize: 16, color: AppColors.lightTextMain, height: 1.5),
      bodyMedium: GoogleFonts.inter(
          fontSize: 14, color: AppColors.lightTextSub, height: 1.5),
      labelLarge: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.lightTextMain),
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.lightTextSub.withOpacity(0.1)),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(color: AppColors.lightTextSub),
      titleTextStyle: GoogleFonts.outfit(
        color: AppColors.lightTextMain,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: const IconThemeData(color: AppColors.lightTextSub),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightAccent,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      hintStyle: GoogleFonts.inter(color: AppColors.lightTextSub),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
        borderSide: const BorderSide(color: AppColors.lightAccent, width: 1),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.lightSurface,
    ),
  );
}
