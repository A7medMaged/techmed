import 'package:flutter/material.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_fonts.dart';
import 'package:techmed/core/styling/app_styles.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.mainFontName,
    textTheme: TextTheme(
      titleLarge: AppStyles.primaryHeadLinesStyle,
      titleMedium: AppStyles.subtitlesStyles,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.secondaryColor,
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: AppFonts.mainFontName,
    textTheme: TextTheme(
      titleLarge: AppStyles.primaryHeadLinesStyle.copyWith(
        color: Colors.white,
      ),
      titleMedium: AppStyles.subtitlesStyles.copyWith(
        color: Colors.white70,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.secondaryColor,
    ),
  );
}
