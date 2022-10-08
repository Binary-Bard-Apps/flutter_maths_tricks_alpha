import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrueFalseButton extends StatelessWidget {

  final Color color;
  final String icon;
  final Function function;

  TrueFalseButton({required this.color,required this.function,required this.icon});


  @override
  Widget build(BuildContext context) {
    double height = 110.h;



    return Container(
      height: height,
      margin: EdgeInsets.only(top: 140.h),
      decoration: getDefaultDecoration(bgColor: color, radius: 20.r),
      alignment: Alignment.center,
      child: getSvgIcon(
          icon: icon,
          height: 36,
          width: 36,
          function: (){
            function();
          }
      ),
    );

  }

}
