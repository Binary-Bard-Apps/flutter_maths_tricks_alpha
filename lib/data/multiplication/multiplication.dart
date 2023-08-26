import 'package:flutter_maths_tricks/data/methods/method.dart';
import 'package:flutter_maths_tricks/model/trick_model.dart';
import 'dart:math' as math;

class MultiplicationMethod extends Method {
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
}
