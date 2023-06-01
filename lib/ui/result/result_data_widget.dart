import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/theme/app_theme.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_maths_tricks/ui/quiz/content_widget.dart';
import 'package:flutter_maths_tricks/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../model/color_model.dart';
import '../../model/dummy_model.dart';
import '../../theme/color_scheme.dart';

class ResultDataWidget extends StatelessWidget {
  final ColorModel color;
  final DummyModel dummyModel;

  ResultDataWidget({required this.color, required this.dummyModel});

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 180.h;
    var circle = 105.h;
    var margin = horSpace;
    var radius = 32.r;
    var stepSize = 12.h;
    var iconSize = 42.h;
    var fontSize = 30.h;

    return Container(
      height: appBarHeight,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: (margin)),
      child: Stack(
        children: [
          SizedBox(
            height: appBarHeight,
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
              floatingActionButton: Container(
                  width: (circle),
                  height: (circle),
                  child:
                      // Obx((){
                      // return
                      Stack(
                    children: [
                      CircularStepProgressIndicator(
                        totalSteps: TOTAL_LEVEL_SIZE,
                        currentStep: dummyModel.levelNo,
                        stepSize: stepSize,
                        selectedColor: color.darkColor,
                        unselectedColor: progressColor,
                        padding: 0,
                        width: circle,
                        height: circle,
                        selectedStepSize: stepSize,
                        roundedCap: (__, _) => true,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            getCustomFont('${dummyModel.levelNo}/', 24,
                                getFontColor(context), 1,
                                fontWeight: FontWeight.w600),
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: getCustomFont('${TOTAL_LEVEL_SIZE}', 15,
                                  getFontColor(context), 1,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                  // ;
                  // }),
                  ),
              bottomNavigationBar: Container(
                height: (appBarHeight),
                decoration: getDefaultDecoration(
                    radius: radius, shadow: false, bgColor: Colors.transparent),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                  child: BottomAppBar(
                    color: getThemeColor(context, color.alphaColor),
                    elevation: 0,
                    shape: CircularNotchedRectangle(),
                    notchMargin: (10),
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 20.h),
                      margin: EdgeInsets.only(top: 66.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ContentWidget(
                              content: '${dummyModel.coin}',
                              icon: 'trophy.svg',
                              iconSize: iconSize,
                              textSize: fontSize),
                          ContentWidget(
                              content: '${dummyModel.right}',
                              icon: 'right.svg',
                              iconSize: iconSize,
                              textSize: fontSize),
                          ContentWidget(
                              content: '${dummyModel.wrong}',
                              icon: 'wrong.svg',
                              iconSize: iconSize,
                              textSize: fontSize),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
