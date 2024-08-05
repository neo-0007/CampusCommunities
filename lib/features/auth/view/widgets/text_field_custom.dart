import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  const TextFieldCustom(
      {super.key,
      required this.hintText,
      this.isPassword = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ReplyAppColors.darkGrey,
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ReplyAppColors.deactivatedText,
              width: 1,
            ),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.workSans(),
        ),
      ),
    );
  }
}
