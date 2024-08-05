import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class Utils {
  static void showSnackbar(BuildContext context, String message,
      {Color backgroundColor = Colors.black}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: GoogleFonts.roboto(color: ReplyAppColors.nearlyWhite),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> showAlert(
      BuildContext context, String title, String bodyText) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(bodyText),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
