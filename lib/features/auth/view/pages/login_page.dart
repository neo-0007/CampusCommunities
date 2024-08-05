import 'package:flutter/material.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/core/widgets/back_button_custom.dart';
import 'package:CampusCommunities/core/widgets/snackbar_message.dart';
import 'package:CampusCommunities/features/auth/view/widgets/text_field_custom.dart';
import 'package:CampusCommunities/features/auth/view/widgets/text_button.dart';
import 'package:CampusCommunities/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReplyAppColors.notWhite,
      appBar: AppBar(
        backgroundColor: ReplyAppColors.notWhite,
        leading: const BackButtonCustom(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldCustom(
            hintText: 'Email',
            controller: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldCustom(
            hintText: 'Password',
            isPassword: true,
            controller: passwordController,
          ),
          const SizedBox(
            height: 10,
          ),
          isLoading
              ? const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ReplyAppColors.dismissibleBackground),
                  ),
                )
              : LoginSignUpButton(
                  buttonText: 'Login',
                  buttonColor: ReplyAppColors.dismissibleBackground,
                  textColor: ReplyAppColors.nearlyWhite,
                  onButtonTap: () async {
                    setState(() {
                      isLoading = true;
                    });

                    final loginValue =
                        await authRepository.loginUserWithEmailPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    setState(() {
                      isLoading = false;
                    });

                    if (loginValue != null) {
                      if (!context.mounted) return;
                      Navigator.pushReplacementNamed(context, '/home-page');
                      Utils.showSnackbar(context, 'Successfully Logged In!',
                          backgroundColor: Colors.green);
                    } else {
                      if (!context.mounted) return;
                      Utils.showSnackbar(context, 'Invalid Email or Password',
                          backgroundColor: Colors.redAccent);
                    }
                  },
                ),
        ],
      ),
    );
  }
}
