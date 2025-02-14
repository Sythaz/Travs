import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travs/controllers/c_discover.dart';
import 'package:travs/views/widgets/custom_bottom_navigation.dart';
import '../routes/app_route.dart';
import '../themes/app_assets.dart';
import '../themes/app_colors.dart';
import '../themes/text_style_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cDiscover = Get.put(CDiscover());
  final searchController = TextEditingController();

  @override
  void initState() {
    cDiscover.getDataDestination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        bottomNavigationBar: customBottomNavigation(
          context,
          Theme.of(context).colorScheme.surface,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppAssets.homeIcon,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_rounded, size: 32),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border_rounded, size: 32),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_outline_rounded, size: 32),
              ),
            ],
          ),
        ),
        appBar: appBarCustom(context),
        body: Column(
          spacing: 10,
          children: [
            header(context),
            searchField(context),
            category(),
            sortAndGrid(context),
            Obx(
              () {
                if (cDiscover.isGrid.value) {
                  return gridContent();
                }
                return cardContent();
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBarCustom(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Obx(
        () {
          if (cDiscover.isLoading.value) {
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
          if (cDiscover.isLoading.value) {
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
          return Text(
            'Discover',
            style: TextStyleHelper.getTextStyle(context, 'mBold18'),
          );
        },
      ),
      actions: [
        Obx(
          () {
            if (cDiscover.isLoading.value) {
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
              child: Icon(Icons.search_rounded, size: 32),
            );
          },
        ),
      ],
    );
  }

  Padding header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () {
          if (cDiscover.isLoading.value) {
            return Row(
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
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Syafiq!',
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
          );
        },
      ),
    );
  }

  Padding searchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () {
          if (cDiscover.isLoading.value) {
            return Shimmer.fromColors(
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
            );
          }
          return Stack(
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
                      .map(
                          (category) => 'Search destinations across $category!')
                      .toList(),
                  hintTextStyle:
                      TextStyleHelper.getTextStyle(context, 'rRegular14'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox category() {
    return SizedBox(
      height: 40,
      child: Obx(
        () {
          if (cDiscover.isLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      index == 0 ? 16 : 8,
                      0,
                      index == 6 - 1 ? 16 : 8,
                      0,
                    ),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return ListView.builder(
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
                      color: cDiscover.category.value ==
                              cDiscover.categories[index]
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
                                    'rMedium14Category',
                                  ),
                                )
                              : Text(
                                  cDiscover.categories[index],
                                  style: TextStyleHelper.getTextStyle(
                                          context, 'rMedium14Category')!
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
          );
        },
      ),
    );
  }

  Padding sortAndGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () {
          if (cDiscover.isLoading.value) {
            return Row(
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
            );
          }
          return Row(
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
                                  context, 'rMedium14Sort'),
                            );
                          }
                          return Text(
                            'Sort by Z-A',
                            style: TextStyleHelper.getTextStyle(
                                context, 'rMedium14Sort'),
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
          );
        },
      ),
    );
  }

  Expanded gridContent() {
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
                        child: const Icon(
                          Icons.bookmark_add_outlined,
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
                          // spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cDiscover.getListDestination[index].name!,
                              style: TextStyleHelper.getTextStyle(
                                  context, 'rMedium16Name'),
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

  Obx cardContent() {
    return Obx(
      () {
        int cardLength = cDiscover.getListCards.length;
        if (cDiscover.isLoading.value) {
          return Stack(
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
          );
        }
        return cardLength == 0
            ? Text(
                "Oops! We couldn't find any matches.\nLet's try another search.",
                textAlign: TextAlign.center,
                style: TextStyleHelper.getTextStyle(
                  context,
                  'rMedium14CategoryNonActive',
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 480,
                width: double.infinity,
                child: CardSwiper(
                  numberOfCardsDisplayed: cardLength == 1 ? 1 : 2,
                  threshold: 70,
                  cardsCount: cardLength,
                  isDisabled: cDiscover.getListDestination.length == 1,
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  cardBuilder: (context, index, horizontalOffsetPercentage,
                          verticalOffsetPercentage) =>
                      cDiscover.getListCards[index],
                ),
              );
      },
    );
  }
}
