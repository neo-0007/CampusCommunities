import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

//Button for Login and SignUp
class LoginSignUpButton extends StatelessWidget {
  final String buttonText;
  final void Function() onButtonTap;
  final Color buttonColor;
  final Color textColor;

  const LoginSignUpButton(
      {super.key,
      required this.buttonText,
      required this.onButtonTap,
      this.buttonColor = ReplyAppColors.nearlyWhite,
      this.textColor = ReplyAppColors.dismissibleBackground});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width - 30,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
          ),
          onPressed: () {
            onButtonTap();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
            child: Text(
              buttonText,
              style: GoogleFonts.workSans(
                  fontSize: 17, fontWeight: FontWeight.w600, color: textColor),
            ),
          )),
    );
  }
}
