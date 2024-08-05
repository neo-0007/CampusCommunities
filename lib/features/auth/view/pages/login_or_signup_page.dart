import 'package:flutter/material.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/features/auth/view/widgets/text_button.dart';

class LoginOrSignupPage extends StatelessWidget {
  const LoginOrSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ReplyAppColors.notWhite,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Spacing in top
            SizedBox(
              height: screenSize.height / 3.2,
            ),
            //App Logo
            Image.asset(
              'assets/images/CC_logo2_transp.png',
              width: 300,
            ),
            //Space
            SizedBox(
              height: screenSize.height / 3.2,
            ),
            //Login and Signup buttons side by side for selection
            //Login button
            LoginSignUpButton(
                buttonText: 'Login',
                onButtonTap: () {
                  Navigator.pushNamed(context, '/login-page');
                }),
            const SizedBox(
              height: 10,
            ),
            //SignUp button
            LoginSignUpButton(
              buttonText: 'Signup',
              buttonColor: ReplyAppColors.dismissibleBackground,
              textColor: ReplyAppColors.nearlyWhite,
              onButtonTap: () {
                Navigator.pushNamed(context, '/signup-page');
              },
            )
          ],
        ),
      ),
    );
  }
}
