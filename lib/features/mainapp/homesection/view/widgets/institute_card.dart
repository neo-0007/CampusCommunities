import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/features/mainapp/homesection/view/widgets/institute_card_button.dart';
import 'package:url_launcher/url_launcher.dart';

class InstituteCard extends StatelessWidget {
  final String instituteName;
  final String instituteImage;
  const InstituteCard(
      {super.key, required this.instituteName, required this.instituteImage});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Card.outlined(
      color: ReplyAppColors.nearlyWhite,
      borderOnForeground: true,
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.expand,
              children: [
                Image.asset(
                  instituteImage,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 70,
                  bottom: 60,
                  child: Text(
                    instituteName,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: ReplyAppColors.nearlyWhite,
                      fontSize: screenSize.width / 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InstituteCardButton(
                  buttonText: 'Website',
                  onButtonPressed: () {
                    const link = 'https://www.tezu.ernet.in/';
                    launchUrl(Uri.parse(link),
                        mode: LaunchMode.externalApplication);
                  },
                ),
                const SizedBox(width: 5),
                InstituteCardButton(
                  buttonText: 'Contacts',
                  onButtonPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
