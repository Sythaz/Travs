import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travs/models/destination.dart';
import 'package:travs/routes/app_route.dart';

import '../../controllers/c_favorite.dart';
import '../../themes/app_colors.dart';
import '../../themes/text_style_helper.dart';

class Cards extends StatelessWidget {
  final DestinationModel? data;

  const Cards({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final cFavorite = Get.put(CFavorite());

    return Builder(
      builder: (context) {
        return Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(30),
          shadowColor: Colors.black,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: () {
                Get.toNamed(
                  AppRoutes.detailScreen,
                  arguments: data,
                );
              },
              child: SizedBox.expand(
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      data!.cover!,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment(0.85, -0.9),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 50,
                        width: 50,
                        child: Obx(
                          () {
                            if (cFavorite.favoriteList.any(
                                (fav) => fav.destinationName == data!.name!)) {
                              return Icon(
                                Icons.bookmark,
                                color: AppColors.whiteColor,
                              );
                            }
                            return const Icon(
                              Icons.bookmark_add_outlined,
                              color: AppColors.whiteColor,
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.9),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withValues(alpha: .5),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 70,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data!.name!,
                              style: TextStyleHelper.getTextStyle(
                                  context, 'rMedium16Name'),
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                Icon(Icons.location_on_outlined, size: 20),
                                Text(
                                  data!.location!,
                                  style: TextStyleHelper.getTextStyle(
                                      context, 'rRegular14'),
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
            ),
          ),
        );
      },
    );
  }
}
