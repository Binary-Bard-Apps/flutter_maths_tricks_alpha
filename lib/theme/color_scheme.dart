import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/main.dart';
import 'package:flutter_maths_tricks/model/color_model.dart';

import 'app_theme.dart';

extension CustomColorScheme on ColorScheme {
  Color get backgroundColor =>
      brightness == Brightness.light ? appBackgroundColor : darkBackgroundColor;

  Color get fontColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;

  Color get cardBgColor =>
      brightness == Brightness.light ? cardColor : darkCardColor;

  Color get dialogBgColor =>
      brightness == Brightness.light ? cardColor : darkCardColor;

  Color get shadowColor => brightness == Brightness.light
      ? Colors.black12.withOpacity(0.1)
      : Colors.transparent;
}

Color getPrimaryColor(BuildContext context) {
  return Theme.of(context).primaryColor;
}

Color getAlphaPrimaryColor(BuildContext context) {
  return themeController.themeMode == ThemeMode.dark
      ? Theme.of(context).primaryColor
      : "#A596FF".toColor();
}

Color getShadowColor(BuildContext context) {
  return Theme.of(context).colorScheme.shadowColor;
}

Color getFontColor(BuildContext context) {
  return Theme.of(context).colorScheme.fontColor;
}

Color getThemeColor(BuildContext context, Color color) {
  return themeController.isDarkTheme ? getCardColor(context) : color;
}

getBackgroundColor(BuildContext context) {
  return Theme.of(context).colorScheme.backgroundColor;
}

getCardColor(BuildContext context) {
  return Theme.of(context).colorScheme.cardBgColor;
}

getDialogBgColor(BuildContext context) {
  return Theme.of(context).colorScheme.dialogBgColor;
}

ColorModel getRandomColor(int index) {
  // ColorModel colorTuple;

  ColorModel colorModel = new ColorModel();

  if (index % 9 == 0) {
    colorModel.mainColor = color1;
    colorModel.darkColor = Color(0xff7f6aff);
    colorModel.alphaColor = "#F6F4FF".toColor();
    colorModel.colorList = [Color(0xffa495ff), Color(0xff7f6aff)];

    // colorTuple=Tuple3(color1, "#886AFF".toColor(), "#F6F4FF".toColor());
  } else if (index % 9 == 1) {
    colorModel.mainColor = color2;
    colorModel.darkColor = Color(0xffff6a9f);
    colorModel.alphaColor = "#FFF0F5".toColor();
    colorModel.colorList = [Color(0xffff81b6), Color(0xffff6a9f)];

    // colorTuple=Tuple3(color2, "#FF6AA0".toColor(), "#FFF0F5".toColor());
  } else if (index % 9 == 2) {
    colorModel.mainColor = color3;
    colorModel.darkColor = Color(0xff579afd);
    colorModel.alphaColor = "#EAF5FF".toColor();
    colorModel.colorList = [Color(0xff8ec2ff), Color(0xff579afd)];

    // colorTuple=Tuple3(color3, "#589AFE".toColor(), "#EAF5FF".toColor());
  } else if (index % 9 == 3) {
    colorModel.mainColor = color4;
    colorModel.darkColor = Color(0xfffca57f);
    colorModel.alphaColor = "#FFEDE5".toColor();
    colorModel.colorList = [Color(0xffffe2d5), Color(0xfffca57f)];

    // colorTuple=Tuple3(color4, "#F9814D".toColor(), "#FFEDE5".toColor());
  } else if (index % 9 == 4) {
    colorModel.mainColor = color5;
    colorModel.darkColor = Color(0xfffcca49);
    colorModel.alphaColor = "#FFF8E5".toColor();
    colorModel.colorList = [Color(0xffffe7a9), Color(0xfffcca49)];

    // colorTuple=Tuple3(color5, "#F9814D".toColor(), "#F1C03F".toColor());
  } else if (index % 9 == 5) {
    colorModel.mainColor = color6;
    colorModel.darkColor = Color(0xff88c734);
    colorModel.alphaColor = "#F1FEDF".toColor();
    colorModel.colorList = [Color(0xffe3ffc0), Color(0xff88c734)];

    // colorTuple=Tuple3(color6, "#8ABD45".toColor(), "#F1FEDF".toColor());
  } else if (index % 9 == 6) {
    colorModel.mainColor = color7;
    colorModel.darkColor = Color(0xff00c5e5);
    colorModel.alphaColor = "#E4FBFF".toColor();
    colorModel.colorList = [Color(0xff94dfff), Color(0xff00c5e5)];

    // colorTuple=Tuple3(color7, "#00C5E5".toColor(), "#E4FBFF".toColor());
  } else if (index % 9 == 7) {
    colorModel.mainColor = color8;
    colorModel.darkColor = Color(0xffdb89dd);
    colorModel.alphaColor = "#FFF2FF".toColor();
    colorModel.colorList = [Color(0xffedb8ef), Color(0xffdb89dd)];

    // colorTuple=Tuple3(color8, "#E864EB".toColor(), "#FFF2FF".toColor());
  } else {
    colorModel.mainColor = color1;
    colorModel.darkColor = Color(0xff7f6aff);
    colorModel.alphaColor = "#F6F4FF".toColor();
    colorModel.colorList = [Color(0xffa495ff), Color(0xff7f6aff)];

    // colorTuple=Tuple3(color1, "#886AFF".toColor(), "#F6F4FF".toColor());
  }

  return colorModel;
}
