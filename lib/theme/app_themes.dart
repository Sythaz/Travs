import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryColor2,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor1,
      secondary: AppColors.secondaryColor1,
    ),
    iconTheme: IconThemeData(color: AppColors.iconColor),
    textTheme: TextTheme(
      displayLarge: AppTextStyleDark.mExtraBold64,
      headlineMedium: AppTextStyleDark.mExtraBold24,
      bodyMedium: AppTextStyleDark.rRegular14,
      titleMedium: AppTextStyleDark.rMedium16,
      labelMedium: AppTextStyleDark.rMedium14,
      bodySmall: AppTextStyleDark.rRegular10,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primaryColor1,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor2,
      secondary: AppColors.primaryColor2,
    ),
    iconTheme: IconThemeData(color: AppColors.iconColor),
    textTheme: TextTheme(
      displayLarge: AppTextStyleLight.mExtraBold64,
      headlineMedium: AppTextStyleLight.mExtraBold24,
      bodyMedium: AppTextStyleLight.rRegular14,
      titleMedium: AppTextStyleLight.rMedium16,
      labelMedium: AppTextStyleLight.rMedium14,
      bodySmall: AppTextStyleLight.rRegular10,
    ),
  );
}



class AppTextStyleLight {
  static TextStyle mExtraBold64 =
      AppFonts.montserratExtraBold64.copyWith(color: AppColors.whiteColor);
  static TextStyle mExtraBold24 =
      AppFonts.montserratExtraBold24.copyWith(color: AppColors.whiteColor);
  static TextStyle rBold24 =
      AppFonts.robotoBold24.copyWith(color: AppColors.primaryColor1);
  static TextStyle rMedium20 =
      AppFonts.robotoMedium20.copyWith(color: AppColors.primaryColor2);
  static TextStyle rMedium16 =
      AppFonts.robotoMedium16.copyWith(color: AppColors.primaryColor1);
  static TextStyle rRegular14 =
      AppFonts.robotoRegular14.copyWith(color: AppColors.lightGreyColor);
  static TextStyle rMedium14 =
      AppFonts.robotoMedium14.copyWith(color: AppColors.lightGreyColor);
  static TextStyle rRegular10 =
      AppFonts.robotoRegular10.copyWith(color: AppColors.primaryColor1);
}

class AppTextStyleDark {
  static TextStyle mExtraBold64 =
      AppFonts.montserratExtraBold64.copyWith(color: AppColors.whiteColor);
  static TextStyle mExtraBold24 =
      AppFonts.montserratExtraBold24.copyWith(color: AppColors.whiteColor);
  static TextStyle rBold24 =
      AppFonts.robotoBold24.copyWith(color: AppColors.primaryColor2);
  static TextStyle rMedium20 =
      AppFonts.robotoMedium20.copyWith(color: AppColors.primaryColor1);
  static TextStyle rMedium16 =
      AppFonts.robotoMedium16.copyWith(color: AppColors.primaryColor2);
  static TextStyle rRegular14 =
      AppFonts.robotoRegular14.copyWith(color: AppColors.lightGreyColor);
  static TextStyle rMedium14 =
      AppFonts.robotoMedium14.copyWith(color: AppColors.lightGreyColor);
  static TextStyle rRegular10 =
      AppFonts.robotoRegular10.copyWith(color: AppColors.primaryColor2);
}