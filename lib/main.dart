import 'package:flutter/material.dart';

import 'theme/app_themes.dart';
import 'views/onboarding_screen.dart';

void main() {
    runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Builder(
        builder: (context) {
          return OnBoardingScreen();
        },
      ),
    );
  }
}
