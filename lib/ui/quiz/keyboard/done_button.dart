import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/color_model.dart';
import '../../common/common.dart';
import 'animation_view.dart';

class KeyboardDoneButton extends StatelessWidget {
  final Function onTab;
  final double height;

  final ColorModel color;

  const KeyboardDoneButton({
    Key? key,
    required this.onTab,
    this.height = 112,
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
            // decoration: getGradientDecoration(color: Colors.green, radius: 20.r),

            child: IgnorePointer(
              ignoring: true,
              child: Center(
                  child: getSvgIcon(
                      icon: 'check.svg',
                      height: 30,
                      color: Colors.white,
                      width: 30,
                      function: () {
                        // function();
                      })),
            ),
          ),
        ));
  }
}
