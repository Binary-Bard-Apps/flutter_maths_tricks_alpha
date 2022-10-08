import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/app/key_util.dart';
import 'package:flutter_maths_tricks/data/data_file.dart';
import 'package:flutter_maths_tricks/data/database_helper.dart';
import 'package:flutter_maths_tricks/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../model/color_model.dart';
import '../model/dummy_model.dart';
import 'common/common.dart';

class ImageWidget extends StatefulWidget {
  final Tuple2<DummyModel, ColorModel> colorTuple;

  ImageWidget({required this.colorTuple});

  @override
  State<StatefulWidget> createState() {
    return _ImageWidget();
  }
}

class _ImageWidget extends State<ImageWidget> {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  onBack() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    DummyModel dummyModel = widget.colorTuple.item1;
    ColorModel color = widget.colorTuple.item2;

    print("formula====${dummyModel.formulaId - 1}");
    String data = DataFile.getTrickRulesSolution()[dummyModel.formulaId - 1];

    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: getNoneAppBar(context, color: Colors.white),
          body: SafeArea(
            child: Column(
              children: [
                getCommonAppBar1(
                    context: context,
                    function: () {
                      onBack();
                    },
                    title: dummyModel.subTitle!,
                    color: color.darkColor),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: horSpace),
                    children: [
                      data.isEmpty
                          ? Container()
                          : Container(
                              child: HtmlWidget(decode(data),
                                  textStyle: TextStyle(
                                      color: color.darkColor, fontSize: 18.sp)),
                              margin: EdgeInsets.only(top: horSpace),
                            ),
                      FutureBuilder<String?>(
                        future:
                            databaseHelper.getImageFromId(dummyModel.formulaId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return getProgressDialog(context);
                          } else if (!snapshot.hasData &&
                              snapshot.connectionState ==
                                  ConnectionState.done) {
                            return Container();
                          } else if (snapshot.hasData &&
                              snapshot.connectionState ==
                                  ConnectionState.done) {
                            return Container(
                              padding: EdgeInsets.all(25.h),
                              child: Center(
                                child: Image.asset(
                                    '${assetTrickImages}${snapshot.data}'),
                              ),
                            );
                          }
                          return Container();
                        },
                      )
                    ],
                  ),
                  flex: 1,
                ),
                getCommonButton(
                    title: 'Go',
                    function: () {
                      Get.toNamed(KeyUtil.levelPage,
                          arguments: widget.colorTuple);
                    },
                    color: color.darkColor)
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
