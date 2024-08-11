import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDataBox extends StatelessWidget {
  final String topText;
  final String bottomText;
  const UserDataBox({super.key, required this.topText, required this.bottomText});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: ReplyAppColors.grey,
        ),
        color: ReplyAppColors.nearlyWhite,
      ),
      height: 50,
      width: screenSize.width - 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                topText,
                style: GoogleFonts.roboto(fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 2), // Spacing between the texts
            Expanded(
              child: Text(
                bottomText,
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
