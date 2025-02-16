import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  static autoLogin() async {
    final client = Supabase.instance.client;

    await client.auth.signInWithPassword(
      email: '${dotenv.env['EMAIL_USER']}',
      password: '${dotenv.env['PASSWORD_USER']}',
    );
  }

  static Future<dynamic> fetchUser() async {
    final client = Supabase.instance.client;

    try {
      final res = await client
          .from('users')
          .select()
          .eq('user_id', client.auth.currentUser!.id)
          .limit(1)
          .single();
      return res;
    } catch (e) {
      Get.snackbar('Error fetching user', e.toString());
    }
  }
}
