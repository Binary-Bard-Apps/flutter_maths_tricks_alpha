import 'package:flutter_maths_tricks/data/methods/method.dart';
import 'package:flutter_maths_tricks/model/trick_model.dart';
import 'package:flutter_maths_tricks/data/methods/common/common_methods.dart';

class AdditionMethod extends CommonMethods {
  // Addition
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
}
