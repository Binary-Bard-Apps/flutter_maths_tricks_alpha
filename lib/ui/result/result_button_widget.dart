import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/color_scheme.dart';

class ResultButtonWidget extends StatelessWidget {
  final String icon;
  final Function function;

  ResultButtonWidget({required this.icon, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65.h,
        width: 65.h,
        decoration: BoxDecoration(
            color: getCardColor(context),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: getShadowColor(context),
                blurRadius: 22,
                offset: Offset(2, 8),
              )
            ]),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            function();
          },
          child: SvgPicture.string(
            icon,
            height: 20,
          ),
        ));
  }
}
