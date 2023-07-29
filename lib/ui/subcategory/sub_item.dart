import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/app/key_util.dart';
import 'package:flutter_maths_tricks/model/dummy_model.dart';
import 'package:flutter_maths_tricks/model/sub_category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../data/data_file.dart';
import '../../model/color_model.dart';
import '../../theme/color_scheme.dart';
import '../../utils/util.dart';
import '../common/common.dart';

class SubItem extends StatelessWidget {
  final int index;
  final int mainIndex;
  final ColorModel color;
  SubItem({required this.index, required this.mainIndex, required this.color});

  @override
  Widget build(BuildContext context) {
    List<SubCategoryModel> list = DataFile.getSubList(mainIndex);

    return AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 375),
        child: SlideAnimation(
          verticalOffset: 50,
          child: FadeInAnimation(
            child: InkWell(
              onTap: () async {
                DummyModel dummyModel = new DummyModel();
                dummyModel.categoryId = mainIndex;
                dummyModel.formulaId = list[index].id;
                dummyModel.subTitle = list[index].title;
                dummyModel.title = DataFile.getCategoryList()[mainIndex].title;
                dummyModel.childPosition = index;

                Get.toNamed(KeyUtil.imagePage,
                    arguments: Tuple2(dummyModel, color));
              },
              child: Container(
                margin:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: horSpace),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  children: [
                    getCustomFont(
                        '${(index + 1)}', 13, getFontColor(context), 3,
                        fontWeight: FontWeight.w600),
                    15.horizontalSpace,
                    Expanded(
                        child: getCustomFont(decode(list[index].title), 13,
                            getFontColor(context), 3,
                            fontWeight: FontWeight.w600)),
                    getSvgIcon(
                        icon: 'next.svg',
                        height: 30,
                        color: getFontColor(context))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
