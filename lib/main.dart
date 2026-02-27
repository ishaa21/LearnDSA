import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'providers/settings_provider.dart';
import 'providers/user_progress_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => UserProgressProvider()),
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
