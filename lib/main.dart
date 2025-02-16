import 'dart:ui';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travs/routes/app_page.dart';
import 'package:travs/views/home_screen.dart';
import 'package:travs/views/onboarding_screen.dart';
import 'controllers/c_user.dart';
import 'themes/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;

  await dotenv.load(fileName: ".env");

  final isPlatformDark =
      PlatformDispatcher.instance.platformBrightness == Brightness.dark;

  final initTheme = isPlatformDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  await Supabase.initialize(
    url: '${dotenv.env['SUPABASE_URL']}',
    anonKey: '${dotenv.env['SUPABASE_API_KEY']}',
  );

  final cUser = Get.put(CUser());
  cUser.login();

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
          return HomeScreen();
        },
      ),
      getPages: AppPages.pages,
    );
  }
}
