import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color_scheme.dart';

class QuizExitDialog extends StatelessWidget {
  final Color color;

  QuizExitDialog({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var margin = horSpace;
    return Container(
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: (margin)),
        padding: EdgeInsets.symmetric(vertical: (margin)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: getCloseIcon(
                  color: color,
                  function: () {
                    Navigator.of(context).pop(false);
                  }),
            ),
            20.verticalSpace,
            getCustomFont('Quit !', 24, getFontColor(context), 1,
                fontWeight: FontWeight.w700),
            15.verticalSpace,
            getCustomFont(
                'Are you sure you want to quiz?', 16, getFontColor(context), 1,
                fontWeight: FontWeight.w400),
            50.verticalSpace,
            getCommonBorderButton(
                btnHeight: 60.h,
                title: 'No',
                function: () {
                  Navigator.of(context).pop(true);
                },
                verSpace: 0,
                hSpace: 0,
                color: color),
            20.verticalSpace,
            getCommonButton(
                btnHeight: 60.h,
                title: 'Yes',
                function: () {
                  Navigator.of(context).pop(false);
                },
                verSpace: 0,
                hSpace: 0,
                color: color),
            8.verticalSpace
          ],
        ));
  }
}
