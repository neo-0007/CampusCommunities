import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadButton extends StatelessWidget {
  final String buttonText;
  final void Function() onButtonTap;
  final Color buttonColor;
  final Color textColor;
  const UploadButton(
      {super.key,
      required this.buttonText,
      required this.onButtonTap,
      required this.textColor,
      required this.buttonColor
      });

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
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
        ),

    );
  }
}
