import 'package:flutter/material.dart';
import 'package:music_app/app/ui/theme/colors.dart';
import 'package:music_app/app/ui/theme/fonts.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => _theme(false);

  static ThemeData darkTheme() => _theme(true);

  static ThemeData _theme(bool isDarkMode) {
    return ThemeData(
      fontFamily: Fonts.Montserrat,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsBase.background,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white70,
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      canvasColor: Colors.black,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.dark,
        background: ColorsBase.background,
        primary: ColorsBase.primary,
        secondary: ColorsBase.accent,
        error: ColorsBase.error,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      navigationBarTheme: const NavigationBarThemeData(
        indicatorShape: BeveledRectangleBorder(side: BorderSide.none),
        indicatorColor: Colors.transparent,
      ),
    );
  }
}
