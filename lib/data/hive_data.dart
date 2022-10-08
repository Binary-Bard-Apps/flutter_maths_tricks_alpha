import 'package:flutter_maths_tricks/model/progress.dart';
import 'package:hive/hive.dart';

class HiveData {
  static String progressBox = 'ProgressBox';
  static String coinBox = 'CoinBox';

  static registerAdapter() {
    Hive.registerAdapter(ProgressAdapter());
  }
  static openAllBox() async {
    await Hive.openBox(HiveData.progressBox);
    await Hive.openBox(HiveData.coinBox);








  }


  static getKey(int categoryId, int formulaId) {
    return '${categoryId}_${formulaId}';
  }
}
