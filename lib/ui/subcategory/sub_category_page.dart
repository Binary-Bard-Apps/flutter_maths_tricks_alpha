import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/data/data_file.dart';
import 'package:flutter_maths_tricks/model/sub_category_model.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_maths_tricks/ui/subcategory/sub_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../model/color_model.dart';
import '../common/common.dart';
import '../common/header_widget.dart';

class SubCategoryPage extends StatefulWidget {
  final Tuple2<ColorModel, int> colorTuple;

  SubCategoryPage({required this.colorTuple});

  @override
  State<StatefulWidget> createState() {
    return _SubCategoryPage();
  }
}

class _SubCategoryPage extends State<SubCategoryPage> {
  onBack() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    setScreenSize(
      context,
    );
    int index = widget.colorTuple.item2;
    ColorModel color = widget.colorTuple.item1;

    List<SubCategoryModel> list = DataFile.getSubList(index);

    return WillPopScope(
        child: Scaffold(
          appBar: getNoneAppBar(context, color: getAlphaPrimaryColor(context)),
          body: SafeArea(
            child: Stack(
              children: [
                getCommonHeader(
                  context,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      getBackIcon(function: () {
                        onBack();
                      }),
                      15.horizontalSpace,
                      Expanded(
                        child: getHeaderTitle("Maths Tricks", context),
                        flex: 1,
                      ),
                      getSettingIcon(context),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 132.h),
                  child: HeaderWidget(
                      tuple3: color,
                      icon: DataFile.getCategoryList()[index].icon,
                      childWidget: Container(
                        height: double.infinity,
                        margin: EdgeInsets.only(top: 80.h),
                        child: Column(
                          children: [
                            getDivider(),
                            Expanded(
                                child: Container(
                                    child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return getDivider();
                              },
                              padding: EdgeInsets.zero,
                              itemCount: list.length,
                              itemBuilder: (context, i) {
                                return SubItem(
                                  index: i,
                                  mainIndex: index,
                                  color: color,
                                );
                              },
                            )))
                          ],
                        ),
                      ),
                      tag: index.toString(),
                      horSpace: horSpace),
                )
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
