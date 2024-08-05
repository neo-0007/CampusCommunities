import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class InstituteCardButton extends StatelessWidget {
  final String buttonText;
  final void Function() onButtonPressed;
  const InstituteCardButton(
      {super.key, required this.buttonText, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: onButtonPressed,
        child: FittedBox(
          child: Text(buttonText,
              style: GoogleFonts.roboto(
                color: ReplyAppColors.darkText,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
