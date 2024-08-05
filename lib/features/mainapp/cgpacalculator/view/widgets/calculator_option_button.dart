import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class CalculatorOptionButton extends StatelessWidget {
  final void Function() onButtonPressed;
  final String buttonText;
  const CalculatorOptionButton(
      {super.key, required this.onButtonPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ReplyAppColors.dismissibleBackground,
          elevation: 2,
          padding: const EdgeInsets.all(5),
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.roboto(
              color: ReplyAppColors.nearlyWhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
