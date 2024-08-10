import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:CampusCommunities/core/secrets/app_secrets.dart';
import 'package:CampusCommunities/features/auth/repository/local_auth_repository.dart';
import 'package:CampusCommunities/myapp.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initializing the Supabase
  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseApiKey,
    authOptions: FlutterAuthClientOptions(
      localStorage: MySecureStorage(),
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {
    runApp(const MyApp());
  });
}
