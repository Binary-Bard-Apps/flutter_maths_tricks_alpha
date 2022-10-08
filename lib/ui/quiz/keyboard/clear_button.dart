import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/color_model.dart';
import '../../common/common.dart';
import 'animation_view.dart';

class ClearButton extends StatelessWidget {
  final Function onTab;
  final double height;
  final String text;
  final double fontSize;
  final ColorModel color;

  const ClearButton({
    Key? key,
    required this.onTab,
    required this.text,
    this.height = 112,
    this.fontSize = 14,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 20.r;

    print("radius===$radius");
    return AnimationView(
        onTab: () {
          onTab();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            alignment: Alignment.center,
            decoration:
                getGradientDecoration(color: color.colorList, radius: 20.r),
            child: IgnorePointer(
              ignoring: true,
              child: Center(
                child: getCustomFont('Clear', 30, Colors.white, 1,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ));
  }
}
