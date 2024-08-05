//Theming to be done

import 'package:flutter/material.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class AppTheme {
  static _border([Color color = ReplyAppColors.darkGrey]) => OutlineInputBorder(
        borderSide: const BorderSide(
          color: ReplyAppColors.darkGrey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ReplyAppColors.notWhite,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      focusedBorder: _border(),
      enabledBorder: _border(ReplyAppColors.deactivatedText),
    ),
  );
}
