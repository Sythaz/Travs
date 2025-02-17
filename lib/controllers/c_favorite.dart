import 'package:get/get.dart';
import 'package:travs/models/favorite_model.dart';
import 'package:travs/services/favorite_service.dart';

class CFavorite extends GetxController {
  var isLoading = false.obs;
  // berupa list model favoritemodel
  var favoriteList = <FavoriteModel>[].obs;

  getDataFavorite() async {
    final data = await FavoriteService.fetchFavorite();

    favoriteList.value = data;
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

      // favoriteList.removeWhere(
      //   (item) => item['destination_name'] == nameDestination,
      // );
      getDataFavorite();
    } catch (e) {
      Get.snackbar('Error removing favorite', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
