import 'dart:collection';
import 'dart:math' as math;

import 'package:get/get.dart';

import '../model/trick_model.dart';

class Method {
  late int formula_id;
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

  TrickModel getDataFromId(int id) {
    optionList = [];
    formula_id = id;

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

  getMethodFromName(String methodName) {
    return getMethodList()[methodName];
  }

  toStringValue(var number) {
    return number.toString();
  }

  TrickModel method1() {
    n1 = getRandomNumber(120, 50);
    n2 = getRandomNumber(150, 80);

    answer = toStringValue((n1 + n2));
    question = toStringValue(n1) + space + addSign + space + toStringValue(n2);
    addIntOption();

    return setTrickModel(addSign);
  }

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

  int getInt() {
    return int.parse(answer);
  }

  TrickModel method2() {
    n1 = getRandomNumber(80, 20);
    n2 = getRandomNumber(120, 90);
    answer = toStringValue((n1 + n2));
    addIntOption();
    question = toStringValue(n1) + space + addSign + space + toStringValue(n2);
    return setTrickModel(addSign);
  }

  TrickModel method3() {
    n1 = getRandomNumber(80, 10);
    n2 = getRandomNumber(50, 10);
    answer = toStringValue((n1 - n2));
    addIntOption();
    question = toStringValue(n1) + space + subSign + space + toStringValue(n2);
    return setTrickModel(subSign);
  }

  TrickModel method4() {
    n1 = 1000;
    n2 = getRandomNumber(700, 2);
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

  TrickModel method5() {
    int r = new math.Random().nextInt(2);

    if (r > 0) {
      n1 = getRandomNumber(150, 90);
      n2 = getRandomNumber(80, 40);
    } else {
      n1 = getRandomNumber(200, 100);
      n2 = getRandomNumber(95, 70);
    }

    answer = toStringValue((n1 - n2));
    addIntOption();
    question = toStringValue(n1) + space + subSign + space + toStringValue(n2);
    return setTrickModel(subSign);
  }

  TrickModel method6() {
    n1 = 1;
    n1 = getRandomNumber(8, 1);
    n2 = getRandomNumber(8, 1);
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);

    return setTrickModel(multiSign);
  }

  TrickModel method7() {
    n1 = getRandomNumber(50, 1);
    n2 = 11;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

  TrickModel method8() {
    n1 = getRandomNumber(50, 1);
    n2 = 5;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

  TrickModel method9() {
    n1 = getRandomNumber(50, 1);
    n2 = 9;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

  TrickModel method10() {
    n1 = getRandomNumber(50, 1);
    n2 = 4;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

  TrickModel method11() {
    n1 = getRandomNumber(50, 1);
    n2 = getRandomNumber(50, 1);
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);

    return setTrickModel(multiSign);
  }

  TrickModel method12() {
    n1 = getRandomNumber(19, 11);
    n2 = getRandomNumber(19, 11);
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

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

  TrickModel method15() {
    n1 = getRandomNumber(50, 1);
    n2 = 15;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

  TrickModel method16() {
    n1 = getRandomNumber(50, 1);
    n2 = 20;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

  TrickModel method17() {
    n1 = getRandomNumber(50, 1);
    n2 = 99;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

  TrickModel method18() {
    n1 = getRandomNumber(50, 1);
    n2 = 25;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

  TrickModel method19() {
    n1 = getRandomNumber(50, 1);
    n2 = 50;
    answer = toStringValue((n1 * n2));
    addIntOption();
    question =
        toStringValue(n1) + space + multiSign + space + toStringValue(n2);
    return setTrickModel(multiSign);
  }

  TrickModel method20() {
    double n1 = getRandomNumber(50, 1).toDouble();
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

  TrickModel method21() {
    double n1 = getRandomNumber(50, 1).toDouble();
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

  TrickModel method22() {
    double n1 = getRandomNumber(50, 1).toDouble();
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

  TrickModel method23() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method24() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method25() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method26() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method27() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method28() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method29() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method30() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method31() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method32() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method33() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method34() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method35() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method36() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method37() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method38() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method39() {
    n1 = getRandomNumber(50, 1);
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

  TrickModel method40() {
    double n1 = getRandomNumber(500, 10).toDouble();
    double n2 = getRandomNumber(80, 10).toDouble();
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));

    return setTrickModel(divSign);
  }

  TrickModel method41() {
    double n1 = getRandomNumber(500, 10).toDouble();
    double n2 = 5;
    answer = toStringValue(((n1 / n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        space +
        divSign +
        space +
        getSplitString(toStringValue(n2));
    return setTrickModel(divSign);
  }

  TrickModel method42() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method43() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method44() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method45() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method46() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method47() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method48() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method49() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method50() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method51() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method52() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method53() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method54() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method55() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method56() {
    double n1 = getRandomNumber(500, 10).toDouble();
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

  TrickModel method57() {
    n1 = getRandomNumber(99, 2);
    n1 = int.parse(toStringValue(n1) + "5");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method58() {
    n1 = getRandomNumber(98, 91);

    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method59() {
    n1 = getRandomNumber(58, 51);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method60() {
    n1 = getRandomNumber(48, 41);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method61() {
    n1 = getRandomNumber(108, 101);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method62() {
    n1 = getRandomNumber(18, 11);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method63() {
    n1 = getRandomNumber(9, 1);
    n1 = int.parse(toStringValue(n1) + "25");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method64() {
    n1 = getRandomNumber(29, 20);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method65() {
    n1 = getRandomNumber(39, 30);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method66() {
    n1 = getRandomNumber(69, 60);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method67() {
    n1 = getRandomNumber(79, 70);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method68() {
    n1 = getRandomNumber(89, 80);
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method69() {
    n1 = getRandomNumber(50, 1);
    n1 = int.parse(toStringValue(n1) + "75");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method70() {
    n1 = getRandomNumber(10, 1);
    n1 = int.parse(toStringValue(n1) + "125");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method71() {
    n1 = getRandomNumber(10, 1);
    n1 = int.parse(toStringValue(n1) + "05");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

  TrickModel method72() {
    n1 = getRandomNumber(50, 1);
    n1 = int.parse(toStringValue(n1) + "15");
    answer = toStringValue(((n1 * n1)));
    addIntOption();
    question = toStringValue(n1) + squareSign;
    return setTrickModel(squareSign);
  }

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
    answer = toStringValue((math.pow(n1, n2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) +
        "<sup><small>" +
        getSplitString(toStringValue(n2)) +
        "</small></sup>";
    return setTrickModel(squareSign);
  }

  TrickModel method75() {
    double n1 = getRandomNumber(99, 10).toDouble();
    answer = toStringValue((math.pow(n1, 2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + squareSign;
    return setTrickModel('');
  }

  TrickModel method76() {
    double n1 = getRandomNumber(999, 101).toDouble();
    answer = toStringValue((math.pow(n1, 2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + squareSign;
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();

    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

  TrickModel method77() {
    double n1 = getRandomNumber(9999, 1000).toDouble();
    answer = toStringValue((math.pow(n1, 2)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + squareSign;
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

  TrickModel method78() {
    double n1 = getRandomNumber(99, 10).toDouble();
    answer = toStringValue((math.pow(n1, 3)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + cubeSign;
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

  TrickModel method79() {
    double n1 = getRandomNumber(999, 100).toDouble();
    answer = toStringValue((math.pow(n1, 3)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + cubeSign;
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

  TrickModel method80() {
    double n1 = getRandomNumber(500, 1).toDouble();
    answer = toStringValue((math.pow(n1, 4)));
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + '⁴';
    TrickModel trickModel = setTrickModel('');
    int exponentialAns = n1.toInt() * n1.toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

  TrickModel method81() {
    double n1 = getRandomNumber(500, 1).toDouble();
    answer = toStringValue((math.pow(n1, 6)).toInt());
    addDoubleOption();
    question = getSplitString(toStringValue(n1)) + '⁶';

    TrickModel trickModel = setTrickModel('');

    int exponentialAns = math.pow(n1, 6).toInt();

    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

  TrickModel method82() {
    double n1 = getRandomNumber(500, 1).toDouble();
    answer = toStringValue((math.pow(n1, 9)));
//        addDoubleOption();
    question = getSplitString(toStringValue(n1)) + '⁹';

    answer =
        getSplitString(toStringValue(getFormatValue2(double.parse(answer))));
    String string_form = answer.substring(0, answer.indexOf('.'));
    int t = int.parse(string_form);

    String appendString = answer.substring(answer.lastIndexOf("."));

    optionList.add('${(t + 1)}$appendString');
    optionList.add('${(t + 2)}$appendString');
    optionList.add('${(t + 3)}$appendString');

    optionList.add(toStringValue(answer));
    TrickModel trickModel = setTrickModel('');

    int exponentialAns = math.pow(n1, 9).toInt();
    trickModel.exponentialAns = toStringValue(exponentialAns);
    return trickModel;
  }

  TrickModel method83() {
    double n1 = getRandomNumber(10000, 1).toDouble();
    double n2 = 2;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));

    addDoubleOption();

    return setTrickModel('');
  }

  TrickModel method84() {
    double n1 = getRandomNumber(10000, 1).toDouble();
    double n2 = 3;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());

    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));

    return setTrickModel('');
  }

  TrickModel method85() {
    double n1 = getRandomNumber(10000, 1).toDouble();
    double n2 = 4;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));
    addDoubleOption();
    return setTrickModel('');
  }

  TrickModel method86() {
    double n1 = getRandomNumber(10000, 1).toDouble();
    double n2 = 6;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));
    addDoubleOption();
    return setTrickModel('');
  }

  TrickModel method87() {
    double n1 = getRandomNumber(10000, 1).toDouble();
    double n2 = 9;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));
    addDoubleOption();
    return setTrickModel('');
  }

  TrickModel method88() {
    double n1 = getRandomNumber(10000, 1).toDouble();
    double n2 = 5;
    double nthRootValue = nthRoot(n1, n2);
    answer = toStringValue(((nthRootValue * 1000) / 1000).round());
    question =
        getSupScript(n2.toInt()) + '√' + getSplitString(toStringValue(n1));
    addDoubleOption();
    return setTrickModel('');
  }

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

  TrickModel method90() {
    double n1 = getRandomNumber(9, 2).toDouble();
    double n2 = getRandomNumber(9, 1).toDouble();
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

  TrickModel method91() {
    double n1 = getRandomNumber(80, 10).toDouble();
    answer = toStringValue((n1 / 2));
    addDoubleOption();
    question = toStringValue(50) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  TrickModel method92() {
    double n1 = getRandomNumber(80, 10).toDouble();
    answer = toStringValue((n1 / 4));
    addDoubleOption();
    question = toStringValue(25) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  TrickModel method93() {
    double n1 = getRandomNumber(80, 10).toDouble();

    answer = toStringValue(((((n1 / 10)) * 2)));
    addDoubleOption();
    question = toStringValue(20) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  TrickModel method94() {
    double n1 = getRandomNumber(500, 50).toDouble();
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

  TrickModel method95() {
    double n1 = getRandomNumber(500, 50).toDouble();
    answer = toStringValue(((((n1 / 10)) / 2)));
    addDoubleOption();
    question = toStringValue(5) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  TrickModel method96() {
    double n1 = getRandomNumber(500, 50).toDouble();
    answer = toStringValue(((((n1 / 100)) * 4)));
    addDoubleOption();
    question = toStringValue(4) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  TrickModel method97() {
    double n1 = getRandomNumber(500, 50).toDouble();
    answer = toStringValue(((((n1 / 100)) * 2)));
    addDoubleOption();
    question = toStringValue(2) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  TrickModel method98() {
    double n1 = getRandomNumber(500, 50).toDouble();
    answer = toStringValue(((((n1 / 100)) / 2)));
    addDoubleOption();
    question = toStringValue(0.5) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  TrickModel method99() {
    double n1 = getRandomNumber(120, 2).toDouble();

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

  TrickModel method100() {
    double n1 = getRandomNumber(180, 2).toDouble();
    answer = toStringValue((n1 * 2));
    addDoubleOption();
    question = toStringValue(200) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel(percentageSign);
  }

  TrickModel method101() {
    double n1 = getRandomNumber(220, 2).toDouble();
    answer = toStringValue(((n1 / 4) * 10));
    addDoubleOption();
    question = toStringValue(250) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel(percentageSign);
  }

  TrickModel method102() {
    double n1 = getRandomNumber(280, 2).toDouble();
    answer = toStringValue(((n1 * 3)));
    addDoubleOption();
    question = toStringValue(300) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  TrickModel method103() {
    double n1 = getRandomNumber(400, 2).toDouble();
    answer = toStringValue(((n1 * 5)));
    addDoubleOption();
    question = toStringValue(500) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

  TrickModel method104() {
    double n1 = getRandomNumber(70, 2).toDouble();
    answer = toStringValue((((n1 / 4) * 3)));
    addDoubleOption();
    question = toStringValue(75) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel(percentageSign);
  }

  TrickModel method105() {
    double n1 = getRandomNumber(700, 2).toDouble();
    answer = toStringValue(((((n1 / 4) * 3)) * 10));
    addDoubleOption();
    question = toStringValue(750) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel(percentageSign);
  }

  TrickModel method106() {
    double n1 = getRandomNumber(80, 10).toDouble();
    answer = toStringValue((((n1 / 10) * 4)));
    addDoubleOption();
    question = toStringValue(40) +
        percentageSign +
        stringOf +
        getSplitString(toStringValue(n1));
    return setTrickModel('');
  }

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

  void addIntOption() {
    optionList = [];
    optionList.add(toStringValue((int.parse(answer) + 4)));
    optionList.add(toStringValue((int.parse(answer) + 3)));
    optionList.add(toStringValue((int.parse(answer) - 2)));
    optionList.add(toStringValue((int.parse(answer))));
  }

  double getFormatValue2(double answer1) {
    return answer1.toPrecision(2);
  }

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

  int getRandomNumber(int max, int min) {
    return new math.Random().nextInt(max - min) + min;
  }

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
