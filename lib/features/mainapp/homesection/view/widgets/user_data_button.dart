import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDataButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  const UserDataButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ReplyAppColors.dismissibleBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.edit,color: Colors.white,size: 15,),
          const SizedBox(width: 5,),
          Text(
            buttonText,
            style: GoogleFonts.roboto(
              color: ReplyAppColors.nearlyWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
