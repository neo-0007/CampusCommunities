import 'package:flutter/material.dart';
import 'package:CampusCommunities/features/auth/view/pages/login_or_signup_page.dart';
import 'package:CampusCommunities/features/auth/view/pages/login_page.dart';
import 'package:CampusCommunities/features/auth/view/pages/signup_page.dart';
import 'package:CampusCommunities/features/mainapp/main_page.dart';
import 'package:CampusCommunities/utils/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Use FutureBuilder to check the auth state
      home: FutureBuilder<AuthState>(
        future: _checkAuthState(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(
                child: Text('Error checking authentication state'));
          } else if (snapshot.data!.isAuthenticated) {
            return const MainPage();
          } else {
            return const LoginOrSignupPage();
          }
        },
      ),
      routes: {
        '/auth-start': (context) => const LoginOrSignupPage(),
        '/home-page': (context) => const MainPage(),
        '/login-page': (context) => const LoginPage(),
        '/signup-page': (context) => const SignupPage(),
      },
    );
  }

  Future<AuthState> _checkAuthState() async {
    final session = supabaseClient.auth.currentSession;
    return AuthState(isAuthenticated: session != null);
  }
}

class AuthState {
  final bool isAuthenticated;

  AuthState({required this.isAuthenticated});
}
