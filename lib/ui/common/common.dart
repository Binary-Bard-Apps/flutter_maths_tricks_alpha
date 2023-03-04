import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maths_tricks/app/key_util.dart';
import 'package:flutter_maths_tricks/main.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/app_theme.dart';
import '../../theme/color_scheme.dart';
import '../../theme/svg_modify.dart';
import '../../utils/util.dart';

getNoneAppBar(
  BuildContext context, {
  Color? color,
}) {
  if (color == null) {
    color = getBackgroundColor(context);
  }
  var overlayStyle = SystemUiOverlayStyle.light; // 1

  // if (overlayStyle == SystemUiOverlayStyle.light) {
  //   overlayStyle = SystemUiOverlayStyle.dark;
  // } else {
  //   overlayStyle = SystemUiOverlayStyle.light;
  // }

  if (color == getBackgroundColor(context)) {
    if (themeController.isDarkTheme) {
      overlayStyle = SystemUiOverlayStyle.light;
    } else {
      overlayStyle = SystemUiOverlayStyle.dark;
    }
  }

  if (color == getAlphaPrimaryColor(context) && themeController.isDarkTheme) {
    color = getPrimaryColor(context);
  }

  return AppBar(
    toolbarHeight: 0,
    elevation: 0,
    primary: false,
    backgroundColor: color,
    systemOverlayStyle: overlayStyle.copyWith(
      statusBarColor: color,
    ),
  );
}

double horSpace = 15.w;

Widget getCommonAppBar(
    {required BuildContext context,
    required String title,
    required Function function,
    required Color color,
    bool? isSetting}) {
  return Container(
    height: 75.h,
    margin: EdgeInsets.symmetric(horizontal: horSpace),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        getBackIcon(
            function: () {
              function();
            },
            color: color),
        15.horizontalSpace,
        Expanded(
          child: getCustomFont(title, 18, getFontColor(context), 1,
              fontWeight: FontWeight.w700),
          flex: 1,
        ),
        isSetting == null ? getSettingIcon(context, color: color) : Container(),
      ],
    ),
  );
}

Widget getCommonAppBar1(
    {required BuildContext context,
    required String title,
    required Function function,
    required Color color,
    bool? isSetting}) {
  return Container(
    height: 75.h,
    margin: EdgeInsets.symmetric(horizontal: horSpace),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        getBackIcon(
            function: () {
              function();
            },
            color: color,
            isWhite: true),
        15.horizontalSpace,
        Expanded(
          child: getCustomFont(title, 18, Colors.black, 1,
              fontWeight: FontWeight.w700),
          flex: 1,
        ),
        isSetting == null
            ? getSettingIcon(context, color: color, isWhite: true)
            : Container(),
      ],
    ),
  );
}

Widget getCommonHeader(BuildContext context, {required Widget widget}) {
  return Container(
    decoration: themeController.isDarkTheme
        ? getDefaultDecorationWithSide(
            radius: 40.r,
            bgColor: getPrimaryColor(context),
            isBottomLeft: true,
            isBottomRight: true)
        : getGradientDecorationWithSide(
            radius: 40.r,
            color: getPrimaryColor(context),
            isBottomLeft: true,
            isBottomRight: true,
            context: context),
    height: 320.h,
    padding: EdgeInsets.symmetric(horizontal: horSpace),
    child: Align(
      child: Container(
        child: widget,
        margin: EdgeInsets.only(top: 30.h),
      ),
      alignment: Alignment.topLeft,
    ),
  );
}

getGradientDecorationWithSide(
    {double? radius,
    bool? isShadow,
    bool? isTopRight,
    bool? isTopLeft,
    bool? isBottomRight,
    bool? isBottomLeft,
    required Color color,
    bool? isPrimary,
    required BuildContext context}) {
  return ShapeDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [getAlphaPrimaryColor(context), color]),
    shape: SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius.only(
        bottomRight: SmoothRadius(
          cornerRadius: (isBottomRight == null) ? 0 : radius!,
          cornerSmoothing: 1,
        ),
        bottomLeft: SmoothRadius(
          cornerRadius: (isBottomLeft == null) ? 0 : radius!,
          cornerSmoothing: 1,
        ),
        topLeft: SmoothRadius(
          cornerRadius: (isTopLeft == null) ? 0 : radius!,
          cornerSmoothing: 1,
        ),
        topRight: SmoothRadius(
          cornerRadius: (isTopRight == null) ? 0 : radius!,
          cornerSmoothing: 1,
        ),
      ),
    ),
  );
}

