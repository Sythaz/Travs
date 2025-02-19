import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryColor1,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor2,
      secondary: AppColors.secondaryColor2,
      surface: AppColors.primaryColor1,
      error: AppColors.primaryColor2,
    ),
    iconTheme: IconThemeData(color: AppColors.iconColor),
    textTheme: TextTheme(
      displayLarge: AppTextStyleDark.mExtraBold64,
      displayMedium: AppTextStyleDark.mExtraBold24,
      displaySmall: AppTextStyleDark.mBold18,
      headlineLarge: AppTextStyleDark.rBold24,
      titleLarge: AppTextStyleDark.rMedium20,
      titleMedium: AppTextStyleDark.rMedium16,
      labelLarge: AppTextStyleDark.rMedium14,
      bodyMedium: AppTextStyleDark.rRegular14,
      bodySmall: AppTextStyleDark.rRegular10,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primaryColor2,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor1,
      secondary: AppColors.secondaryColor1,
      surface: AppColors.primaryColor2,
      error: AppColors.primaryColor1,
    ),
    iconTheme: IconThemeData(color: AppColors.iconColor),
    textTheme: TextTheme(
      displayLarge: AppTextStyleLight.mExtraBold64,
      displayMedium: AppTextStyleLight.mExtraBold24,
      displaySmall: AppTextStyleLight.mBold18,
      headlineLarge: AppTextStyleLight.rBold24,
      titleLarge: AppTextStyleLight.rMedium20,
      titleMedium: AppTextStyleLight.rMedium16,
      labelLarge: AppTextStyleDark.rMedium14,
      bodyMedium: AppTextStyleLight.rRegular14,
      bodySmall: AppTextStyleLight.rRegular10,
    ),
  );
}

class AppTextStyleLight {
  static TextStyle mExtraBold64 =
      AppFonts.montserratExtraBold64.copyWith(color: AppColors.whiteColor);
  static TextStyle mExtraBold24 =
      AppFonts.montserratExtraBold24.copyWith(color: AppColors.whiteColor);
  static TextStyle mBold18 =
      AppFonts.montserratBold18.copyWith(color: AppColors.primaryColor1);
  static TextStyle rBold24 =
      AppFonts.robotoBold24.copyWith(color: AppColors.primaryColor1);
  static TextStyle rMedium20 =
      AppFonts.robotoMedium20.copyWith(color: AppColors.primaryColor2);
  static TextStyle rMedium16 = AppFonts.robotoMedium16;
  static TextStyle rMedium14 =
      AppFonts.robotoMedium14.copyWith(color: AppColors.primaryColor2);
  static TextStyle rRegular14 =
      AppFonts.robotoRegular14.copyWith(color: AppColors.lightGreyColor);
  static TextStyle rRegular10 =
      AppFonts.robotoRegular10.copyWith(color: AppColors.lightGreyColor);
}

class AppTextStyleDark {
  static TextStyle mExtraBold64 =
      AppFonts.montserratExtraBold64.copyWith(color: AppColors.whiteColor);
  static TextStyle mExtraBold24 =
      AppFonts.montserratExtraBold24.copyWith(color: AppColors.whiteColor);
  static TextStyle mBold18 =
      AppFonts.montserratBold18.copyWith(color: AppColors.primaryColor2);
  static TextStyle rBold24 =
      AppFonts.robotoBold24.copyWith(color: AppColors.primaryColor2);
  static TextStyle rMedium20 =
      AppFonts.robotoMedium20.copyWith(color: AppColors.primaryColor1);
  static TextStyle rMedium16 = AppFonts.robotoMedium16;
  static TextStyle rMedium14 =
      AppFonts.robotoMedium14.copyWith(color: AppColors.primaryColor1);
  static TextStyle rRegular14 =
      AppFonts.robotoRegular14.copyWith(color: AppColors.lightGreyColor);
  static TextStyle rRegular10 =
      AppFonts.robotoRegular10.copyWith(color: AppColors.lightGreyColor);
}
