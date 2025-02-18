import 'package:get/get.dart';
import 'package:travs/models/weather_model.dart';

import '../services/weather_service.dart';

class CWeather extends GetxController {
  final isLoading = false.obs;
  final weatherModel = WeatherModel().obs;

  getDataWeather(String cityName) async {
    try {
      isLoading.value = true;

      weatherModel.value = await WeatherService.fetchWeather(cityName);
    } catch (e) {
      Get.snackbar('Error fetching weather', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
