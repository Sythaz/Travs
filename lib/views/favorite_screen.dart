import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travs/controllers/c_discover.dart';
import 'package:travs/controllers/c_favorite.dart';

import '../routes/app_route.dart';
import '../themes/app_assets.dart';
import '../themes/app_colors.dart';
import '../themes/text_style_helper.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cDiscover = Get.put(CDiscover());
    final cFavorite = Get.put(CFavorite());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          sortAndGrid(context, cFavorite),
          gridContent(cDiscover, cFavorite),
        ],
      ),
    );
  }

  Row sortAndGrid(BuildContext context, CFavorite cFavorite) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              cFavorite.sortDestination();
            },
            child: Row(
              spacing: 5,
              children: [
                SvgPicture.asset(
                  AppAssets.sortIcon,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                Obx(
                  () {
                    if (cFavorite.isAscending.value) {
                      return Text(
                        'Sort by A-Z',
                        style:
                            TextStyleHelper.getTextStyle(context, 'rMedium14')!
                                .copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    }
                    return Text(
                      'Sort by Z-A',
                      style: TextStyleHelper.getTextStyle(context, 'rMedium14')!
                          .copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Expanded gridContent(CDiscover cDiscover, CFavorite cFavorite) {
    return Expanded(
      child: Obx(
        () {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemCount: cFavorite.favoriteList.length,
            itemBuilder: (context, index) {
              var destinationName =
                  cFavorite.favoriteList[index].destinationName;
              final favoriteItem = cDiscover.getAllListDestination
                  .firstWhere((element) => element.name == destinationName);
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.detailScreen,
                      arguments: favoriteItem,
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        favoriteItem.cover!,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment(0.85, -0.9),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: .5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.bookmark,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 1),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withValues(alpha: .5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 70,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favoriteItem.name!,
                                style: TextStyleHelper.getTextStyle(
                                        context, 'rMedium16')!
                                    .copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Row(
                                spacing: 3,
                                children: [
                                  Icon(Icons.location_on_outlined, size: 15),
                                  Text(
                                    favoriteItem.location!,
                                    style: TextStyleHelper.getTextStyle(
                                        context, 'rRegular10'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
