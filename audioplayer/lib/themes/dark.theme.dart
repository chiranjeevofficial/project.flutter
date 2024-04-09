import 'package:audioplayer/extensions/custom.theme.extension.dart';
import 'package:audioplayer/utils/coolors.util.dart';
import 'package:audioplayer/themes/text.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    extensions: [
      CustomThemeExtension.darkMode,
    ],
    colorScheme: base.colorScheme.copyWith(
      background: Coolors.backgroundDark,
    ),
    scaffoldBackgroundColor: Coolors.backgroundDark,
    appBarTheme: appBarTheme(base),
    textTheme: poppinsTextTheme(base.textTheme),
  );
}

AppBarTheme appBarTheme(ThemeData base) {
  return const AppBarTheme(
    backgroundColor: Coolors.backgroundDark,
    foregroundColor: Coolors.foregroundLight,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Coolors.backgroundDark,
      systemNavigationBarColor: Coolors.backgroundDark,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}
