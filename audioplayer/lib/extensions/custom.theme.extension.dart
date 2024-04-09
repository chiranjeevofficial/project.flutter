import 'package:audioplayer/utils/coolors.util.dart';
import 'package:flutter/material.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  static const lightMode = CustomThemeExtension(
    foregroundText: Coolors.centeredTitleDark,
    indicatorColor: Coolors.indicatorColorDark,
    labelColor: Coolors.labelColorDark,
  );

  static const darkMode = CustomThemeExtension(
    foregroundText: Coolors.centeredTitleLight,
    indicatorColor: Coolors.indicatorColorLight,
    labelColor: Coolors.labelColorLight,
  );

  final Color? foregroundText;
  final Color? indicatorColor;
  final Color? labelColor;

  const CustomThemeExtension({
    this.foregroundText,
    this.indicatorColor,
    this.labelColor,
  });

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? generalText,
    Color? indicatorColor,
    Color? labelColor,
  }) {
    return CustomThemeExtension(
      foregroundText: generalText ?? this.foregroundText,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      labelColor: indicatorColor ?? this.indicatorColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      foregroundText: Color.lerp(foregroundText, other.foregroundText, t),
      indicatorColor: Color.lerp(indicatorColor, other.indicatorColor, t),
      labelColor: Color.lerp(labelColor, other.labelColor, t),
    );
  }
}
