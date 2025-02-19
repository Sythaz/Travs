import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travs/controllers/c_discover.dart';
import 'package:travs/controllers/c_favorite.dart';
import '../controllers/c_user.dart';
import '../routes/app_route.dart';
import '../themes/app_assets.dart';
import '../themes/app_colors.dart';
import '../themes/text_style_helper.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cDiscover = Get.put(CDiscover());
    final cUser = Get.put(CUser());
    final cFavorite = Get.put(CFavorite());
    final searchController = TextEditingController();

    return ThemeSwitchingArea(
      child: Scaffold(body: Obx(
        () {
          if (cDiscover.isLoading.value || cUser.isLoading.value) {
            return shimmerWidget();
          }
          return Column(
            spacing: 10,
            children: [
              header(context, cUser, cDiscover),
              searchField(context, searchController, cDiscover),
              category(cDiscover),
              sortAndGrid(context, cDiscover),
              Obx(
                () {
                  if (cDiscover.isGrid.value) {
                    return gridContent(cDiscover, cFavorite);
                  }
                  return cardContent(context, cDiscover);
                },
              ),
            ],
          );
        },
      )),
    );
  }

  Padding shimmerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 10,
        children: [
          // Header Shimmer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      width: 160,
                      height: 32,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      width: 200,
                      height: 12,
                    ),
                  ),
                ],
              ),
              Shimmer.fromColors(
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
            ],
          ),

          // Search Shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          // Category Shimmer
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            child: Row(
              children: List.generate(
                5,
                (index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      index == 0 ? 0 : 8,
                      0,
                      index == 5 - 1 ? 16 : 8,
                      0,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Sort Shimmer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  width: 150,
                  height: 24,
                ),
              ),
              Shimmer.fromColors(
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
            ],
          ),

          // Card Shimmer
          Stack(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(top: 20, left: 60, right: 60),
                  height: 480,
                  width: double.infinity,
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 480,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding header(BuildContext context, CUser cUser, CDiscover cDiscover) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, ${cUser.user.value.name}!',
                style: TextStyleHelper.getTextStyle(context, 'rBold24'),
              ),
              Text(
                'Discover your next adventure!',
                style: TextStyleHelper.getTextStyle(context, 'rRegular14'),
              )
            ],
          ),
          ThemeSwitcher(
            builder: (context) {
              return InkWell(
                onTap: () {
                  cDiscover.switchTheme(context);
                },
                borderRadius: BorderRadius.circular(15),
                child: Obx(
                  () {
                    return SvgPicture.asset(
                      cDiscover.isDarkMode.value
                          ? AppAssets.lightModeIcon
                          : AppAssets.darkModeIcon,
                      width: 32,
                      colorFilter: ColorFilter.mode(
                        cDiscover.isDarkMode.value
                            ? AppColors.primaryColor2
                            : AppColors.primaryColor1,
                        BlendMode.srcIn,
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Padding searchField(BuildContext context,
      TextEditingController searchController, CDiscover cDiscover) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: AppColors.iconColor),
            ),
            child: AnimatedTextField(
              controller: searchController,
              onChanged: (value) {
                cDiscover.searchDestination(value);
              },
              animationType: Animationtype.slide,
              animationDuration: Duration(milliseconds: 1500),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppAssets.searchIcon,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.iconColor,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                contentPadding: EdgeInsets.all(12),
              ),
              hintTexts: cDiscover.categories
                  .where((category) => category != 'All Place')
                  .map((category) => 'Search destinations across $category!')
                  .toList(),
              hintTextStyle:
                  TextStyleHelper.getTextStyle(context, 'rRegular14'),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox category(CDiscover cDiscover) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cDiscover.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == cDiscover.categories.length - 1 ? 16 : 8,
              0,
            ),
            child: Obx(
              () {
                return Material(
                  color: cDiscover.category.value == cDiscover.categories[index]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      cDiscover.sortCategory(cDiscover.categories[index]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: cDiscover.category.value ==
                              cDiscover.categories[index]
                          ? Text(
                              cDiscover.categories[index],
                              style: TextStyleHelper.getTextStyle(
                                context,
                                'rMedium14',
                              )!
                                  .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            )
                          : Text(
                              cDiscover.categories[index],
                              style: TextStyleHelper.getTextStyle(
                                      context, 'rMedium14')!
                                  .copyWith(
                                color: AppColors.lightGreyColor,
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Padding sortAndGrid(BuildContext context, CDiscover cDiscover) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                cDiscover.sortDestination();
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
                      if (cDiscover.isAscending.value) {
                        return Text(
                          'Sort by A-Z',
                          style: TextStyleHelper.getTextStyle(
                                  context, 'rMedium14')!
                              .copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        );
                      }
                      return Text(
                        'Sort by Z-A',
                        style:
                            TextStyleHelper.getTextStyle(context, 'rMedium14')!
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
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              cDiscover.isGrid.value = !cDiscover.isGrid.value;
            },
            child: Obx(
              () {
                if (cDiscover.isGrid.value) {
                  return Icon(
                    Icons.web_stories_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  );
                }
                return Icon(
                  Icons.grid_view_outlined,
                  color: Theme.of(context).colorScheme.primary,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Expanded gridContent(CDiscover cDiscover, CFavorite cFavorite) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: cDiscover.getListDestination.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.detailScreen,
                    arguments: cDiscover.getListDestination[index],
                  );
                },
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      cDiscover.getListDestination[index].cover!,
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
                        child: Obx(
                          () {
                            if (cFavorite.favoriteList.any((fav) =>
                                fav.destinationName ==
                                cDiscover.getListDestination[index].name)) {
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
                              cDiscover.getListDestination[index].name!,
                              style: TextStyleHelper.getTextStyle(
                                      context, 'rMedium16')!
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            Row(
                              spacing: 3,
                              children: [
                                Icon(Icons.location_on_outlined, size: 15),
                                Text(
                                  cDiscover.getListDestination[index].location!,
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
        ),
      ),
    );
  }

  StatelessWidget cardContent(BuildContext context, CDiscover cDiscover) {
    int cardLength = cDiscover.getListCards.length;
    return cardLength == 0
        ? Text(
            "Oops! We couldn't find any matches.\nLet's try another search.",
            textAlign: TextAlign.center,
            style: TextStyleHelper.getTextStyle(context, 'rMedium14')!
                .copyWith(color: AppColors.lightGreyColor),
          )
        : Container(
            key: UniqueKey(),
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 480,
            width: double.infinity,
            child: CardSwiper(
              numberOfCardsDisplayed: cardLength == 1 ? 1 : 2,
              threshold: 70,
              cardsCount: cardLength,
              isDisabled:
                  cDiscover.getListDestination.length == 1 || cardLength == 1,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              cardBuilder: (context, index, horizontalOffsetPercentage,
                      verticalOffsetPercentage) =>
                  cDiscover.getListCards[index],
            ),
          );
  }
}
