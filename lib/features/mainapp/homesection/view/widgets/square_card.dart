import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class SquareCard extends StatelessWidget {
  final void Function() onCardTap;
  final String imagePath;
  final String text;
  const SquareCard(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onCardTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Expanded(
      child: InkWell(
        onTap: onCardTap,
        child: Card.outlined(
          borderOnForeground: true,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: ReplyAppColors.nearlyWhite,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SvgPicture.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Text(
                    text,
                    style: GoogleFonts.roboto(
                      color: ReplyAppColors.darkerText,
                      fontSize: screenSize.width / 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
