import 'package:flutter/material.dart';
import 'package:theme/themes/coolors.theme.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      background: Coolors.backgroundLight,
    ),
     extensions: [
      CustomThemeExtension.lightMode,
    ],
  );
}
