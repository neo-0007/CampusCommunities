import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:CampusCommunities/features/auth/repository/auth_repository.dart';

class Constants {
  // Lazy initialization of SupabaseClient using a singleton pattern
  static SupabaseClient? _supabaseClient;
  static SupabaseClient get supabaseClient {
    _supabaseClient ??= SupabaseSingleton.instance.client;
    return _supabaseClient!;
  }

  // Lazy initialization of AuthRepository
  static AuthRepository? _authRepository;
  static AuthRepository get authRepository {
    _authRepository ??= AuthRepository();
    return _authRepository!;
  }
}

class SupabaseSingleton {
  SupabaseSingleton._internal();

  static final SupabaseSingleton _instance = SupabaseSingleton._internal();

  static SupabaseSingleton get instance => _instance;

  final SupabaseClient client = Supabase.instance.client;
}

final supabaseClient = Constants.supabaseClient;
final authRepository = Constants.authRepository;
