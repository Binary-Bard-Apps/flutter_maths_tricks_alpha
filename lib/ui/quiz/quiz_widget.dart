import 'package:flutter/material.dart';

import 'package:flutter_maths_tricks/controller/quiz_provider.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_maths_tricks/ui/dialog/quiz_exit_dialog.dart';

import 'package:flutter_maths_tricks/ui/quiz/answer_view.dart';
import 'package:flutter_maths_tricks/ui/quiz/hint_button_widget.dart';
import 'package:flutter_maths_tricks/ui/quiz/quiz_data_widget.dart';
import 'package:flutter_maths_tricks/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../model/color_model.dart';
import '../../model/dummy_model.dart';
import '../common/common.dart';

class QuizPage extends StatefulWidget {
  final Tuple2<DummyModel, ColorModel> colorTuple;

  QuizPage({required this.colorTuple});

  @override
  State<StatefulWidget> createState() {
    return _QuizPage();
  }
}

class _QuizPage extends State<QuizPage> with TickerProviderStateMixin {
  onBack(QuizProvider quizProvider) {
    print("onBak===truw");

    quizProvider.cancelTimer();

    showCommonBottomSheetDialog(
        widget: QuizExitDialog(color: widget.colorTuple.item2.darkColor),
        context: context,
        function: (value) {
          if (value) {
            quizProvider.resumeTimer();
          } else {
            quizProvider.cancelTimer();
            quizProvider.removeObserver();
            Get.delete<QuizProvider>();
            Get.back();
          }
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DummyModel dummyModel = widget.colorTuple.item1;
    ColorModel color = widget.colorTuple.item2;

    return GetX<QuizProvider>(
      init:
          QuizProvider(dummyModel: dummyModel, context: context, color: color),
      builder: (quizProvider) {
        if ((quizProvider.isLoading.value)) {
          return WillPopScope(
              child: Scaffold(
                appBar:
                    getNoneAppBar(context, color: getBackgroundColor(context)),
                body: SafeArea(
                  child: Column(
                    children: [
                      getCommonAppBar(
                          context: context,
                          function: () {
                            onBack(quizProvider);
                          },
                          title: dummyModel.subTitle!,
                          color: color.mainColor),
                      80.verticalSpace,
                      Expanded(
                        child: Column(
                          children: [
                            QuizDataWidget(
                              color: color,
                              quizProvider: quizProvider,
                            ),
                            20.verticalSpace,
                            Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: horSpace),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HintButtonWidget(
                                      icon: 'hint.svg',
                                      color: color.darkColor,
                                      function: () {
                                        quizProvider.openDialog();
                                      }),
                                  HintButtonWidget(
                                      icon: 'keyboard.svg',
                                      color: color.darkColor,
                                      function: () {
                                        quizProvider.changeView();
                                      }),
                                ],
                              ),
                            ),
                            30.verticalSpace,
                            Container(
                              height: 30.sp,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  getCustomFont(
                                      getQuestionType(
                                          quizProvider,
                                          quizProvider
                                              .quizModel.value.question),
                                      28,
                                      getFontColor(context),
                                      1,
                                      fontWeight: FontWeight.w700,
                                      textAlign: TextAlign.end),
                                  Visibility(
                                    child: 10.horizontalSpace,
                                    visible:
                                        quizProvider.type.value == keyboardView,
                                  ),
                                  Visibility(
                                    child: Flexible(
                                      child: commonTextFiled(
                                          quizProvider.textEditingController,
                                          context, (value) {
                                        // quizProvider.submitAnswer(value, false);
                                      }),
                                    ),
                                    visible:
                                        quizProvider.type.value == keyboardView,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: AnswerView(
                                  quizProvider: quizProvider,
                                  color: color,
                                  list: quizProvider.quizModel.value.optionList,
                                  function: (answer) {
                                    quizProvider.submitAnswer(
                                        answer,
                                        quizProvider.type.value ==
                                            trueFalseView);
                                  },
                                  type: quizProvider.type.value),
                              flex: 1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onWillPop: () async {
                onBack(quizProvider);
                return false;
              });
        } else {
          return getProgressDialog(context);
        }
      },
    );
  }

  getQuestionType(QuizProvider quizProvider, String question) {
    print("type===${quizProvider.type}");
    if (quizProvider.type == trueFalseView) {
      return '${decode(question)} ${quizProvider.quizModel.value.dummyAnswer}';
    } else if (quizProvider.type == optionView) {
      return '${decode(question)} ?';
    } else {
      return '${decode(question)}';
    }
  }
}
