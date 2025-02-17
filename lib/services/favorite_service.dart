import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travs/models/favorite_model.dart';

class FavoriteService {
  static Future<dynamic> fetchFavorite() async {
    final client = Supabase.instance.client;

    try {
      final res = await client
          .from('favorites')
          .select('destination_name')
          .eq('user_id', client.auth.currentUser!.id);

      return FavoriteModel.fromJsonList(res);
    } catch (e) {
      Get.snackbar('Error fetching favorite', e.toString());
    }
  }

  static insertFavorite(nameDestination) async {
    final client = Supabase.instance.client;

    try {
      await client.from('favorites').insert(
        {
          'user_id': client.auth.currentUser!.id,
          'destination_name': nameDestination,
          'created_at': DateTime.now().toIso8601String()
        },
      );
    } catch (e) {
      Get.snackbar('Error inserting favorite', e.toString());
    }
  }

  static removeFavorite(nameDestination) async {
    final client = Supabase.instance.client;

    try {
      await client
          .from('favorites')
          .delete()
          .eq('destination_name', nameDestination);
    } catch (e) {
      Get.snackbar('Error removing favorite', e.toString());
    }
  }
}
