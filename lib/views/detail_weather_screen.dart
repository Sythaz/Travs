import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travs/models/weather_model.dart';
import 'package:travs/themes/app_assets.dart';

import '../themes/app_colors.dart';
import '../themes/text_style_helper.dart';

class DetailWeatherScreen extends StatelessWidget {
  DetailWeatherScreen({super.key});
  final Map<String, dynamic> arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final WeatherModel cWeather = arguments['cWeather'];
    final String cityName = arguments['cityName'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detail Weather',
            style: TextStyleHelper.getTextStyle(context, 'mBold18')),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(cityName,
                  style: TextStyleHelper.getTextStyle(context, 'rBold24')),
            ),
            SizedBox(height: 16),
            Center(
              child: SvgPicture.asset(
                _getWeatherIcon(
                  cWeather.weather![0].main.toString(),
                ),
                width: 250,
              ),
            ),
            SizedBox(height: 16),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cWeather.main!.temp!.toInt()} °C',
                  style: TextStyleHelper.getTextStyle(
                    context,
                    'mExtraBold64',
                  )!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Flexible(
                  child: Text(
                    cWeather.weather![0].description!.toString().toUpperCase(),
                    style: TextStyleHelper.getTextStyle(
                      context,
                      'mExtraBold24',
                    )!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            Text(
              cWeather.weather![0].main.toString(),
              style: TextStyleHelper.getTextStyle(
                context,
                'mExtraBold24',
              )!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Text(
              'But feels like ${cWeather.main!.feelsLike!.toInt()} °C',
              style: TextStyleHelper.getTextStyle(context, 'rMedium16')!
                  .copyWith(color: AppColors.lightGreyColor),
            ),
            SizedBox(height: 16),
            Text(
              'Weather now',
              style: TextStyleHelper.getTextStyle(context, 'rMedium16'),
            ),
            SizedBox(height: 10),
            Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                detailWeatherInfo(
                  context,
                  SvgPicture.asset(AppAssets.humidityIcon, width: 80),
                  'Humidity',
                  '${cWeather.main!.humidity}%',
                ),
                detailWeatherInfo(
                  context,
                  SvgPicture.asset(AppAssets.windIcon, width: 80),
                  'Wind',
                  '${cWeather.wind!.speed!.toInt()} m/s',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row detailWeatherInfo(
      BuildContext context, Widget icon, String infoName, String infoContent) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: icon,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              infoName,
              style: TextStyleHelper.getTextStyle(context, 'rMedium16')!
                  .copyWith(color: AppColors.lightGreyColor),
            ),
            Text(
              infoContent,
              style: TextStyleHelper.getTextStyle(context, 'mExtraBold24')!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ],
    );
  }

  String _getWeatherIcon(String weather) {
    switch (weather.toLowerCase()) {
      case 'haze' ||
            'mist' ||
            'fog' ||
            'smoke' ||
            'sand' ||
            'dust' ||
            'ash' ||
            'squall' ||
            'tornado':
        return AppAssets.atmosphereWeather;
      case 'clear':
        return AppAssets.clearWeather;
      case 'clouds':
        return AppAssets.cloudsWeather;
      case 'rain':
        return AppAssets.rainWeather;
      case 'snow':
        return AppAssets.snowWeather;
      case 'drizzle':
        return AppAssets.drizzleWeather;
      case 'thunderstorm':
        return AppAssets.thunderstormWeather;
      default:
        return AppAssets.clearWeather;
    }
  }
}
