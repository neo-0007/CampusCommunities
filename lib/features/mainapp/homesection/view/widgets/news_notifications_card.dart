import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class NewsNotificationsCard extends StatelessWidget {
  const NewsNotificationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      borderOnForeground: true,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
          height: 500.0,
          decoration: BoxDecoration(
            color: ReplyAppColors.nearlyWhite,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: Text(
                  'NEWS AND NOTIFICATIONS',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              //Content
            ],
          )),
    );
  }
}
