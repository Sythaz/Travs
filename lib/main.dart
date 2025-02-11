import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travs/routes/app_page.dart';
import 'package:travs/views/onboarding_screen.dart';
import 'themes/app_themes.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: Builder(
        builder: (context) {
          return OnBoardingScreen();
        },
      ),
      getPages: AppPages.pages,
    );
  }
}
