import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/provider/quiz_provider.dart';
import 'package:flutter_maths_tricks/ui/quiz/true_false_view.dart';

import '../../model/color_model.dart';
import '../common/common.dart';
import 'keyboard/keyboard_view.dart';
import 'option_view.dart';

class AnswerView extends StatelessWidget {

  final ColorModel color;
  final List<String> list;
  final Function function;
  final int type;
  final QuizProvider quizProvider;

  AnswerView(
      {required this.color, required this.list, required this.function, required this.type,required this.quizProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: horSpace),
        child: getView()
    );
  }


  getView(){
    if(type == optionView){
      return OptionView(
        color: color,
        list: list,
        function: (answer) {
          function(answer);
        },
      );
    }else if(type == trueFalseView){
     return TrueFalseView(

        list: list,
        function: (answer) {
          function(answer);
        },
      );
    }else{
      return KeyboardView(
        color: color,

       quizProvider: quizProvider,
      );
    }
  }

}
