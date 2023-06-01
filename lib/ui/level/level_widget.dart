import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/data/data_file.dart';
import 'package:flutter_maths_tricks/provider/level_controller.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_maths_tricks/ui/level/level_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../ads/AdsFile.dart';
import '../../model/color_model.dart';
import '../../model/dummy_model.dart';
import '../../utils/util.dart';
import '../common/common.dart';
import '../common/header_widget.dart';

class LevelWidget extends StatefulWidget {
  final Tuple2<DummyModel, ColorModel> colorTuple;

  LevelWidget({required this.colorTuple});

  @override
  State<StatefulWidget> createState() {
    return _LevelWidget();
  }
}

class _LevelWidget extends State<LevelWidget> with TickerProviderStateMixin {
  bool isLevelUnlocked = false; // Addone
  AnimationController? animationController;

  onBack() {
    disposeBannerAd(adsFile);
    Get.back();
  }

  AdsFile? adsFile;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();

    Future.delayed(Duration.zero, () {
      adsFile = new AdsFile(context);

      adsFile!.createAnchoredBanner(context, setState);
    });
  }

  @override
  Widget build(BuildContext context) {
    DummyModel dummyModel = widget.colorTuple.item1;
    ColorModel tuple3 = widget.colorTuple.item2;
    // Color color = widget.colorTuple.item2;
    LevelController levelController = Get.put(LevelController(dummyModel));

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
                    color: tuple3.darkColor),
                50.verticalSpace,
                Expanded(
                    child: HeaderWidget(
                        tuple3: tuple3,
                        icon: DataFile.getCategoryList()[dummyModel.categoryId]
                            .icon,
                        childWidget: Container(
                          height: double.infinity,
                          margin: EdgeInsets.only(top: 80.h),
                          child: Column(
                            children: [
                              getCustomFont('Total Level  =  $TOTAL_LEVEL_SIZE',
                                  25, Colors.white, 1,
                                  fontWeight: FontWeight.w700),
                              7.verticalSpace,
                              getCustomFont(
                                  'Total Question  =  ${TOTAL_LEVEL_SIZE * DEFAULT_QUESTION}',
                                  25,
                                  Colors.white,
                                  1,
                                  fontWeight: FontWeight.w700),
                              22.verticalSpace,
                              Expanded(
                                  child: Container(
                                height: double.infinity,
                                padding:
                                    EdgeInsets.symmetric(horizontal: horSpace),
                                decoration: getDefaultDecorationWithSide(
                                    bgColor: getCardColor(context),
                                    radius: 20.r,
                                    isTopLeft: true,
                                    isTopRight: true),
                                child: Obx(() {
                                  if (levelController.isLoading.value) {
                                    return getProgressDialog(context);
                                  } else {
                                    return LevelList(
                                      dummyModel: dummyModel,
                                      list: levelController.dataList,
                                      animationController: animationController!,
                                      color: tuple3,
                                      isLevelUnlocked:
                                          isLevelUnlocked, // Addone
                                    );
                                  }
                                }),
                              )),
                            ],
                          ),
                        ),
                        cardColor: lighten(tuple3.darkColor),
                        tag: dummyModel.categoryId.toString())),
                getBanner(context, adsFile)
              ],
            ),
          ),
        ),
        onWillPop: () async {
          onBack();
          return false;
        });
  }
}
