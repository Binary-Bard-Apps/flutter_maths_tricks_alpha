import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/ads/AdsFile.dart';
import 'package:flutter_maths_tricks/model/data_model.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_maths_tricks/ui/result/result_button_widget.dart';
import 'package:flutter_maths_tricks/ui/result/result_data_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tuple/tuple.dart';

import '../../app/key_util.dart';
import '../../data/hive_data.dart';
import '../../model/color_model.dart';
import '../../model/dummy_model.dart';
import '../../theme/svg_modify.dart';
import '../../utils/util.dart';
import '../common/common.dart';

class ResultPage extends StatefulWidget {
  final Tuple2<DummyModel, ColorModel> colorTuple;

  ResultPage({required this.colorTuple});

  @override
  State<StatefulWidget> createState() {
    return _ResultPage();
  }
}

class _ResultPage extends State<ResultPage> with TickerProviderStateMixin {
  onBack() {
    disposeInterstitialAd(adsFile);
    Get.back();
  }

  AdsFile? adsFile;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      adsFile = new AdsFile(context);
      adsFile!.createInterstitialAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    DummyModel dummyModel = widget.colorTuple.item1;
    DataModel dataModel = dummyModel.dataModel!;
    ColorModel color = widget.colorTuple.item2;
    Color darkColor = color.darkColor;

    return WillPopScope(
        child: Scaffold(
          appBar: getNoneAppBar(context, color: getBackgroundColor(context)),
          body: SafeArea(
            child: Column(
              children: [
                getCommonAppBar(
                    context: context,
                    function: () {
                      onBack();
                    },
                    title: dummyModel.subTitle!,
                    color: color.darkColor),
                80.verticalSpace,
                Expanded(
                    child: Column(
                  children: [
                    ResultDataWidget(color: color, dummyModel: dummyModel),
                    40.verticalSpace,
                    getCustomFont('Score: ${dataModel.score!}', 20,
                        getFontColor(context), 1,
                        fontWeight: FontWeight.w700),
                    15.verticalSpace,
                    getCustomFont('Best Score: ${dataModel.highScore!}', 20,
                        getFontColor(context), 1,
                        fontWeight: FontWeight.w700),
                    30.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 3; i++)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Image.asset(
                              (dataModel.progress! - 1) < (i)
                                  ? '${assetPath}star.png'
                                  : '${assetPath}fill_star.png',
                              height: 60.h,
                              width: 60.h,
                            ),
                          )
                      ],
                    ),
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResultButtonWidget(
                        icon: SvgModify.retrySvg(darkColor, isWhite: true),
                        function: () {
                          showInterstitialAd(adsFile, () {
                            Get.offNamed(KeyUtil.quizPage,
                                arguments: Tuple2(dummyModel, color));
                          });
                        }),
                    25.horizontalSpace,
                    ResultButtonWidget(
                        icon: SvgModify.shareSvg(darkColor, isWhite: true),
                        function: () {
                          share();
                        }),
                    25.horizontalSpace,
                    ResultButtonWidget(
                        icon: SvgModify.homeSvg(darkColor, isWhite: true),
                        function: () {
                          Get.offNamed(KeyUtil.home);
                        }),
                  ],
                ),
                30.verticalSpace,
                getCommonButton(
                    title: dataModel.level_no! < TOTAL_LEVEL_SIZE
                        ? 'Next'
                        : 'Done',
                    function: () {
                      if (dataModel.level_no! < TOTAL_LEVEL_SIZE) {
                        nextLevel(dummyModel, dataModel.level_no!, color);
                      } else {
                        onBack();
                      }
                    },
                    color: darkColor)
              ],
            ),
          ),
        ),
        onWillPop: () async {
          onBack();
          return false;
        });
  }

  nextLevel(DummyModel dummyModel, int levelNo, ColorModel color) async {
    String key =
        '${HiveData.getKey(dummyModel.categoryId, dummyModel.formulaId)}';

    var box = await Hive.box(HiveData.progressBox);

    var data = box.get('${key}_${(levelNo + 1)}');

    if (data != null) {
      DataModel dataModel = new DataModel.fromJson(jsonDecode(data));
      dummyModel.levelNo = dataModel.level_no!;
      dummyModel.dataModel = dataModel;

      Get.offNamed(KeyUtil.quizPage, arguments: Tuple2(dummyModel, color));
    }
  }
}