getDefaultDecorationWithSide(
    {double? radius,
    Color? bgColor,
    Color? borderColor,
    bool? isShadow,
    Color? shadowColor,
    bool? isTopRight,
    bool? isTopLeft,
    bool? isBottomRight,
    bool? isBottomLeft}) {
  return ShapeDecoration(
    shadows: isShadow == null
        ? []
        : [
            BoxShadow(
                color: shadowColor == null ? Colors.grey.shade200 : shadowColor,
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 3))
          ],
    color: bgColor == null ? Colors.transparent : bgColor,
    shape: SmoothRectangleBorder(
      side: BorderSide(
          color: (borderColor == null) ? Colors.transparent : borderColor,
          width: (borderColor == null) ? 0 : 1),
      borderRadius: SmoothBorderRadius.only(
        bottomRight: SmoothRadius(
          cornerRadius: (isBottomRight == null) ? 0 : radius!,
          cornerSmoothing: 1,
        ),
        bottomLeft: SmoothRadius(
          cornerRadius: (isBottomLeft == null) ? 0 : radius!,
          cornerSmoothing: 1,
        ),
        topLeft: SmoothRadius(
          cornerRadius: (isTopLeft == null) ? 0 : radius!,
          cornerSmoothing: 1,
        ),
        topRight: SmoothRadius(
          cornerRadius: (isTopRight == null) ? 0 : radius!,
          cornerSmoothing: 1,
        ),
      ),
    ),
  );
}

setScreenSize(
  BuildContext context,
) {
  ScreenUtil.init(context, designSize: Size(414, 1106));
}

getHeaderTitle(String s, BuildContext context) {
  return getCustomFont(s, 22, Colors.white, 1, fontWeight: FontWeight.w700);
}

getSettingIcon(BuildContext context, {Color? color, bool? isWhite}) {
  return GestureDetector(
    onTap: () {
      // themeController.changeTheme();

      Get.toNamed(KeyUtil.settingPage);
    },
    child: SvgPicture.string(
      SvgModify.settingSvg((color == null) ? Colors.white : color,
          isWhite: isWhite),
      height: 30,
    ),
  );
}

getBackIcon({required Function function, Color? color, bool? isWhite}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: SvgPicture.string(
      SvgModify.backSvg((color == null) ? Colors.white : color,
          isWhite: isWhite),
      height: 30,
    ),
  );
}

getCloseIcon({required Function function, Color? color}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: SvgPicture.string(
      SvgModify.closeSvg((color == null) ? Colors.white : color, isWhite: true),
      height: 30,
    ),
  );
}

getSvgIcon(
    {required String icon,
    bool? isHomeIcon,
    required double height,
    double? width,
    Color? color,
    Function? function}) {
  return GestureDetector(
    child: SvgPicture.asset(
      isHomeIcon == null ? '${assetPath}$icon' : '${assetHomeIcons}$icon',
      height: height.h,
      width: width == null ? null : width.w,
      color: color == null ? null : color,
    ),
    onTap: () {
      if (function != null) {
        function();
      }
    },
  );
}

getTrueFalseButton(
    {required String icon,
    bool? isHomeIcon,
    required double height,
    double? width,
    Color? color,
    Function? function}) {
  return GestureDetector(
    child: Container(
      height: height,
      // margin: EdgeInsets.only(top: 140.h),
      decoration: getDefaultDecoration(bgColor: color, radius: 20.r),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        isHomeIcon == null ? '${assetPath}$icon' : '${assetHomeIcons}$icon',
        height: height.h,
        width: width == null ? null : width.w,
        color: color == null ? null : color,
      ),
    ),
    onTap: () {
      if (function != null) {
        function();
      }
    },
  );
}

getDivider({double? height}) {
  return Container(
      height: height == null ? 0.8 : height,
      color: themeController.isDarkTheme
          ? "#686767".toColor()
          : "#F4F4F4".toColor()
      // color: color == null ? "#F4F4F4".toColor() : color,
      );
}

getBackSvgFromString(
    {required double height,
    double? width,
    required Color color,
    Function? function}) {
  return GestureDetector(
    child: SvgPicture.string(
      SvgModify.backSvg(
        color,
      ),
      height: height.h,
      width: width == null ? null : width.w,
    ),
    onTap: () {
      if (function != null) {
        function();
      }
    },
  );
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    String? font,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize.sp,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: font == null ? fontFamily : font,
        fontWeight: fontWeight),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}

