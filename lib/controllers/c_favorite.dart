import 'package:get/get.dart';
import 'package:travs/models/favorite_model.dart';
import 'package:travs/services/favorite_service.dart';

class CFavorite extends GetxController {
  final isLoading = false.obs;
  final isAscending = true.obs;
  final favoriteList = <FavoriteModel>[].obs;

  getDataFavorite() async {
    final data = await FavoriteService.fetchFavorite();
    favoriteList.value = data;

    sortDestination();
  }

  insertFavorite(nameDestination) async {
    try {
      isLoading.value = true;

      await FavoriteService.insertFavorite(nameDestination);

      getDataFavorite();
    } catch (e) {
      Get.snackbar('Error inserting favorite', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  removeItemFavorite(nameDestination) async {
    try {
      isLoading.value = true;

      await FavoriteService.removeFavorite(nameDestination);

      getDataFavorite();
    } catch (e) {
      Get.snackbar('Error removing favorite', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  sortDestination() {
    isAscending.value = !isAscending.value;

    favoriteList.sort(
      (a, b) {
        final firstName = a.destinationName?.toLowerCase();
        final secondName = b.destinationName?.toLowerCase();
        return isAscending.value
            ? firstName!.compareTo(secondName!)
            : secondName!.compareTo(firstName!);
      },
    );
  }
}
