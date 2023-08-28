import 'dart:collection';
import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_maths_tricks/data/methods/addition/addition.dart';
import 'package:flutter_maths_tricks/data/methods/common/common_methods.dart';
import 'package:flutter_maths_tricks/model/trick_model.dart';

// import '../../model/trick_model.dart';

class Method {
  late int formula_id;
  late int level;
  late int n1;
  late int n2;
  late String answer;
  late String space;
  late String addSign;
  late String cubeSign;
  late String squareSign;
  late String square_root_sign;
  late String subSign;
  late String stringOf;
  late String multiSign;
  late String equalSign;
  late String percentageSign;
  late String divSign;
  late String colonSign;
  late String commaSign;
  late String dotSign;
  late String LCM;
  late String HCF;
  late List<String> optionList = [];
  late String question;
  // late String start_tag;
  // late String end_tag;
  late int random_number;
  late String factorial;

// method to get the signs for the formula
  TrickModel getDataFromId(int id, int level_no) {
    return CommonMethods().getDataFromId(id, level_no);
  }

  // trick model to set the question and answer
  setTrickModel(String sign) {
    return CommonMethods()
        .setTrickModel(sign); // Call setTrickModel from common_methods.dart
  }

// method to get the signs for the formula
  getMethodFromName(String methodName) {
    return getMethodList()[methodName];
  }

// number to string
  toStringValue(var number) {
    return number.toString();
  }

// parse
  int getInt() {
    return int.parse(answer);
  }

// methho to generate random number
  int getRandomNumber(int max, int min) {
    return CommonMethods().getRandomNumber(max, min);
  }

//method to create option list
  void addDoubleOption() {
    return CommonMethods().addDoubleOption();
  }

  // method to create super scipt
  getSupScript(int n) {
    return CommonMethods().getSupScript(n);
  }

  // nth root of a number
  double nthRoot(double A, double N) {
    return CommonMethods().nthRoot(A, N);
  }

// method to create option list
  void addIntOption() {
    return CommonMethods().addIntOption();
  }

// method to formats the given answer1 to a string with 2 significant digits.
  double getFormatValue2(double answer1) {
    return CommonMethods().getFormatValue2(answer1);
  }

// method to emoves trailing decimal point and zeros from the string s if the number is a whole number, returning the updated string.
  String getSplitString(String s) {
    return CommonMethods().getSplitString(s);
  }

  // Additon
  // TrickModel method1() {
  //   debugPrint("Not working addtion");

  //   AdditionMethod ab = AdditionMethod();
  //   return ab.method1(); // Call method1 from addition_method.dart
  // }

  // Additon
  TrickModel method1() {
    int ul_one = (level + level) * getRandomNumber(50, 41);
    int ul_two = (level + level) * getRandomNumber(40, 31);
    int ll_one = (level + level) * getRandomNumber(30, 25);
    int ll_two = (level + level) * getRandomNumber(29, 14);
    // n1 = getRandomNumber(120, 50);
    // n2 = getRandomNumber(150, 80);
    n1 = getRandomNumber(ul_one, ll_one);
    n2 = getRandomNumber(ul_two, ll_two);

    answer = toStringValue((n1 + n2));
    question = toStringValue(n1) + space + addSign + space + toStringValue(n2);
    addIntOption();

    return setTrickModel(addSign);
  }

  // Addition number close to 100
  TrickModel method2() {
    int ul_one = (level) * getRandomNumber(80, 75);
    int ll_one = (level) * getRandomNumber(74, 69);
    int ul_two = (level) * getRandomNumber(120, 100);
    int ll_two = (level) * getRandomNumber(99, 90);
    // n1 = getRandomNumber(80, 20);
    // n2 = getRandomNumber(120, 90);
    n1 = getRandomNumber(ul_one, ll_one);
    n2 = getRandomNumber(ul_two, ll_two);
    answer = toStringValue((n1 + n2));
    addIntOption();
    question = toStringValue(n1) + space + addSign + space + toStringValue(n2);
    return setTrickModel(addSign);
  }

// Substraction
  TrickModel method3() {
    int ul_one = (level + level) * getRandomNumber(50, 41);
    int ul_two = (level + level) * getRandomNumber(40, 31);
    int ll_one = (level + level) * getRandomNumber(30, 25);
    int ll_two = (level + level) * getRandomNumber(29, 14);
    // n1 = getRandomNumber(120, 50);
    // n2 = getRandomNumber(150, 80);
    n1 = getRandomNumber(ul_one, ll_one);
    n2 = getRandomNumber(ul_two, ll_two);
    // n1 = getRandomNumber(80, 10);
    // n2 = getRandomNumber(50, 10);
    answer = toStringValue((n1 - n2));
    addIntOption();
    question = toStringValue(n1) + space + subSign + space + toStringValue(n2);
    return setTrickModel(subSign);
  }

// Subtracting from 1000

