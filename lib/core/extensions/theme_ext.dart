import 'package:flutter/material.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/constants.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  AppBarTheme get appBarTheme => theme.appBarTheme;
  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;
  ElevatedButtonThemeData get elevatedButtonTheme => theme.elevatedButtonTheme;

  TextStyle? get light => textTheme.headlineSmall?.copyWith(
        fontSize: 14,
        fontFamily: kFontFamily,
        color: kWhite,
        fontWeight: FontWeight.w300,
      );

  TextStyle? get normal => textTheme.headlineSmall?.copyWith(
        fontSize: 14,
        fontFamily: kFontFamily,
        color: kWhite,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get bold => textTheme.headlineSmall?.copyWith(
        fontSize: 14,
        fontFamily: kFontFamily,
        color: kWhite,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get semiBold => textTheme.headlineSmall?.copyWith(
        fontSize: 14,
        fontFamily: kFontFamily,
        color: kWhite,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get medium => textTheme.headlineSmall?.copyWith(
        fontSize: 14,
        fontFamily: kFontFamily,
        color: kWhite,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get black => textTheme.headlineSmall?.copyWith(
        fontSize: 14,
        fontFamily: kFontFamily,
        color: kWhite,
        fontWeight: FontWeight.w900,
      );
}
