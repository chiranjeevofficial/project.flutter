import 'package:audioplayer/extensions/custom.theme.extension.dart';
import 'package:audioplayer/utils/coolors.util.dart';
import 'package:audioplayer/themes/text.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    extensions: [
      CustomThemeExtension.lightMode,
    ],
    colorScheme: base.colorScheme.copyWith(
      background: Coolors.backgroundLight,
    ),
    scaffoldBackgroundColor: Coolors.backgroundLight,
    appBarTheme: appBarTheme(base),
    textTheme: poppinsTextTheme(base.textTheme),
  );
}

AppBarTheme appBarTheme(ThemeData base) {
  return const AppBarTheme(
    backgroundColor: Coolors.backgroundLight,
    foregroundColor: Coolors.foregroundDark,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Coolors.backgroundLight,
      systemNavigationBarColor: Coolors.backgroundLight,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
