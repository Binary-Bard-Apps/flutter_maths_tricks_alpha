import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/ads/AdsFile.dart';
import 'package:flutter_maths_tricks/model/dummy_model.dart';
import 'package:flutter_maths_tricks/model/trick_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tuple/tuple.dart';

import '../app/key_util.dart';
import '../data/data_file.dart';
import '../data/hive_data.dart';
import '../data/method.dart';
import '../model/color_model.dart';
import '../controller/timer_provider.dart';
import '../sound/audio_file.dart';
import '../ui/common/common.dart';
import '../ui/dialog/game_over_dialog.dart';
import '../ui/dialog/option_dialog.dart';
import '../ui/dialog/hint_dialog.dart';
import '../ui/dialog/solution_dialog.dart';
import '../utils/util.dart';

int quizTime = 30;
int skipped = 1;
int correct = 2;
int wrongType = 3;
int optionView = 1;
int keyboardView = 2;
int trueFalseView = 3;

class QuizProvider extends TimeProvider with WidgetsBindingObserver {
  var quizModel = TrickModel().obs;

  List<TrickModel> list = [];
  int position = 0;
  ColorModel color;
  DummyModel dummyModel;
  BuildContext context;
  RxInt type = optionView.obs;

  RxBool isLoading = false.obs;
  RxBool isOpenDialog = false.obs;
  RxInt levelNo = 1.obs;
  RxInt live = 3.obs;
  AdsFile? adsFile;

  TextEditingController textEditingController = TextEditingController();
  AudioPlayer? audioPlayer;
  QuizProvider({
    required this.dummyModel,
    required this.context,
    required this.color,
  }) : super(totalTime: quizTime) {
    adsFile = new AdsFile(context);
    adsFile!.createRewardedAd();
    isLoading(false);
    audioPlayer = new AudioPlayer(context);

    levelNo(dummyModel.levelNo);
    setQuizData();
  }

  void timeOver() {
    nextQuiz();
  }

  Future<List<TrickModel>> getQuizList() async {
    List<TrickModel> quizList = [];
    for (int i = 0; i < DEFAULT_QUESTION; i++) {
      TrickModel trickModel =
          Method().getDataFromId(dummyModel.formulaId, dummyModel.levelNo);
      debugPrint("The current formula id is ");
      print(dummyModel.formulaId);
      debugPrint("The current level is");
      print(dummyModel.levelNo);
      quizList.add(trickModel);
    }

    return quizList;
  }

  setQuizData() async {
    list = [];

    await getQuizList().then((value) {
      list = value;
      print("list===${list.length}");

      isLoading(true);
      if (list.length > 0) {
        quizModel(list[position]);
        update();
        startTimer();
        WidgetsBinding.instance.addObserver(this);
      }
    });
  }

  setAnswer(int index) {
    update();
  }

  int right = 0;
  int skip = 0;
  int wrong = 0;
  int score = 0;

  submitAnswer(String answer, bool isTrueFalse) {
    textEditingController.text = '';
    bool isRight = false;
    if (isTrueFalse) {
      bool isDummy = quizModel.value.dummyAnswer == quizModel.value.answer;

      String trueAnswer;
      if (isDummy) {
        trueAnswer = '1';
      } else {
        trueAnswer = '0';
      }
      isRight = trueAnswer == answer;
    } else {
      isRight = answer == quizModel.value.answer;
    }

    if (isRight) {
      audioPlayer!.playRightSound();
      right = right + 1;
      addCoin(10);
    } else {
      audioPlayer!.playWrongSound();
      wrong = wrong + 1;
      minusCoin(5);
      live(live.value - 1);
    }

    if (live.value == 0) {
      showGameOverDialog();
    }
    if (live.value == -1) {
      nextQuiz(isDone: true);
    } else {
      nextQuiz();
    }
  }

  showGameOverDialog() {
    isOpenDialog(true);
    cancelTimer();
    showCommonBottomSheetDialog(
        widget: GameOverDialog(color: color.darkColor),
        context: context,
        function: (value) {
          print("value===$value");

          if (value) {
            showRewardedAd(adsFile, () {
              live.value = -1;
              nextQuiz();
            }, function1: () {
              nextQuiz(isDone: true);
            });
          } else {
            isOpenDialog(false);
            nextQuiz(isDone: true);
          }
        });
  }

  bool isCoinsAvailable(int useCoin) {
    return coin >= useCoin && (coin - useCoin) >= 0;
  }

