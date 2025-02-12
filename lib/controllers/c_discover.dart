import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travs/models/destination.dart';

import '../services/destination_service.dart';
import '../themes/app_themes.dart';
import '../views/widgets/cards.dart';

class CDiscover extends GetxController {
  var isLoading = false.obs;
  final categories = [].obs;
  final _listDestination = <Destination>[].obs;
  final isDarkMode = false.obs;

  List<Destination> get getListDestination => _listDestination;

  List<Widget> cards = [];

  getDataDestination() async {
    try {
      isLoading.value = true;

      _listDestination.value = await DestinationService.fetchDestinations();

      var categoriesInData =
          _listDestination.map((e) => e.category).toSet().toList();

      categories.value = ['All Place', ...categoriesInData];

      cards.clear();
      for (var i = 0; i < _listDestination.length; i++) {
        cards.add(
          Cards(
            data: getListDestination[i],
          ),
        );
      }
      // To show shimmer loading
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      print('$e');
    } finally {
      isLoading.value = false;
    }
  }

  switchTheme(BuildContext context) {
    isDarkMode.value = !isDarkMode.value;
    final newTheme =
        isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme;
    ThemeSwitcher.of(context).changeTheme(
      theme: newTheme,
    );
  }
}
