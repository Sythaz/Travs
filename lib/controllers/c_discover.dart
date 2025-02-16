import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travs/models/destination.dart';

import '../services/destination_service.dart';
import '../themes/app_themes.dart';
import '../views/widgets/cards.dart';

class CDiscover extends GetxController {
  final isLoading = false.obs;
  final isDarkMode = false.obs;
  final isGrid = false.obs;
  final isAscending = true.obs;

  final categories = [].obs;
  final category = 'All Place'.obs;

  final _listDestination = <Destination>[].obs;
  final _filteredListDestination = <Destination>[].obs;
  List<Destination> get getListDestination => _filteredListDestination;

  final _cards = [].obs;
  get getListCards => _cards;

  getDataDestination() async {
    try {
      isLoading.value = true;

      _listDestination.value = await DestinationService.fetchDestinations();

      var categoriesInData =
          _listDestination.map((e) => e.category).toSet().toList();
      categories.value = ['All Place', ...categoriesInData];

      _applyFilters();
      updateCards();
    } catch (e) {
      Get.snackbar('Error fetching destination', e.toString());
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

  void updateCards() {
    _cards.assignAll(
      _filteredListDestination
          .map((destination) => Cards(data: destination))
          .toList(),
    );
  }

  _applyFilters({String searchQuery = ''}) {
    List<Destination> tempList = _listDestination;

    if (searchQuery.isNotEmpty) {
      tempList = tempList
          .where((destination) => destination.name!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    }

    if (category.value != 'All Place') {
      tempList = tempList
          .where((destination) => destination.category!
              .toLowerCase()
              .contains(category.value.toLowerCase()))
          .toList();
    }

    tempList.sort(
      (a, b) {
        final firstName = a.name?.toLowerCase();
        final secondName = b.name?.toLowerCase();
        return isAscending.value
            ? firstName!.compareTo(secondName!)
            : secondName!.compareTo(firstName!);
      },
    );

    _filteredListDestination.value = tempList;

    updateCards();
  }

  sortCategory(String newCategory) {
    category.value = newCategory;

    _applyFilters();
  }

  sortDestination() {
    isAscending.value = !isAscending.value;

    _applyFilters();
  }

  searchDestination(String query) {
    _applyFilters(searchQuery: query);
  }
}
