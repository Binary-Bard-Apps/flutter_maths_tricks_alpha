import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/color_model.dart';

class HeaderWidget extends StatelessWidget {
  final ColorModel tuple3;
  final Widget childWidget;
  final String icon;
  final Color? cardColor;
  final String tag;
  final double? horSpace;
  HeaderWidget(
      {required this.tuple3,
      required this.childWidget,
      required this.icon,
      required this.tag,
      this.cardColor,
      this.horSpace});
  @override
  Widget build(BuildContext context) {
    double height = double.infinity;
    double circle = 90.h;
    double radius = 35.r;
    return Container(
      height: height,
      padding:
          EdgeInsets.symmetric(horizontal: (horSpace == null) ? 0 : horSpace!),
      color: Colors.transparent,
      child: SizedBox(
        height: height,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          primary: false,
          appBar: AppBar(
            bottomOpacity: 0.0,
            title: const Text(''),
            toolbarHeight: 0,
            elevation: 0,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Hero(
            tag: tag,
            child: Container(
              width: (circle),
              height: (circle),
              child: Center(
                child: getSvgIcon(
                    icon: icon,
                    height: 30,
                    color: Colors.black,
                    isHomeIcon: true),
              ),
              decoration: BoxDecoration(
                  color: tuple3.mainColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.01),
                      blurRadius: 10,
                      offset: Offset(1, 0),
                    ),
                  ]),
            ),
          ),
          bottomNavigationBar: Container(
            height: height,
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: getShadowColor(context),
                  blurRadius: 20,
                  offset: Offset(1, 0),
                ),
              ],
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.only(
                  topLeft:
                      SmoothRadius(cornerRadius: radius, cornerSmoothing: 0.8),
                  topRight:
                      SmoothRadius(cornerRadius: radius, cornerSmoothing: 0.8),
                ),
              ),
            ),
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(radius),
                topLeft: Radius.circular(radius),
              ),
              child: Container(
                child: BottomAppBar(
                  color: cardColor == null ? getCardColor(context) : cardColor,
                  shape: CircularNotchedRectangle(),
                  notchMargin: 10.h,
                  child: Container(
                    height: double.infinity,
                    child: childWidget,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
