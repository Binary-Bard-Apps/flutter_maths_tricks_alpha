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
  Future<void> saveSelectedLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', languageCode);
  }

// Add this function to load the saved language

  Future<String?> loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedLanguage');
  }

  // String selectedLanguage = 'English'; // Default language
  RxString selectedLanguage = 'en'.obs; // Use RxString for selected language

  void onLanguageChange(String newValue) {
    selectedLanguage.value = newValue; // Update the selected language

    saveSelectedLanguage(newValue);
    update();
  }

  @override
  void onInit() async {
    // Load saved language or set a default language
    final savedLanguage = await loadSelectedLanguage();
    if (savedLanguage != null) {
      selectedLanguage.value = savedLanguage;
    }

    setData();
    super.onInit();
  }

  // void onInit() {
  //   // Load saved language or set a default language
  //   loadSelectedLanguage();
  //   setData();
  //   super.onInit();
  // }

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
