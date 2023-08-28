// settings_controller.dart
import 'dart:ui';

import 'package:flutter_maths_tricks/app/pref_data.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';

class SettingController extends GetxController {
  RxBool isSound = true.obs;
  RxBool isVibration = true.obs;

  // Add this function to save the selected language
  Future<void> saveSelectedLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
  }

  // Add this function to load the saved language
  Future<String?> loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedLanguage');
  }

  String selectedLanguage = 'Select Language'; // Default language

  void onLanguageChange(String newValue) {
    selectedLanguage = newValue;
    if (newValue == 'English') {
      Get.updateLocale(Locale('en', ''));
    } else if (newValue == 'Hindi') {
      Get.updateLocale(Locale('hi', ''));
    } else if (newValue == 'Bengali') {
      Get.updateLocale(
          Locale('bn', '')); // Make sure you have the correct language code
    }
    saveSelectedLanguage(newValue); // Save the selected language
    update();
  }

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
