import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/ui/quiz/keyboard/done_button.dart';
import 'package:flutter_maths_tricks/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/color_model.dart';
import '../../../provider/quiz_provider.dart';
import 'back_button.dart';
import 'clear_button.dart';
import 'number_button.dart';

class KeyboardView extends StatelessWidget {
  final ColorModel color;

  final List list = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "-",
    "9",
    "0",
    ".",
    "",
    "Back",
    "Done",
    "",
  ];

  final QuizProvider quizProvider;

  KeyboardView({required this.color, required this.quizProvider});

  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = 4;
    double height = MediaQuery.of(context).size.width / 5;

    double _crossAxisSpacing = 20.h;
    var widthItem = (MediaQuery.of(context).size.width -
            ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;

    double _aspectRatio = widthItem / height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: GridView.count(
        crossAxisCount: _crossAxisCount,
        childAspectRatio: _aspectRatio,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        crossAxisSpacing: _crossAxisSpacing,
        mainAxisSpacing: _crossAxisSpacing,
        primary: false,
        children: List.generate(list.length, (index) {
          String e = list[index];
          if (e == "Clear") {
            return ClearButton(
              text: "Clear",
              height: height,
              onTab: () {
                quizProvider.textEditingController.text = '';
              },
              color: color,
            );
          } else if (e == "Back") {
            return KeyboardBackButton(
              onTab: () {
                quizProvider.backAnswer();
              },
              height: height,
              color: color,
            );
          } else if (e == "") {
            return Container(
              height: height,
            );
          } else if (e == "Done") {
            return KeyboardDoneButton(
              onTab: () {
                if (quizProvider.textEditingController.text.isEmpty) {
                  showToast('Enter answer..', context);
                } else {
                  quizProvider.submitAnswer(
                      quizProvider.textEditingController.text, false);
                }
              },
              height: height,
              color: color,
            );
          } else {
            return NumberButton(
              text: e,
              height: height,
              onTab: () {
                quizProvider.enterAnswer(e);
              },
              color: color,
            );
          }
        }),
      ),
    );
  }
}
