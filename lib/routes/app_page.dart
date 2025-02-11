import 'package:get/get.dart';
import 'package:travs/views/home_screen.dart';

import '../views/onboarding_screen.dart';
import 'app_route.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.onboarding, page: () => OnBoardingScreen()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  ];
}
