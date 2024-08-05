import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:CampusCommunities/features/auth/model/usermodel.dart';
import 'package:CampusCommunities/utils/constants.dart';

class AuthRepository {
  Future<String?> loginUserWithEmailPassword(
      {required final String email, required final String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      final user = response.user;
      return user?.id;
    } catch (e) {
      return null;
    }
  }

  Future<String?> signupUserWithEmailPassword({
    required final String email,
    required final String password,
    required final String username,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );
      final userId = response.user?.id;
      return userId;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await supabaseClient
          .from('accounts')
          .select('*')
          .eq('id', supabaseClient.auth.currentUser!.id);

      return UserModel.fromJson(response.first);
    } catch (error) {
      return null;
    }
  }

  Future<void> logout() async {
    // Sign out the user from Supabase
    await supabaseClient.auth.signOut();
    const storage = FlutterSecureStorage();
    await storage.delete(key: supabasePersistSessionKey);
  }
}
