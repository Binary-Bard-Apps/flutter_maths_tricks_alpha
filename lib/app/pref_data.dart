import 'package:shared_preferences/shared_preferences.dart';

import '../model/model_reminder.dart';

String pkgName = "math_trick_";

String sound = pkgName + "sound";
String reminderList = pkgName + "reminderList";
String addReminderKey = pkgName + "addReminderKey";
String vibration = pkgName + "vibration";
String notificationId = pkgName + "notificationId";

setId(int s) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(notificationId, s);
}

getId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(notificationId) ?? 5;
}

setSound(bool rem) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(sound, rem);
}

getSound() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool intValue = prefs.getBool(sound) ?? true;
  return intValue;
}

setVibration(bool rem) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(vibration, rem);
}

setAddReminder() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setBool(addReminderKey, false);
}

getAddReminder() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(addReminderKey) ?? true;
}

getVibration() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool intValue = prefs.getBool(vibration) ?? true;
  return intValue;
}

Future<List<ModelReminder>> getReminderList() async {
  String s = await getReminderArray();
  List<ModelReminder> historyModel = [];

  if (s.isNotEmpty) {
    historyModel = ModelReminder.decode(s);
    return historyModel;
  } else {
    return historyModel;
  }
}

setReminderArray(String s) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(reminderList, s);
}

getReminderArray() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(reminderList) ?? "";
}