  openDialog() {
    cancelTimer();
    isOpenDialog(true);
    showCommonDialog(
        widget: OptionDialog(
          color: color.darkColor,
        ),
        context: context,
        function: (value) {
          if (value != null) {
            if (!value && !isCoinsAvailable(HINT_COIN)) {
              showToast('Coin not available', context);
              isOpenDialog(false);
              resumeTimer();
              return;
            }

            if (!value &&
                DataFile.getTrickRulesSolution()[dummyModel.formulaId - 1]
                    .isEmpty) {
              showToast('Solution not available', context);
              isOpenDialog(false);
              resumeTimer();
            } else {
              if (!value) {
                minusCoin(HINT_COIN);
              }

              showCommonBottomSheetDialog(
                  function: () {
                    isOpenDialog(false);
                    resumeTimer();
                  },
                  context: context,
                  widget: value
                      ? HintDialog(
                          color: color.darkColor,
                          dummyModel: dummyModel,
                        )
                      : SolutionDialog(
                          color: color.darkColor,
                          dummyModel: dummyModel,
                        ));
            }
          } else {
            isOpenDialog(false);
            resumeTimer();
          }
        });
  }

  changeView() {
    textEditingController.text = '';

    if (type.value == optionView) {
      type(keyboardView);
    } else if (type.value == keyboardView) {
      type(trueFalseView);
    } else {
      type(optionView);
    }

    print("click===true");
    update();
  }

  enterAnswer(String e) {
    String text = textEditingController.text;

    if (text.isEmpty && text.length <= 0) {
      if (e == "-" || e == ".") {
        textEditingController.text = text + e;
      } else {
        if (isNumeric(text + e)) {
          textEditingController.text = text + e;
        }
      }
    } else {
      if (isNumeric(text + e)) {
        textEditingController.text = text + e;
      }
    }
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  backAnswer() {
    String result = textEditingController.text;

    if (result.length > 0) {
      result = result.substring(0, result.length - 1);
      textEditingController.text = result;
    }
  }

  nextQuiz({bool? isDone}) {
    isOpenDialog(false);
    cancelTimer();
    if (isDone == null) {
      if (position < (list.length - 1)) {
        startTimer();
        position++;
        quizModel(list[position]);
        score = score + getPlusScore(currentTime.value);
        print("value====true");
        update();
      } else {
        doneQuiz();
      }
    } else {
      doneQuiz();
    }
  }

  int getPlusScore(int countTime) {
    if (countTime < 30 && countTime >= 25) {
      return 500;
    } else if (countTime < 25 && countTime >= 15) {
      return 400;
    } else if (countTime < 15 && countTime >= 5) {
      return 250;
    } else {
      return 100;
    }
  }

  removeObserver() {
    WidgetsBinding.instance.removeObserver(this);
  }

  addData() async {
    var box = await Hive.openBox(HiveData.progressBox);
    String key = HiveData.getKey(dummyModel.categoryId, dummyModel.formulaId);

    var progress = box.get(key);

    List<dynamic> list = jsonDecode(progress.toString());

    list.forEach((v) {});
  }

  doneQuiz() async {
    cancelTimer();
    removeObserver();

    String key = HiveData.getKey(dummyModel.categoryId, dummyModel.formulaId);

    var box = await Hive.box(HiveData.progressBox);

    int highScore = dummyModel.dataModel!.highScore!;

    if (highScore < score) {
      highScore = score;
    }

    dummyModel.dataModel!.score = score;
    dummyModel.dataModel!.highScore = highScore;

    double percentageProgress = (right * 100) / DEFAULT_QUESTION;
    dummyModel.dataModel!.progress = getStarCount(percentageProgress.toInt());

    box.put('${key}_${dummyModel.dataModel!.level_no}',
        dummyModel.dataModel!.toJson().toString());

    dummyModel.right = right;
    dummyModel.wrong = wrong;
    dummyModel.coin = coin;

    Future.delayed(Duration(microseconds: 250), () {
      Get.offNamed(KeyUtil.resultPage, arguments: Tuple2(dummyModel, color));
    });
  }

  int getStarCount(int progress) {
    if (progress == 0) {
      return 0;
    } else {
      if (progress < 50) {
        return 1;
      } else if (progress < 90 && progress > 50) {
        return 2;
      } else {
        return 3;
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (!isOpenDialog.value) {
          resumeTimer();
          update();
        }
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        pauseTimer();
        update();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }
}