  TrickModel method4() {
    n1 = 1000;
    // n2 = getRandomNumber(700, 1);

    n2 = getRandomNumber((level * 11), (level * 5));
    if (toStringValue(n2).length > 2) {
      int random = getRandomNumber(8, 1);
      String s = toStringValue(n2);
      s = s.substring(0, s.length - 1) + toStringValue(random);
      n2 = int.parse(s);
    }
    answer = toStringValue((n1 - n2));
    addIntOption();
    question = toStringValue(n1) + space + subSign + space + toStringValue(n2);
    return setTrickModel(subSign);
  }

// Subtracting number close to 100
  TrickModel method5() {
    int ul_one = (level) * getRandomNumber(99, 75);
    int ll_one = (level) * getRandomNumber(74, 69);
    int ul_two = (level) * getRandomNumber(120, 100);
    int ll_two = (level) * getRandomNumber(99, 90);
    n1 = getRandomNumber(ul_two, ll_two);
    n2 = getRandomNumber(ul_one, ll_one);

    answer = toStringValue((n1 - n2));
    addIntOption();
    question = toStringValue(n1) + space + subSign + space + toStringValue(n2);
    return setTrickModel(subSign);
  }

// Multiplication Table
  TrickModel method6() {
    n1 = level;
    // n1 = getRandomNumber(8, 1);
    n2 = getRandomNumber(30, 1);
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);

    return setTrickModel(multiSign);
  }

// Multiply two digit number by 11
  TrickModel method7() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 11;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Multiply by 5
  TrickModel method8() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 5;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Multiply by 9
  TrickModel method9() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 9;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Multiply by 4
  TrickModel method10() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 4;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Tough Multiplication
  TrickModel method11() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = getRandomNumber(level * 10, 1);
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);

    return setTrickModel(multiSign);
  }

  // TODO: Make it suitable for different levels
// Multiply numbers between 11 and 19
  TrickModel method12() {
    n1 = getRandomNumber(19, 11);
    n2 = getRandomNumber(19, 11);
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// TODO: Make it suitable for different levels
// Multiply to digit numbers having same tens digit and ones digits' sum is 10
  TrickModel method13() {
    int number = getRandomNumber(8, 1);

    int max = int.parse('${(number + 1)}0');
    int min = int.parse('${number}1');

    n1 = new math.Random().nextInt(max - min + 1) + min;

    int createNumber = 10 - int.parse(toStringValue(toStringValue(n1)[0]));

    n2 = new math.Random().nextInt(max - min + 1) + min;

    int createNumber1 =
        int.parse(toStringValue(n2).substring(0, toStringValue(n2).length - 1));

    String s = '${toStringValue(createNumber1)}$createNumber';

    n2 = int.parse(s);
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);

    return setTrickModel(multiSign);
  }

