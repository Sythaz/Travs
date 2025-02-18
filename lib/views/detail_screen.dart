import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:travs/controllers/c_detail_screen.dart';
import 'package:travs/models/destination.dart';
import 'package:travs/themes/text_style_helper.dart';
import 'package:travs/views/widgets/custom_bottom_navigation.dart';

import '../controllers/c_favorite.dart';
import '../controllers/c_weather.dart';
import '../routes/app_route.dart';
import '../themes/app_colors.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DestinationModel arguments = Get.arguments;
  final cDetailScreen = Get.put(CDetailScreen());
  final cFavorite = Get.put(CFavorite());
  final cWeather = Get.put(CWeather());

  @override
  void initState() {
    cWeather.getDataWeather(arguments.city!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomNavigation(
        context,
        Theme.of(context).colorScheme.error,
        Bounce(
          onTap: () {
            cDetailScreen.toggleFavorite(arguments.name);
          },
          scaleFactor: 0.9,
          child: Obx(
            () {
              if (cFavorite.isLoading.value) {
                return Center(
                  child: Text(
                    'Loading...',
                    style: TextStyleHelper.getTextStyle(context, 'rMedium20'),
                  ),
                );
              }
              if (cFavorite.favoriteList
                  .any((fav) => fav.destinationName == arguments.name)) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remove to Favorite',
                      style: TextStyleHelper.getTextStyle(context, 'rMedium20'),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.bookmark_outlined,
                      size: 28,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add to Favorite',
                    style: TextStyleHelper.getTextStyle(context, 'rMedium20'),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.bookmark_add_outlined,
                    size: 28,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment(0, -1),
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                arguments.cover!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.93, -0.92),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.4,
            maxChildSize: 0.97,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      detailHeader(context),
                      SizedBox(height: 16),
                      detailStatus(context, arguments),
                      SizedBox(height: 16),
                      Text(
                        'Description',
                        style:
                            TextStyleHelper.getTextStyle(context, 'rMedium16'),
                      ),
                      SizedBox(height: 6),
                      descriptionText(arguments, context),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Row detailHeader(BuildContext context) {
    return Row(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                arguments.name!,
                style: TextStyleHelper.getTextStyle(
                  context,
                  'rBold24',
                ),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
              Row(
                spacing: 5,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 16,
                    color: AppColors.iconColor,
                  ),
                  Text(
                    arguments.location!,
                    style: TextStyleHelper.getTextStyle(
                        context, 'rMedium16Location'),
                  ),
                ],
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            if (cWeather.isLoading.isFalse) {
              Get.toNamed(AppRoutes.detaiWeatherScreen, arguments: {
                'cWeather': cWeather.weatherModel.value,
                'cityName': arguments.city,
              });
            }
          },
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 5,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.cloud_rounded,
                      color: AppColors.iconColor,
                    ),
                  ),
                  Obx(
                    () {
                      if (cWeather.isLoading.value) {
                        return Text(
                          'Loading...',
                          style: TextStyleHelper.getTextStyle(
                              context, 'rMedium16'),
                        );
                      }
                      return Text(
                        '${cWeather.weatherModel.value.main!.temp!.toInt()} °C',
                        style:
                            TextStyleHelper.getTextStyle(context, 'rMedium16'),
                      );
                    },
                  ),
                ],
              ),
              Text(
                'See details',
                style: TextStyleHelper.getTextStyle(context, 'rRegular10')!
                    .copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  ReadMoreText descriptionText(
      DestinationModel arguments, BuildContext context) {
    return ReadMoreText(
      arguments.description!,
      style: TextStyleHelper.getTextStyle(context, 'rRegular14'),
      trimLines: 5,
      textAlign: TextAlign.justify,
      colorClickableText: AppColors.lightGreyColor,
      trimMode: TrimMode.Line,
      moreStyle: TextStyleHelper.getTextStyle(context, 'rMedium16')!.copyWith(
        color: AppColors.lightGreyColor,
        decoration: TextDecoration.underline,
      ),
      lessStyle: TextStyleHelper.getTextStyle(context, 'rMedium16')!.copyWith(
        color: AppColors.lightGreyColor,
        decoration: TextDecoration.underline,
      ),
      trimCollapsedText: '\nSee more',
      trimExpandedText: '\nSee less',
    );
  }

  Row detailStatus(BuildContext context, DestinationModel arguments) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            Icons.access_time_filled_rounded,
            color: AppColors.iconColor,
          ),
        ),
        SizedBox(width: 10),
        Text(
          arguments.status!,
          style: TextStyleHelper.getTextStyle(context, 'rMedium16'),
        ),
        SizedBox(width: 20),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            Icons.star_rounded,
            color: AppColors.iconColor,
          ),
        ),
        SizedBox(width: 10),
        Text(
          arguments.rating.toString(),
          style: TextStyleHelper.getTextStyle(context, 'rMedium16'),
        ),
      ],
    );
  }
}
