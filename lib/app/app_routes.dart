import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_tricks/model/dummy_model.dart';
import 'package:flutter_maths_tricks/ui/home/home_page.dart';
import 'package:flutter_maths_tricks/ui/image_widget.dart';
import 'package:flutter_maths_tricks/ui/level/level_widget.dart';
import 'package:flutter_maths_tricks/ui/quiz/quiz_widget.dart';
import 'package:flutter_maths_tricks/ui/reminder/reminder_page.dart';
import 'package:flutter_maths_tricks/ui/result/result_widget.dart';
import 'package:flutter_maths_tricks/ui/setting/feedback_screen.dart';
import 'package:flutter_maths_tricks/ui/setting/setting_widget.dart';
import 'package:flutter_maths_tricks/ui/splash/splash_widget.dart';
import 'package:tuple/tuple.dart';

import '../model/color_model.dart';
import '../ui/subcategory/sub_category_page.dart';
import 'key_util.dart';

var appRoutes = {
  KeyUtil.splash: (context) => SplashWidget(),
  KeyUtil.home: (context) => HomePage(),
  KeyUtil.subCategory: (context) => SubCategoryPage(
      colorTuple: ModalRoute.of(context)?.settings.arguments
          as Tuple2<ColorModel, int>),
  KeyUtil.imagePage: (context) => ImageWidget(
      colorTuple: ModalRoute.of(context)?.settings.arguments
          as Tuple2<DummyModel, ColorModel>),
  KeyUtil.levelPage: (context) => LevelWidget(
      colorTuple: ModalRoute.of(context)?.settings.arguments
          as Tuple2<DummyModel, ColorModel>),
  KeyUtil.quizPage: (context) => QuizPage(
      colorTuple: ModalRoute.of(context)?.settings.arguments
          as Tuple2<DummyModel, ColorModel>),
  KeyUtil.resultPage: (context) => ResultPage(
      colorTuple: ModalRoute.of(context)?.settings.arguments
          as Tuple2<DummyModel, ColorModel>),
  KeyUtil.settingPage: (context) => SettingPage(),
  KeyUtil.feedbackPage: (context) => FeedbackScreen(),
  KeyUtil.reminderPage: (context) => ReminderPage(),
};
