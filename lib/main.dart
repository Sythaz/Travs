import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travs/routes/app_page.dart';
import 'package:travs/views/onboarding_screen.dart';
import 'themes/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;
  final isPlatformDark =
      WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  final initTheme = isPlatformDark ? AppTheme.darkTheme : AppTheme.lightTheme;
  runApp(
    ThemeProvider(
      initTheme: initTheme,
      builder: (context, themeKu) {
        return MainApp(themeKu);
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  final ThemeData themeKu;

  const MainApp(this.themeKu, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeKu,
      home: Builder(
        builder: (context) {
          return OnBoardingScreen();
        },
      ),
      getPages: AppPages.pages,
    );
  }
}
