import 'package:flutter_maths_tricks/data/hive_data.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CoinController extends GetxController {
  String coinKey = 'coinKey';
  int coin = 0;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    var box = await Hive.openBox(HiveData.coinBox);
    var coinData = box.get(coinKey);

    if (coinData == null) {
      box.put(coinKey, 0);
      coinData = box.get(coinKey);
    }

    coin = coinData;

    update();
  }

  addCoin(int updateCoin) async {
    var box = await Hive.openBox(HiveData.coinBox);
    box.put(coinKey, (coin + updateCoin));
    getData();
  }

  minusCoin(int updateCoin) async {
    var box = await Hive.openBox(HiveData.coinBox);

    print("coin====$coin === $updateCoin");

    if (coin - updateCoin >= 0) {
      box.put(coinKey, (coin - updateCoin));
    } else {
      box.put(coinKey, 0);
    }

    getData();
  }
}
