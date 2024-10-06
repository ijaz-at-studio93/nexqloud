import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  AppBarTheme get appBarTheme => theme.appBarTheme;
  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;
  ElevatedButtonThemeData get elevatedButtonTheme => theme.elevatedButtonTheme;
}
