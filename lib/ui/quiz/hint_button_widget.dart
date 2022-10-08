import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color_scheme.dart';

class HintButtonWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final Function function;

  HintButtonWidget(
      {required this.icon, required this.color, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 70.h,
      decoration: getDefaultDecoration(
        bgColor: getCardColor(context),
        radius: 12.r,
        isShadow: true,
        shadow: BoxShadow(
          color: getShadowColor(context),
          blurRadius: 22,
          offset: Offset(2, 8),
        ),
      ),
      alignment: Alignment.center,
      child: getSvgIcon(
          icon: icon,
          color: color,
          height: 32,
          width: 32,
          function: () {
            function();
          }),
    );
  }
}