// Multiply two digits numbers ending in 1
  TrickModel method14() {
    n1 = getRandomNumber(8, 1);
    n2 = getRandomNumber(8, 1);
    n1 = int.parse(('${n1}1'));

    int createNumber = 8 - int.parse(toStringValue(toStringValue(n1)[0]));

    String s = '${createNumber}1';

    n2 = int.parse(s);

    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Multiply by 15
  TrickModel method15() {
    n1 = getRandomNumber(50, 1);
    n2 = 15;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Muntiply by 20
  TrickModel method16() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 20;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Multiply by 99
  TrickModel method17() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 99;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Multiply by 25
  TrickModel method18() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 25;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Multiply by 50
  TrickModel method19() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 50;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

// Multiply by 0.5
  TrickModel method20() {
    double n1 = getRandomNumber(level * 10, 1).toDouble();
    double n2 = 0.5;
    answer = toStringValue((n1 * n2));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 0.2
  TrickModel method21() {
    double n1 = getRandomNumber(level * 10, 1).toDouble();
    double n2 = 0.2;
    answer = toStringValue((n1 * n2));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 0,25
  TrickModel method22() {
    double n1 = getRandomNumber(level * 10, 1).toDouble();
    double n2 = 0.25;
    answer = toStringValue((n1 * n2));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));

    return setTrickModel(multiSign);
  }

// Multiply by 3
  TrickModel method23() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 3;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 6
  TrickModel method24() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 6;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 7
  TrickModel method25() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 7;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 8
  TrickModel method26() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 8;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 12
  TrickModel method27() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 12;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

//     TrickModel method28() {
//        n1 = new Random().nextInt(50) + 1;
//        n2 = 13;
//        answer = toStringValue((n1 * n2));
//        addIntOption();
//        question = getSplitString(toStringValue(n1)) + multiSign + getSplitString(toStringValue(n2));
//        return new TrickModel(question + equalSign, toStringValue(answer), optionList);
//    }

// Multiply by 14
  TrickModel method28() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 14;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 16
  TrickModel method29() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 16;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 17
  TrickModel method30() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 17;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 18
  TrickModel method31() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 18;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 19
  TrickModel method32() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 19;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 2
  TrickModel method33() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 2;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 125
  TrickModel method34() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 125;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 250
  TrickModel method35() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 250;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 500
  TrickModel method36() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 500;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 750
  TrickModel method37() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 750;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 999
  TrickModel method38() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 999;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Multiply by 75
  TrickModel method39() {
    n1 = getRandomNumber(level * 10, 1);
    n2 = 75;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        multiSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(multiSign);
  }

// Division
  // TrickModel method40() {
  //   // double n1 = getRandomNumber(500, 10).toDouble();
  //   // double n2 = getRandomNumber(80, 10).toDouble();
  //   int n1 = getRandomNumber(level * 80, level * 50);
  //   int n2 = getRandomNumber(level * 40, level * 10);
  //   answer = toStringValue(((n1 / n2)));
  //   addDoubleOption();
  //   question = getSplitString(toStringValue(n1)) +
  //       space +
  //       divSign +
  //       space +
  //       getSplitString(toStringValue(n2));

  //   return setTrickModel(divSign);
  // }
  TrickModel method40() {
    int n1 = getRandomNumber(level * 5, level * 1);
    int n2 = getRandomNumber(10, 1);
    print("$n1 + $n2");
    int quest = (n1 * n2);
    int solution =
        quest ~/ n2; // Use integer division operator to get integer solution
    answer = toStringValue(solution);
// addOption(answer); // Add solution as an option
    addDoubleOption(); // Add other options as decimal numbers
    question = getSplitString(toStringValue(quest)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Division by 5
  TrickModel method41() {
    double n1 =
        (getRandomNumber(level * 25, level * 2) / 5).round() * 5.toDouble();
    double n2 = 5;
    answer = toStringValue(
        n1 ~/ n2); // Using integer division (~/) to get the quotient
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 4
  TrickModel method42() {
    double n1 =
        (getRandomNumber(level * 20, level * 2) / 4).round() * 4.toDouble();
    double n2 = 4;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 20
  TrickModel method43() {
    double n1 =
        (getRandomNumber(level * 100, level * 50) / 20).round() * 20.toDouble();
    double n2 = 20;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 50
  TrickModel method44() {
    double n1 = (getRandomNumber(level * 250, level * 10) / 50).round() *
        50.toDouble() *
        50.toDouble();
    double n2 = 50;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 25
  TrickModel method45() {
    double n1 =
        (getRandomNumber(level * 125, level * 60) / 25).round() * 25.toDouble();
    double n2 = 25;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 40
  TrickModel method46() {
    double n1 =
        (getRandomNumber(level * 20, level * 10) / 40).round() * 40.toDouble();
    double n2 = 40;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 0.5
  TrickModel method47() {
    double n1 =
        (getRandomNumber(level * 2, level * 1) / 0.5).round() * 0.5.toDouble();
    double n2 = 0.5;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 0.2
  TrickModel method48() {
    double n1 =
        (getRandomNumber(level * 2, level * 1) / 0.2).round() * 0.2.toDouble();
    double n2 = 0.2;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 0.25
  TrickModel method49() {
    double n1 = (getRandomNumber(level * 2, level * 1) / 0.25).round() *
        0.25.toDouble();
    double n2 = 0.25;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 15
  TrickModel method50() {
    double n1 =
        (getRandomNumber(level * 75, level * 35) / 15).round() * 15.toDouble();
    double n2 = 15;
    answer = toStringValue(getFormatValue2(((n1 / n2))));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 6
  TrickModel method51() {
    double n1 =
        (getRandomNumber(level * 30, level * 15) / 6).round() * 6.toDouble();
    double n2 = 6;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 3
  TrickModel method52() {
    double n1 =
        (getRandomNumber(level * 15, level * 5) / 3).round() * 3.toDouble();
    double n2 = 3;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 2
  TrickModel method53() {
    double n1 =
        (getRandomNumber(level * 10, level * 5) / 2).round() * 2.toDouble();
    double n2 = 2;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 8
  TrickModel method54() {
    double n1 =
        (getRandomNumber(level * 40, level * 20) / 8).round() * 8.toDouble();
    double n2 = 8;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

  // Divide by 7
  TrickModel method55() {
    double n1 =
        (getRandomNumber(level * 35, level * 20) / 7).round() * 7.toDouble();
    double n2 = 7;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Divide by 9
  TrickModel method56() {
    double n1 =
        (getRandomNumber(level * 45, level * 20) / 9).round() * 9.toDouble();
    double n2 = 9;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

// Square ending with 5
  TrickModel method57() {
    n1 = (getRandomNumber(level * 10, level * 1));
    n1 = int.parse(toStringValue(n1) + "5");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

// Square between 90 and 100
  TrickModel method58() {
    n1 = getRandomNumber(98, 91);

    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square between 40 and 50
  TrickModel method59() {
    n1 = getRandomNumber(58, 51);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

// Square between 40 and 50
  TrickModel method60() {
    n1 = getRandomNumber(48, 41);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

// Square between 100 and 110
  TrickModel method61() {
    n1 = getRandomNumber(108, 101);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

// Square between 10 and 20
  TrickModel method62() {
    n1 = getRandomNumber(18, 11);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

// Square between 1 and 10
  TrickModel method63() {
    n1 = getRandomNumber(9, 1);
    n1 = int.parse(toStringValue(n1) + "25");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square between 20 and 30
  TrickModel method64() {
    n1 = getRandomNumber(29, 20);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square between 30 and 40
  TrickModel method65() {
    n1 = getRandomNumber(39, 30);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

// Square between 60 and 70
  TrickModel method66() {
    n1 = getRandomNumber(69, 60);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square between 70 and 80
  TrickModel method67() {
    n1 = getRandomNumber(79, 70);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square between 80 and 90
  TrickModel method68() {
    n1 = getRandomNumber(89, 80);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square ending with 75
  TrickModel method69() {
    n1 = getRandomNumber(50, 1);
    n1 = int.parse(toStringValue(n1) + "75");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square ending with 125
  TrickModel method70() {
    n1 = getRandomNumber(10, 1);
    n1 = int.parse(toStringValue(n1) + "125");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square enging with 05
  TrickModel method71() {
    n1 = getRandomNumber(10, 1);
    n1 = int.parse(toStringValue(n1) + "05");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square enging with 15
  TrickModel method72() {
    n1 = getRandomNumber(50, 1);
    n1 = int.parse(toStringValue(n1) + "15");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  // Square enging with 95
  TrickModel method73() {
    n1 = getRandomNumber(10, 1);
    n1 = int.parse(toStringValue(n1) + "95");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method74() {
    double n1 = 2;
    double n2 = getRandomNumber(9, 1).toDouble();
    debugPrint('Look here');
    debugPrint(getSplitString(toStringValue(n2)));
    answer = toStringValue((math.pow(n1, n2)));
    addDoubleOption();

    String power = getSupScript(n2.toInt());

    question = getSplitString(toStringValue(n1)) + power;

    return setTrickModel(squareSign);
  }

// Power of 2 between 10 and 99
  TrickModel method75() {
    // double n1 = getRandomNumber(99, 10).toDouble();
    double n1 = getRandomNumber((level <= 3 ? 15 : level * 3), 10).toDouble();
    answer = toStringValue((math.pow(n1, 2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + squareSign;
    return setTrickModel('');
  }

// Power of 2 between 100 and 999
  TrickModel method76() {
    double n1 = getRandomNumber(level * 30, level * 3).toDouble();
    answer = toStringValue((math.pow(n1, 2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + squareSign;
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();

    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

// Power of 2 between 1000 and 9999
  TrickModel method77() {
    double maxN1 = level * 333;
    double minN1 = level * 33;

    double n1 = getRandomNumber(maxN1.toInt(), minN1.toInt()).toDouble();
    answer = toStringValue((math.pow(n1, 2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + squareSign;
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

  // Power of 3 between 10 and 99
  TrickModel method78() {
    double n1 = getRandomNumber((level <= 3 ? 15 : level * 3), 10).toDouble();
    answer = toStringValue((math.pow(n1, 3)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + cubeSign;
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

// Power of 3 between 100 and 999
  TrickModel method79() {
    double minN1 = level <= 3 ? 15 : (level - 3) * 100;
    double maxN1 = min(minN1 + 100, 999.0); // Ensure maxN1 is within the limit

    if (minN1 >= maxN1) {
      minN1 = maxN1 - 100; // Adjust minN1 to ensure it's less than maxN1
    }

    double n1 = getRandomNumber(maxN1.toInt(), minN1.toInt()).toDouble();
    answer = toStringValue((math.pow(n1, 3)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + cubeSign;
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

// Power of 4 between 1 and 99
  TrickModel method80() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    answer = toStringValue((math.pow(n1, 4)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + '⁴';
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

// Power of 6 between 1 and 99
  TrickModel method81() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    answer = toStringValue((math.pow(n1, 6)).toInt());
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + '⁶';

    TrickModel trickModel = setTrickModel('');

    int exponentialAns = math.pow(n1, 6).toInt();

    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

// Power of 9 between 1 and 99
  TrickModel method82() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    answer = toStringValue((math.pow(n1, 9)));
//        addDoubleOption();
    question = getSplitString(toStringValue(n1)) + '⁹';

    answer =
        getSplitString(toStringValue(getFormatValue2(double.parse(answer))));
    String string_form = answer.substring(0, answer.indexOf('.'));
    int t = int.parse(string_form);

    String appendString = answer.substring(answer.lastIndexOf("."));

    // optionList.add('${(t + 1)}$appendString');
    // optionList.add('${(t + 2)}$appendString');
    // optionList.add('${(t + 3)}$appendString');

    // optionList.add(toStringValue(answer));
    TrickModel trickModel = setTrickModel('');

    int exponentialAns = math.pow(n1, 9).toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

// nth root of 2 between 1 - 100

  TrickModel method83() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    double n2 = 2;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));

    addDoubleOption();

    return setTrickModel('');
  }

// nth root of 3 between 1 - 100
  TrickModel method84() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    double n2 = 3;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());

    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));

    return setTrickModel('');
  }

// nth root of 4 between 1 - 100
  TrickModel method85() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    double n2 = 4;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));
    addDoubleOption();
    return setTrickModel('');
  }

// nth root of 5
  TrickModel method86() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    double n2 = 5;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));
    addDoubleOption();
    return setTrickModel('');
  }

// nth root of 6 between 1 - 100
  TrickModel method87() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    double n2 = 6;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));
    addDoubleOption();
    return setTrickModel('');
  }

// nth root of 9 between 1 - 100
  TrickModel method88() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    double n2 = 9;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));
    addDoubleOption();
    return setTrickModel('');
  }

// Percentage
  TrickModel method89() {
    double n1 = getRandomNumber(100, 2).toDouble();
    double n2 = getRandomNumber(300, 20).toDouble();

    double step1 = n1 / 100;
    double step2 = step1 * n2;

    answer = toStringValue(getFormatValue2(step2));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n2));
    return setTrickModel('');
  }

// Percentage
// Explain methon90
// This method is used to generate percentage of a number between 2 and 9

  TrickModel method90() {
    double n1 = getRandomNumber(9, 2).toDouble();
    double n2 = getRandomNumber(
            level <= 10
                ? 3
                : level <= 20
                    ? 6
                    : level <= 30
                        ? 9
                        : 9,
            1)
        .toDouble();
    int random = new math.Random().nextInt(2);

    if (random == 1) {
      n2 = n2 * 100;
    } else {
      n2 = (n2 * 100) + 50;
    }

    double step1 = n1 / 100;
    double step2 = step1 * n2;

    answer = toStringValue(getFormatValue2(step2));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n2));
    return setTrickModel('');
  }

// Percentage of a number between 10 and 80
// Percentage Calculation (Number Range: 1 to 45, Percentage Range: 50%)
  TrickModel method91() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    answer = toStringValue((n1 / 2));
    addDoubleOption();
    question = toStringValue(50) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

// Percentage: 25% Number: 1 to 90
  TrickModel method92() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();
    answer = toStringValue((n1 / 4));
    addDoubleOption();
    question = toStringValue(25) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  // Percentage: 20%
// Number: 1 to 90
  TrickModel method93() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 3, level).toDouble();

    answer = toStringValue(((((n1 / 10)) * 2)));
    addDoubleOption();
    question = toStringValue(20) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  //   Percentage: 15%
// Number: 1 to 500
  TrickModel method94() {
    double n1 = getRandomNumber(level * 16, level * 10).toDouble();
    double step1 = n1 / 10;
    double step2 = step1 / 2;
    double step3 = step1 + step2;
    answer = toStringValue(getFormatValue2(step3));
    addDoubleOption();
    question = toStringValue(15) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

// Percentage: 5%
// Number: 1 to 500
  TrickModel method95() {
    double n1 = getRandomNumber(level * 16, level * 10).toDouble();
    answer = toStringValue(((((n1 / 10)) / 2)));
    addDoubleOption();
    question = toStringValue(5) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

// Percentage: 4%
// Number: 1 to 500

  TrickModel method96() {
    double n1 = getRandomNumber(level * 16, level * 10).toDouble();
    answer = toStringValue(((((n1 / 100)) * 4)));
    addDoubleOption();
    question = toStringValue(4) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

//   Percentage: 2%
// Number: 1 to 500

  TrickModel method97() {
    double n1 = getRandomNumber(level * 16, level * 10).toDouble();
    answer = toStringValue(((((n1 / 100)) * 2)));
    addDoubleOption();
    question = toStringValue(2) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

// Percentage: 0.5%
// Number: 1 to 500
  TrickModel method98() {
    double n1 = getRandomNumber(level * 16, level * 10).toDouble();
    answer = toStringValue(((((n1 / 100)) / 2)));
    addDoubleOption();
    question = toStringValue(0.5) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  // Percentage: 150%
// Number: 1 to 120
  TrickModel method99() {
    double n1 = getRandomNumber(level <= 3 ? 15 : level * 4, level).toDouble();

    double step1 = n1 / 2;
    double step2 = n1 + step1;
    answer = toStringValue(getFormatValue2(step2));
    addDoubleOption();
    question = toStringValue(150) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }
  // Percentage: 200%
// Number: 1 to 180

  TrickModel method100() {
    double n1 = getRandomNumber(level <= 4 ? 15 : level * 4, level).toDouble();
    answer = toStringValue((n1 * 2));
    addDoubleOption();
    question = toStringValue(200) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel(percentageSign);
  }

  // Percentage: 1000%
// Number: 1 to 220

  TrickModel method101() {
    double n1 =
        getRandomNumber(level <= 3 ? 40 : level * 8, level * 4).toDouble();
    answer = toStringValue(((n1 / 4) * 10));
    addDoubleOption();
    question = toStringValue(250) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel(percentageSign);
  }

// Percentage: 300%
// Number: 1 to 280
  TrickModel method102() {
    double n1 =
        getRandomNumber(level <= 3 ? 40 : level * 8, level * 4).toDouble();
    answer = toStringValue(((n1 * 3)));
    addDoubleOption();
    question = toStringValue(300) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

// Percentage: 500%
// Number: 1 to 400
  TrickModel method103() {
    double n1 =
        getRandomNumber(level <= 3 ? 40 : level * 13, level * 4).toDouble();
    answer = toStringValue(((n1 * 5)));
    addDoubleOption();
    question = toStringValue(500) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

// Percentage: 75%
// Number: 1 to 70
  TrickModel method104() {
    double n1 =
        getRandomNumber(level <= 3 ? 40 : level * 13, level * 4).toDouble();
    answer = toStringValue((((n1 / 4) * 3)));
    addDoubleOption();
    question = toStringValue(75) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel(percentageSign);
  }

// Percentage: 750%
// Number: 1 to 700
  TrickModel method105() {
    double n1 =
        getRandomNumber(level <= 3 ? 40 : level * 30, level * 10).toDouble();
    answer = toStringValue(((((n1 / 4) * 3)) * 10));
    addDoubleOption();
    question = toStringValue(750) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel(percentageSign);
  }

// Percentage: 40%
// Number: 1 to 80
  TrickModel method106() {
    debugPrint("----------------------Printing Level $level");
    // double n1 = getRandomNumber(80, 1).toDouble();
    double n1 = getRandomNumber(level <= 4 ? 30 : level * 4, level).toDouble();
    answer = toStringValue((((n1 / 10) * 4)));
    addDoubleOption();
    question = toStringValue(40) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

// mapping of all the methods
  getMethodList() {
    HashMap<String, TrickModel> mapList = HashMap();
    mapList['1'] = method1();
    mapList['2'] = method2();
    mapList['3'] = method3();
    mapList['4'] = method4();
    mapList['5'] = method5();
    mapList['6'] = method6();
    mapList['7'] = method7();
    mapList['8'] = method8();
    mapList['9'] = method9();
    mapList['10'] = method10();
    mapList['11'] = method11();
    mapList['12'] = method12();
    mapList['13'] = method13();
    mapList['14'] = method14();
    mapList['15'] = method15();
    mapList['16'] = method16();
    mapList['17'] = method17();
    mapList['18'] = method18();
    mapList['19'] = method19();
    mapList['20'] = method20();
    mapList['21'] = method21();
    mapList['22'] = method22();
    mapList['23'] = method23();
    mapList['24'] = method24();
    mapList['25'] = method25();
    mapList['26'] = method26();
    mapList['27'] = method27();
    mapList['28'] = method28();
    mapList['29'] = method29();
    mapList['30'] = method30();
    mapList['31'] = method31();
    mapList['32'] = method32();
    mapList['33'] = method33();
    mapList['34'] = method34();
    mapList['35'] = method35();
    mapList['36'] = method36();
    mapList['37'] = method37();
    mapList['38'] = method38();
    mapList['39'] = method39();
    mapList['40'] = method40();
    mapList['41'] = method41();
    mapList['42'] = method42();
    mapList['43'] = method43();
    mapList['44'] = method44();
    mapList['45'] = method45();
    mapList['46'] = method46();
    mapList['47'] = method47();
    mapList['48'] = method48();
    mapList['49'] = method49();
    mapList['50'] = method50();
    mapList['51'] = method51();
    mapList['52'] = method52();
    mapList['53'] = method53();
    mapList['54'] = method54();
    mapList['55'] = method55();
    mapList['56'] = method56();
    mapList['57'] = method57();
    mapList['58'] = method58();
    mapList['59'] = method59();
    mapList['60'] = method60();
    mapList['61'] = method61();
    mapList['62'] = method62();
    mapList['63'] = method63();
    mapList['64'] = method64();
    mapList['65'] = method64();
    mapList['65'] = method65();
    mapList['66'] = method66();
    mapList['67'] = method67();
    mapList['68'] = method68();
    mapList['69'] = method69();
    mapList['70'] = method70();
    mapList['71'] = method71();
    mapList['72'] = method72();
    mapList['73'] = method73();
    mapList['74'] = method74();
    mapList['75'] = method75();
    mapList['76'] = method76();
    mapList['77'] = method77();
    mapList['78'] = method78();
    mapList['79'] = method79();
    mapList['80'] = method80();
    mapList['81'] = method81();
    mapList['82'] = method82();
    mapList['83'] = method83();
    mapList['84'] = method84();
    mapList['85'] = method85();
    mapList['86'] = method86();
    mapList['87'] = method87();
    mapList['88'] = method88();
    mapList['89'] = method89();
    mapList['90'] = method90();
    mapList['91'] = method91();
    mapList['92'] = method92();
    mapList['93'] = method93();
    mapList['94'] = method94();
    mapList['95'] = method95();
    mapList['96'] = method96();
    mapList['97'] = method97();
    mapList['98'] = method98();
    mapList['99'] = method99();
    mapList['100'] = method100();
    mapList['101'] = method101();
    mapList['102'] = method102();
    mapList['103'] = method103();
    mapList['104'] = method104();
    mapList['105'] = method105();
    mapList['106'] = method106();
    return mapList;
  }
}
