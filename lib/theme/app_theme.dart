import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color appBackgroundColor = "#FFFFFF".toColor();
Color cardColor = "#FFFFFF".toColor();
Color darkBackgroundColor = "#000000".toColor();
Color darkCardColor = "#353535".toColor();
Color color1 = "#B6AAFF".toColor();
Color color2 = "#FF6A9F".toColor();
Color color3 = "#81BCF0".toColor();
Color color4 = "#F5BEA6".toColor();
Color color5 = "#FCCA49".toColor();
Color color6 = "#88C734".toColor();
// Color color6 = "#ADD37A".toColor();
Color color7 = "#8EDCE9".toColor();
Color color8 = "#DB89DD".toColor();
Color color9 = "#6FC993".toColor();

Color primaryColor = "#7F6AFF".toColor();
Color progressColor = "#F4F4F4".toColor();
Color redAlphaColor = "#FFE9E9".toColor();
Color greenAlphaColor = "#E9FDE4".toColor();

class AppTheme {
  static ThemeData get theme {
    ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: appBackgroundColor,
      cardColor: cardColor,
      brightness: Brightness.light,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      colorScheme: ColorScheme(
          background: appBackgroundColor,
          brightness: Brightness.light,
          onBackground: appBackgroundColor,
          onPrimary: primaryColor,
          onSecondary: primaryColor,
          onSurface: appBackgroundColor,
          primary: primaryColor,
          secondary: primaryColor,
          surface: appBackgroundColor,
          error: Colors.red,
          onError: Colors.red),
    );
  }

  static ThemeData get darkTheme {
    ThemeData base = ThemeData.dark();

    return base.copyWith(
      primaryColor: primaryColor,
      // primaryColor: darkBackgroundColor,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: darkBackgroundColor,
      cardColor: darkCardColor,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      colorScheme: ColorScheme(
          background: darkBackgroundColor,
          brightness: Brightness.dark,
          onBackground: darkBackgroundColor,
          onPrimary: primaryColor,
          onSecondary: primaryColor,
          onSurface: darkBackgroundColor,
          primary: primaryColor,
          secondary: primaryColor,
          surface: darkBackgroundColor,
          error: Colors.red,
          onError: Colors.red),
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
