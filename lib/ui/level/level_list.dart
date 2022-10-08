import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/app/key_util.dart';
import 'package:flutter_maths_tricks/model/dummy_model.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../model/color_model.dart';
import '../../model/data_model.dart';
import '../common/common.dart';

class LevelList extends StatelessWidget {
  final List<DataModel> list;
  final DummyModel dummyModel;
  final AnimationController animationController;
  final ColorModel color;

  LevelList(
      {required this.list,
      required this.animationController,
      required this.color,
      required this.dummyModel});

  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = 3;
    double height = MediaQuery.of(context).size.width / 3.5;

    double _crossAxisSpacing = 30.h;
    var widthItem = (MediaQuery.of(context).size.width -
            ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;

    double _aspectRatio = widthItem / height;

    return GridView.count(
      crossAxisCount: _crossAxisCount,
      childAspectRatio: _aspectRatio,
      shrinkWrap: true,
      crossAxisSpacing: _crossAxisSpacing,
      mainAxisSpacing: 30.h,
      primary: false,
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
      children: List.generate(list.length, (index) {
        final Animation<double> animation =
            Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval((1 / list.length) * index, 1.0,
                curve: Curves.fastOutSlowIn),
          ),
        );
        animationController.forward();

        DataModel dataModel = list[index];
        return buildAnimatedItem(
            context,
            index,
            animation,
            InkWell(
              child: Container(
                height: height,
                decoration: getDefaultDecoration(
                    radius: 28.r,
                    borderColor: getFontColor(context),
                    bgColor: getCardColor(context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getCustomFont(
                      dataModel.level_no!.toString(),
                      30,
                      getFontColor(context),
                      1,
                      font: 'OriginalSurfer',
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.r)),
                            color: color.mainColor,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          padding: EdgeInsets.symmetric(
                              vertical: 7.h, horizontal: 12.w),
                          child: Center(
                            child: getCustomFont(
                              'Level',
                              12,
                              getFontColor(context),
                              1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              onTap: () {
                dummyModel.dataModel = dataModel;
                dummyModel.levelNo = dataModel.level_no!;
                Get.toNamed(KeyUtil.quizPage,
                    arguments: Tuple2(dummyModel, color));
              },
            ));
      }),
    );
  }

  Widget buildAnimatedItem(BuildContext context, int index,
          Animation<double> animation, Widget widget) =>
      // For example wrap with fade transition
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: widget,
        ),
      );
}
