import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color_scheme.dart';

class GameOverDialog extends StatelessWidget {
  final Color color;

  GameOverDialog({
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
                  color: color, function: () {
                Navigator.of(context).pop(false);
              }),
            ),
            20.verticalSpace,
            getCustomFont('Game Over !', 24, getFontColor(context), 1,
                fontWeight: FontWeight.w700),
            15.verticalSpace,
            getCustomFont(
                'Get 1 lives for continue game.', 16, getFontColor(context), 1,
                fontWeight: FontWeight.w400),
            50.verticalSpace,
            getCommonBorderButton(
              btnHeight: 60.h,
                title: 'Show Video',

                function: () {
                  Navigator.of(context).pop(true);
                },
                verSpace: 0,
                hSpace: 0,
                color: color),
            20.verticalSpace,

            getCommonButton(
                btnHeight: 60.h,

                title: 'Game Over',
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
