import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color_scheme.dart';

class ContentWidget extends StatelessWidget {
  final String content;
  final String icon;
  final double? iconSize;
  final double? textSize;

  ContentWidget(
      {required this.content,
      required this.icon,
      this.iconSize,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    double size = (iconSize == null) ? 22 : iconSize!;
    double fontSize = (textSize == null) ? 15 : textSize!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        getSvgIcon(
          icon: icon,
          height: size,
          width: size,
        ),
        7.horizontalSpace,
        getCustomFont(content, fontSize, getFontColor(context), 1,
            fontWeight: FontWeight.w600),
      ],
    );
  }
}