Widget getSvgImageWithSize(
    BuildContext context, String image, double width, double height,
    {Color? color, BoxFit fit = BoxFit.fill}) {
  return SvgPicture.asset(
    assetPath + image,
    color: color,
    width: width,
    height: height,
    fit: fit,
  );
}

Widget getTextWidget(String text, double fontSize, Color fontColor,
    {TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    String? font,
    txtHeight}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize.sp,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: font == null ? fontFamily : font,
        fontWeight: fontWeight),
    softWrap: true,
    textAlign: textAlign,
  );
}

Color lighten(Color color, [double amount = 0.04]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

// Color darken(Color color, [double amount = .1]) {
//   assert(amount >= 0 && amount <= 1);
//
//   final hsl = HSLColor.fromColor(color);
//   final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
//
//   return hslDark.toColor();
// }

getDefaultDecoration(
    {double? radius,
    Color? bgColor,
    Color? borderColor,
    bool? isShadow,
    Color? shadowColor,
    double? borderWidth,
    var shadow,
    var shape}) {
  return ShapeDecoration(
    color: (bgColor == null) ? Colors.transparent : bgColor,
    shadows: isShadow == null
        ? []
        : [
            shadow == null
                ? BoxShadow(
                    color: shadowColor == null
                        ? Colors.grey.shade200
                        : shadowColor,
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 3))
                : shadow
          ],
    shape: SmoothRectangleBorder(
      side: BorderSide(
          color: (borderColor == null) ? Colors.transparent : borderColor,
          width: (borderWidth == null) ? 1 : borderWidth),
      borderRadius: SmoothBorderRadius(
        cornerRadius: (radius == null) ? 0 : radius,
        cornerSmoothing: 0.8,
      ),
    ),
  );
}

getGradientDecoration({
  double? radius,
  required List<Color> color,
}) {
  return ShapeDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: color,
    ),
    // gradient: LinearGradient(begin: Alignment.topCenter,
    //   end: Alignment.bottomCenter, colors: ["#F6F4FF".toColor(),"#A596FF".toColor()], ),
    // end: Alignment.bottomCenter, colors: [color.item1, color.item2], ),

    shape: SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius(
        cornerRadius: (radius == null) ? 0 : radius,
        cornerSmoothing: 0.8,
      ),
    ),
  );
}

getProgressDialog(BuildContext context) {
  return new Container(
      decoration: BoxDecoration(
        color: getBackgroundColor(context),
      ),
      child: new Center(
          child: CupertinoActivityIndicator(
        color: getFontColor(context),
      )));
}

getCommonButton({
  required String title,
  required Function function,
  Color? color,
  double? btnHeight,
  double? verSpace,
  double? hSpace,
  Widget? widget,
}) {
  return InkWell(
    child: Container(
      width: double.infinity,
      height: btnHeight == null ? 73.h : btnHeight,
      margin: EdgeInsets.symmetric(
          horizontal: hSpace == null ? horSpace : hSpace,
          vertical: verSpace == null ? 20.h : verSpace.h),
      decoration: getDefaultDecoration(
          radius: 15.r, bgColor: color == null ? primaryColor : color),
      child: widget == null
          ? Center(
              child: getCustomFont(title, 16, Colors.white, 1,
                  fontWeight: FontWeight.w500),
            )
          : widget,
    ),
    onTap: () {
      function();
    },
  );
}

