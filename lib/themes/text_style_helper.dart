import 'package:flutter/material.dart';

class TextStyleHelper {
  // Helper untuk mengambil TextStyle berdasarkan tema aktif
  static TextStyle? getTextStyle(BuildContext context, String styleKey) {
    TextTheme textTheme = Theme.of(context).textTheme;

    switch (styleKey) {
      case 'mExtraBold64':
        return textTheme.displayLarge;
      case 'mExtraBold24':
        return textTheme.displayMedium;
      case 'mBold18':
        return textTheme.displaySmall;
      case 'rBold24':
        return textTheme.headlineLarge;
      case 'rMedium20':
        return textTheme.titleLarge;
      case 'rMedium16Location':
        return textTheme.titleMedium;
      case 'rMedium16Name':
        return textTheme.titleSmall;
      case 'rMedium16':
        return textTheme.bodyLarge;
      case 'rRegular14':
        return textTheme.bodyMedium;
      case 'rRegular10':
        return textTheme.bodySmall;
      case 'rMedium14Category':
        return textTheme.labelLarge;
      case 'rMedium14CategoryNonActive':
        return textTheme.labelMedium;
      case 'rMedium14Sort':
        return textTheme.labelSmall;
    }
    return null;
  }
}
