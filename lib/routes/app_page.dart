import 'package:get/get.dart';
import 'package:travs/views/detail_screen.dart';
import 'package:travs/views/detail_weather_screen.dart';
import 'package:travs/views/home_screen.dart';

import '../views/onboarding_screen.dart';
import 'app_route.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.onboarding, page: () => OnBoardingScreen()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.detailScreen, page: () => DetailScreen()),
    GetPage(
        name: AppRoutes.detaiWeatherScreen, page: () => DetailWeatherScreen()),
  ];
}
