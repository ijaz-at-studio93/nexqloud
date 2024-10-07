import 'package:flutter/material.dart';
import 'package:nexqloud/core/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: false,
      colorScheme: const ColorScheme.light(
        onSurface: kWhite,
      ),
    );
  }
}
