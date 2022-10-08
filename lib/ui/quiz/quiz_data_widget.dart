import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/provider/quiz_provider.dart';
import 'package:flutter_maths_tricks/theme/app_theme.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_maths_tricks/ui/quiz/content_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../model/color_model.dart';
import '../../theme/color_scheme.dart';

class QuizDataWidget extends StatelessWidget {
  final ColorModel color;

  final QuizProvider quizProvider;

  QuizDataWidget({required this.color, required this.quizProvider});

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 250.h;
    var circle = 115.h;
    var margin = horSpace;
    var radius = 32.r;
    var stepSize = 12.h;

    return Obx(() {
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
                          totalSteps: quizProvider.totalTime,
                          currentStep: quizProvider.currentTime.value,
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
                          child: getCustomFont(
                              '${quizProvider.currentTime.value}',
                              22,
                              getFontColor(context),
                              1,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                    // ;
                    // }),
                    ),
                bottomNavigationBar: Container(
                  height: (appBarHeight),
                  decoration: getDefaultDecoration(
                      radius: radius,
                      shadow: false,
                      bgColor: Colors.transparent),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 20.h),
                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(() {
                                        return getCustomFont(
                                            'Level-${quizProvider.levelNo.value}',
                                            15,
                                            getFontColor(context),
                                            1,
                                            fontWeight: FontWeight.w600);
                                      }),
                                      15.verticalSpace,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          getCustomFont(
                                              '${quizProvider.position + 1}/',
                                              24,
                                              getFontColor(context),
                                              1,
                                              fontWeight: FontWeight.w600),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 2.h),
                                            child: getCustomFont(
                                                '${quizProvider.list.length}',
                                                15,
                                                getFontColor(context),
                                                1,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ContentWidget(
                                          content: '${quizProvider.coin}',
                                          icon: 'trophy.svg'),
                                      12.verticalSpace,
                                      ContentWidget(
                                          content: '${quizProvider.right}',
                                          icon: 'right.svg'),
                                      12.verticalSpace,
                                      ContentWidget(
                                          content: '${quizProvider.wrong}',
                                          icon: 'wrong.svg'),
                                    ],
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                getCustomFont('Score: ${quizProvider.score}',
                                    22, getFontColor(context), 1,
                                    fontWeight: FontWeight.w700),
                                25.verticalSpace,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    for (int i = 0; i < 3; i++)
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        child: getSvgIcon(
                                          icon: (quizProvider.live.value - 1) <
                                                  (i)
                                              ? 'un_select.svg'
                                              : 'select.svg',
                                          color: getFontColor(context),
                                          height: 32,
                                          width: 32,
                                        ),
                                      )
                                  ],
                                ),
                                15.verticalSpace,
                              ],
                            )
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
    });
  }
}
