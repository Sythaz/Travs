import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travs/routes/app_page.dart';
import 'package:travs/views/onboarding_screen.dart';
import 'controllers/c_user.dart';
import 'themes/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: '${dotenv.env['SUPABASE_URL']}',
    anonKey: '${dotenv.env['SUPABASE_API_KEY']}',
  );

  final cUser = Get.put(CUser());
  cUser.login();

  runApp(
    MainApp(),
  );
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
