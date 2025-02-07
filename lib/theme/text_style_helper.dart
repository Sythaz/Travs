import 'package:flutter/material.dart';

class TextStyleHelper {
  // Helper untuk mengambil TextStyle berdasarkan tema aktif
  static TextStyle? getTextStyle(BuildContext context, String styleKey) {
    TextTheme textTheme = Theme.of(context).textTheme;

    switch (styleKey) {
      case 'mExtraBold64':
        return textTheme.displayLarge;
      case 'mExtraBold24':
        return textTheme.headlineMedium;
      case 'rRegular14':
        return textTheme.bodyMedium;
      case 'rMedium16':
        return textTheme.titleMedium;
      case 'rMedium14':
        return textTheme.labelMedium;
      case 'rRegular10':
        return textTheme.bodySmall;
    }
    return null;
  }
}
