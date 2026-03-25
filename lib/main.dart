import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'providers/settings_provider.dart';
import 'providers/user_progress_provider.dart';
import 'providers/mock_test_provider.dart';
import 'providers/formula_provider.dart';
import 'providers/mistake_provider.dart';
import 'providers/interview_provider.dart';
import 'providers/study_plan_provider.dart';
import 'providers/leaderboard_provider.dart';
import 'providers/aptitude_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => UserProgressProvider()),
        ChangeNotifierProvider(create: (_) => MockTestProvider()),
        ChangeNotifierProvider(create: (_) => FormulaProvider()),
        ChangeNotifierProvider(create: (_) => MistakeProvider()),
        ChangeNotifierProvider(create: (_) => InterviewProvider()),
        ChangeNotifierProvider(create: (_) => StudyPlanProvider()),
        ChangeNotifierProvider(create: (_) => LeaderboardProvider()),
        ChangeNotifierProvider(create: (_) => AptitudeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Learn DSA',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreen(),
          onGenerateRoute: (settings) {
            if (settings.name == '/') {
              return MaterialPageRoute(builder: (_) => const HomeScreen());
            }
            return null;
          },
        );
      },
    );
  }
}
