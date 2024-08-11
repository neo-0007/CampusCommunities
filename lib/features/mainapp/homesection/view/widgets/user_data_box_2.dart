import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class UserDataBox2 extends StatelessWidget {
  final String department;
  final String semester;
  const UserDataBox2({super.key, required this.department, required this.semester});

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
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Department',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    department,
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenSize.width / 12,
            ),
            const VerticalDivider(
              color: ReplyAppColors.grey,
            ),
            SizedBox(
              width: screenSize.width / 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Semester',
                    style: GoogleFonts.roboto(fontWeight: FontWeight.normal),
                  ),
                ),
                Expanded(
                  child: Text(
                    semester,
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
