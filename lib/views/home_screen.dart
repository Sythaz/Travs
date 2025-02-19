import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travs/controllers/c_home.dart';
import 'package:travs/views/discover_screen.dart';
import 'package:travs/views/widgets/custom_bottom_navigation.dart';
import '../controllers/c_discover.dart';
import '../controllers/c_favorite.dart';
import '../controllers/c_user.dart';
import '../themes/app_assets.dart';
import '../themes/app_colors.dart';
import '../themes/text_style_helper.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final cDiscover = Get.put(CDiscover());
  final cUser = Get.put(CUser());
  final cFavorite = Get.put(CFavorite());
  final cHome = Get.put(CHome());
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: appBarCustom(context, cHome),
      bottomNavigationBar: customBottomNavigation(
        context,
        Theme.of(context).colorScheme.surface,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                cHome.setIndexPage = 0;
              },
              icon: Obx(
                () {
                  if (cHome.getIndexPage == 0) {
                    return SvgPicture.asset(AppAssets.homeIcon,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn));
                  }
                  return SvgPicture.asset(
                    AppAssets.homeOutlinedIcon,
                    width: 24,
                  );
                },
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_rounded, size: 32),
            ),
            IconButton(
              onPressed: () {
                cHome.setIndexPage = 2;
              },
              icon: Obx(
                () {
                  if (cHome.getIndexPage == 2) {
                    return Icon(
                      Icons.bookmark_rounded,
                      size: 32,
                      color: Theme.of(context).colorScheme.primary,
                    );
                  }
                  return Icon(Icons.bookmark_border_rounded, size: 32);
                },
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline_rounded, size: 32),
            ),
          ],
        ),
        cDiscover.isDarkMode.value,
      ),
      body: Obx(
        () {
          if (cHome.getIndexPage == 2) {
            return FavoriteScreen();
          } else {
            return DiscoverScreen();
          }
        },
      ),
    );
  }

  AppBar appBarCustom(BuildContext context, CHome cHome) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: Obx(
        () {
          if (cDiscover.isLoading.value || cUser.isLoading.value) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 10),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
          return Icon(Icons.subject_rounded, size: 32);
        },
      ),
      centerTitle: true,
      title: Obx(
        () {
          if (cDiscover.isLoading.value || cUser.isLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                width: 100,
                height: 24,
              ),
            );
          }
          return Obx(
            () {
              if (cHome.getIndexPage == 2) {
                return Text(
                  'Favorite',
                  style: TextStyleHelper.getTextStyle(context, 'mBold18'),
                );
              }
              return Text(
                'Discover',
                style: TextStyleHelper.getTextStyle(context, 'mBold18'),
              );
            },
          );
        },
      ),
      actions: [
        Obx(
          () {
            if (cDiscover.isLoading.value || cUser.isLoading.value) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor1,
                backgroundImage: NetworkImage(
                  cUser.user.value.profile!,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
