

import 'dart:io';

import 'package:flutter/services.dart';

void exitApp() {
  if (Platform.isIOS) {
    exit(0);
  } else {
    SystemNavigator.pop();
  }
}