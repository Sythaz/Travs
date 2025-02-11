import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travs/models/destination.dart';

import '../services/destination_service.dart';
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
            title: getListDestination[i].name,
            location: getListDestination[i].location,
            cover: getListDestination[i].cover,
          ),
        );
      }
      // ingin delay 5 detik
      await Future.delayed(const Duration(seconds: 2));
      // print('Category: ${categories.length}');
      // print('List Destination: ${_listDestination.length}');
    } catch (e) {
      // print('Error BANG: $e');
    } finally {
      // print('Segini BANG::: ${_listDestination.value.length}');
      isLoading.value = false;
    }
  }

  switchTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
