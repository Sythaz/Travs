import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travs/models/weather_model.dart';

class WeatherService {
  static fetchWeather(String cityName) async {
    try {
      await dotenv.load(fileName: ".env");

      final res = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=${Uri.encodeComponent(cityName)}&appid=${dotenv.env['OPENWEATHER_API_KEY']}&units=metric"));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);

        return WeatherModel.fromJson(data);
      } else {
        Get.snackbar('FetchWeather statuscode:', res.statusCode.toString());
      }
    } catch (e) {
      Get.snackbar('Error fetching weather', e.toString());
    }
  }
}
