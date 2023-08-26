import 'package:flutter_maths_tricks/data/methods/method.dart';
import 'package:flutter_maths_tricks/model/trick_model.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class CommonMethods extends Method {
  // trick model to set the question and answer
  setTrickModel(String sign) {
    optionList.shuffle();
    TrickModel trickModel = new TrickModel();
    trickModel.question = question + equalSign;
    trickModel.answer = toStringValue(answer);
    trickModel.sign = sign;
    trickModel.dummyAnswer =
        optionList[new math.Random().nextInt(optionList.length)];
    trickModel.optionList = optionList;
    return trickModel;
  }

// method to get the signs for the formula
  TrickModel getDataFromId(int id, int level_no) {
    optionList = [];
    formula_id = id;
    level = level_no;

    answer = '';
    addSign = '+';
    subSign = '-';
    squareSign = '²';
    cubeSign = '³';
    divSign = '/';
    multiSign = 'x';
    square_root_sign = '√';
    percentageSign = '%';
    commaSign = ',';
    colonSign = ':';
    factorial = '!';
    dotSign = '.';
    LCM = 'LCM:\u0020';
    HCF = 'HCF:\u0020';
    space = '\u0020\u0020';
    stringOf = '\u0020of\u0020';
    equalSign = '\u0020=\u0020';
    // start_tag = "<sup><small>";
    // end_tag = "</small></sup>";
    question = "";
    answer = "";
    optionList = [];

    return getMethodFromName('$id');
  }

// method to generate random number
  int getRandomNumber(int max, int min) {
    return new math.Random().nextInt(max - min) + min;
  }

//method to create option list
  void addDoubleOption() {
    optionList = [];
    answer =
        getSplitString(toStringValue(getFormatValue2(double.parse(answer))));
    optionList.add(getSplitString(
        toStringValue(getFormatValue2(double.parse(answer) + 4))));
    optionList.add(getSplitString(
        toStringValue(getFormatValue2((double.parse(answer) + 3)))));

    if ((double.parse(answer) - 2) < 0) {
      optionList.add(getSplitString(
          toStringValue(getFormatValue2((double.parse(answer) + 5)))));
    } else {
      optionList.add(getSplitString(
          toStringValue(getFormatValue2((double.parse(answer) - 2)))));
    }
    optionList.add(toStringValue(answer));
  }

  // method to create super script

  getSupScript(int n) {
    switch (n) {
      case 0:
        return '\u2070';
      case 1:
        return '\u00B9';
      case 2:
        return '\u00B2';
      case 3:
        return '\u00B3';
      case 4:
        return '\u2074';
      case 5:
        return '\u2075';
      case 6:
        return '\u2076';
      case 7:
        return '\u2077';
      case 8:
        return '\u2078';
      case 9:
        return '\u2079';
      default:
        return '\u2070';
    }
  }

  // nth root of a number
  double nthRoot(double A, double N) {
    double xPre = math.Random().nextDouble() % 10;
    double eps = 0.001;
    double delX = 2147483647;
    double xK = 0.0;
    while (delX > eps) {
      xK = ((N - 1.0) * xPre + A / math.pow(xPre, N - 1)) / N;
      delX = (xK - xPre).abs();
      xPre = xK;
    }
    return xK;
  }

// method to create option list
  void addIntOption() {
    optionList = [];
    optionList.add(toStringValue((int.parse(answer) + 4)));
    optionList.add(toStringValue((int.parse(answer) + 3)));
    optionList.add(toStringValue((int.parse(answer) - 2)));
    optionList.add(toStringValue((int.parse(answer))));
  }

// method to formats the given answer1 to a string with 2 significant digits.
  double getFormatValue2(double answer1) {
    return answer1.toPrecision(2);
  }

// method to emoves trailing decimal point and zeros from the string s if the number is a whole number, returning the updated string.
  String getSplitString(String s) {
    String currentString = s;
    var separated = currentString.split('\\.');
    if (separated.length > 0) {
      if (separated.length >= 2) {
        if (separated[1] == ('0')) {
          s = s.replaceAll(".0", "");
        }
      }
    }
    return s;
  }
}
