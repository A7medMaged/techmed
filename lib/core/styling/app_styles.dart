import 'package:flutter/material.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_fonts.dart';


class AppStyles {
  static TextStyle primaryHeadLinesStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle subtitlesStyles = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor,
  );

  static TextStyle black16w500Style = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static TextStyle grey12MediumStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
  );

  static TextStyle black15BoldStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle black18BoldStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle green12MediumStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.green,
  );
}
