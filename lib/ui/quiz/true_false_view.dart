import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/theme/app_theme.dart';
import 'package:flutter_maths_tricks/ui/quiz/true_false_button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/common.dart';

class TrueFalseView extends StatelessWidget {
  final List<String> list;
  final Function function;

  TrueFalseView({required this.list, required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TrueFalseButton(
              color: redAlphaColor,
              function: () {
                function('0');
              },
              icon: 'close.svg'),
          flex: 1,
        ),
        horSpace.horizontalSpace,
        Expanded(
          child: TrueFalseButton(
              color: greenAlphaColor,
              function: () {
                function('1');
              },
              icon: 'check.svg'),
          flex: 1,
        ),
      ],
    );
  }
}
