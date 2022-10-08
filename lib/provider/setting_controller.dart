import 'package:flutter_maths_tricks/app/pref_data.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool isSound = true.obs;
  RxBool isVibration = true.obs;

  @override
  void onInit() {
    setData();
    super.onInit();
  }

  Future<void> setData() async {
    bool sound = await getSound();
    isSound(sound);
  }

  void changeSoundValue(bool value) async {
    setSound(value);
    isSound(value);
  }

  void changeVibrationValue(bool value) async {
    setVibration(value);
    isVibration(value);
  }
}
