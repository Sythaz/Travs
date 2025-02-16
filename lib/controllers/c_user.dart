import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travs/services/user_service.dart';

class CUser extends GetxController {
  var isLoading = false.obs;
  // final client = Supabase.instance.client;
  var user = {};

  login() async {
    try {
      isLoading.value = true;

      await UserService.autoLogin();
    } catch (e) {
      Get.snackbar('Error Login', '$e');
    } finally {
      isLoading.value = false;
    }
  }

  getDataUser() async {
    isLoading.value = true;

    final data = await UserService.fetchUser();
    user = data as Map<String, dynamic>;

    isLoading.value = false;
  }
}
