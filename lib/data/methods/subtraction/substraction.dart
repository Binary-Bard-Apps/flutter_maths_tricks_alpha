import 'package:flutter_maths_tricks/data/methods/method.dart';
import 'package:flutter_maths_tricks/model/trick_model.dart';

class SubstractionMethod extends Method {
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
}
