import 'package:flutter/material.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/core/widgets/back_button_custom.dart';
import 'package:CampusCommunities/core/widgets/snackbar_message.dart';
import 'package:CampusCommunities/features/auth/view/widgets/text_field_custom.dart';
import 'package:CampusCommunities/features/auth/view/pages/user_data_page.dart';
import 'package:CampusCommunities/features/auth/view/widgets/text_button.dart';
import 'package:CampusCommunities/utils/constants.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
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
            hintText: 'Name',
            controller: nameController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldCustom(
            hintText: 'Email',
            controller: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldCustom(
            hintText: 'Password (more than 6 characters)',
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
                  buttonText: 'Signup',
                  buttonColor: ReplyAppColors.dismissibleBackground,
                  textColor: ReplyAppColors.nearlyWhite,
                  onButtonTap: () async {
                    isLoading = true;
                    final res =
                        await authRepository.signupUserWithEmailPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      username: nameController.text,
                    );

                    if (res != null) {
                      isLoading = false;
                      if (!context.mounted) return;
                      Utils.showSnackbar(
                          context, 'Account created Successfully',
                          backgroundColor: Colors.green);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDataPage(
                            userId: res,
                            username: nameController.text,
                          ),
                        ),
                      );
                    } else {
                      isLoading = false;
                      if (!context.mounted) return;
                      Utils.showSnackbar(context,
                          'Error occurred during signup. Please try again.',
                          backgroundColor: Colors.redAccent);
                    }
                  },
                )
        ],
      ),
    );
  }
}