getCommonHintButton({
  required String title,
  required Function function,
  Color? color,
  double? verSpace,
  double? hSpace,
}) {
  return InkWell(
    child: ClipRRect(
      child: Container(
        width: double.infinity,
        height: 73.h,
        margin: EdgeInsets.symmetric(
            horizontal: hSpace == null ? horSpace : hSpace,
            vertical: verSpace == null ? 20.h : verSpace.h),
        decoration: getDefaultDecoration(
            radius: 15.r, bgColor: color == null ? primaryColor : color),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                child: getCustomFont('Use 10 Coin', 12, Colors.black, 1,
                    fontWeight: FontWeight.w500),
              ),
              Center(
                child: getCustomFont(title, 16, Colors.white, 1,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    ),
    onTap: () {
      function();
    },
  );
}

getCommonBorderButton({
  required String title,
  required Function function,
  required Color color,
  double? verSpace,
  double? btnHeight,
  double? hSpace,
}) {
  return InkWell(
    child: Container(
      width: double.infinity,
      height: btnHeight == null ? 73.h : btnHeight,
      margin: EdgeInsets.symmetric(
          horizontal: hSpace == null ? horSpace : hSpace,
          vertical: verSpace == null ? 20.h : verSpace.h),
      decoration: getDefaultDecoration(
          radius: 15.r, borderColor: color, borderWidth: 1),
      child: Center(
        child: getCustomFont(title, 16, color, 1, fontWeight: FontWeight.w500),
      ),
    ),
    onTap: () {
      function();
    },
  );
}

showCommonDialog(
    {required Widget widget,
    required BuildContext context,
    Function? function}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return widget;
    },
  ).then((value) {
    if (function != null) {
      function(value);
    }
  });
}

showCommonBottomSheetDialog(
    {required Widget widget,
    required BuildContext context,
    required Function function}) {
  showModalBottomSheet(
    context: context,
    builder: (context) => widget,
    backgroundColor: getBackgroundColor(context),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(42.h), topRight: Radius.circular(42.h)),
    ),
    isDismissible: false,
    enableDrag: false,
    isScrollControlled: true,
  ).then((value) {
    function(value);
  });
}

commonTextFiled(TextEditingController textEditingController,
    BuildContext context, Function function) {
  var border = UnderlineInputBorder(
      borderSide: BorderSide(color: getFontColor(context), width: 0.2));
  return Container(
    child: AutoSizeTextField(
      // minFontSize: 16,
      controller: textEditingController,
      autofocus: true,
      enabled: false,
      maxLines: 1,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^(\d{0,8})?\.?\d{0,3}'))
      ],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 13.h),
        border: border,
        disabledBorder: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
      cursorColor: getPrimaryColor(context),
      fullwidth: false,
      minWidth: 15.w,
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: getFontColor(context),
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget getDefaultTextFiled(
    BuildContext context,
    String s,
    TextEditingController textEditingController,
    Color fontColor,
    Color selectedTheme,
    {bool withPrefix = false,
    String imgName = "",
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    TextInputType type = TextInputType.text}) {
  double height = 90.h;
  FocusNode myFocusNode = FocusNode();
  bool isAutoFocus = false;
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew = mqData.copyWith();
      return MediaQuery(
        data: mqDataNew,
        child: Container(
          height: (minLines) ? (height * 2.2) : height,
          margin: margin,
          padding: EdgeInsets.symmetric(horizontal: horSpace, vertical: 0),
          alignment: (minLines) ? Alignment.topLeft : Alignment.centerLeft,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: SmoothRectangleBorder(
              side: BorderSide(
                  color: isAutoFocus ? selectedTheme : Colors.grey.shade400,
                  width: 1),
              borderRadius: SmoothBorderRadius(
                cornerRadius: 20.r,
                cornerSmoothing: 0.8,
              ),
            ),
          ),
          child: Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  setState(() {
                    isAutoFocus = true;
                    myFocusNode.canRequestFocus = true;
                  });
                } else {
                  setState(() {
                    isAutoFocus = false;
                    myFocusNode.canRequestFocus = false;
                  });
                }
              },
              child: SizedBox(
                height: double.infinity,
                child: (minLines)
                    ? TextField(
                        maxLines: (minLines) ? null : 1,
                        controller: textEditingController,
                        autofocus: false,
                        focusNode: myFocusNode,
                        textAlign: TextAlign.start,
                        keyboardType: type,
                        expands: minLines,
                        style: TextStyle(
                            fontFamily: fontFamily,
                            color: fontColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp),
                        decoration: InputDecoration(
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: s,
                            hintStyle: TextStyle(
                                fontFamily: fontFamily,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp)),
                      )
                    : Center(
                        child: TextField(
                        maxLines: (minLines) ? null : 1,
                        keyboardType: type,
                        controller: textEditingController,
                        autofocus: false,
                        focusNode: myFocusNode,
                        textAlign: TextAlign.start,
                        expands: minLines,
                        style: TextStyle(
                            fontFamily: fontFamily,
                            color: fontColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp),
                        decoration: InputDecoration(
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: s,
                            hintStyle: TextStyle(
                                fontFamily: fontFamily,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp)),
                      )),
              )),
        ),
      );
    },
  );
}
