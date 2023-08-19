import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart' as html;
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

String fontFamily = "SFPRO";
String assetPath = "assets/images/";
String assetHomeIcons = "assets/homeIcons/";
String assetTrickImages = "assets/trickImages/";
int TOTAL_LEVEL_SIZE = 30;
int DEFAULT_QUESTION = 10;
int HINT_COIN = 10;

String parseHtmlString(String htmlString) {
  final document = html.parse(htmlString);
  final String parsedString =
      html.parse(document.body).documentElement.toString();

  return parsedString;
}

launchURL() async {
  if (!await launchUrl(Uri.parse(
      'https://doc-hosting.flycricket.io/math-ticks-app-privacy-policy/72d6c77e-0e66-4ad0-875c-977c06fe7db4/privacy'))) {
    throw 'Could not launch ';
  }
}

developerLaunchURL() async {
  if (!await launchUrl(Uri.parse('https://ankit-kumar-weblink.web.app/#/'))) {
    throw 'Could not launch ';
  }
}

share() async {
  await FlutterShare.share(
      title: 'Math Trick',
      text: 'Share',
      linkUrl: getAppLink(),
      chooserTitle: '');
}

String getAppLink() {
  String pkgName = "com.ankitkumar.maths_tricks_alpha";
  String appStoreIdentifier = "1491556149";
  if (Platform.isAndroid) {
    return "https://play.google.com/store/apps/details?id=$pkgName";
  } else if (Platform.isIOS) {
    return "https://apps.apple.com/us/app/apple-store/id$appStoreIdentifier";
  }
  return "";
}

String decode(String codeUnits) {
  var unescape = HtmlUnescape();
  String singleConvert = unescape.convert(codeUnits);
  codeUnits = unescape.convert(singleConvert);

  unescape = HtmlUnescape();
  singleConvert = unescape.convert(codeUnits);
  codeUnits = unescape.convert(singleConvert);
  return unescape.convert(codeUnits);
}

String secToTime(int sec) {
  if (sec == 0) {
    return "00:00";
  }
  int second = sec % 60;
  double minute = sec / 60;
  if (minute >= 60) {
    double hour = minute / 60;
    minute %= 60;

    return hour.toInt().toString() +
        ":" +
        (minute < 10
            ? minute == 0
                ? "00"
                : "0" + minute.toInt().toString()
            : minute.toInt().toString()) +
        ":" +
        (second < 10
            ? "00" + second.toInt().toString()
            : second.toInt().toString());
  }
  return (minute < 10
          ? minute == 0
              ? "00"
              : "0" + minute.toInt().toString()
          : minute.toInt().toString()) +
      ":" +
      (second < 10
          ? minute == 0
              ? "00"
              : "0" + second.toInt().toString()
          : second.toInt().toString());
}

showToast(String s, BuildContext context) {
  Fluttertoast.showToast(
      msg: s,
      backgroundColor: getBackgroundColor(context),
      textColor: getFontColor(context),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 20.sp);
}
