import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/app/key_util.dart';
import 'package:flutter_maths_tricks/model/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../data/data_file.dart';
import '../../model/color_model.dart';
import '../../theme/color_scheme.dart';
import '../common/common.dart';

class HomeItem extends StatelessWidget {
  final int index;
  HomeItem({required this.index});

  @override
  Widget build(BuildContext context) {
    CategoryModel categoryModel = DataFile.getCategoryList()[index];

    ColorModel tuple3 = getRandomColor(index);
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50,
        child: FadeInAnimation(
          child: InkWell(
            onTap: () async {
              Get.toNamed(KeyUtil.subCategory,
                  arguments: Tuple2(tuple3, index));
            },
            child: Container(
              margin: EdgeInsets.only(
                bottom: 23.h,
                right: horSpace,
                left: horSpace,
              ),
              height: 95.h,
              decoration: getDefaultDecoration(
                  isShadow: true,
                  shadowColor: getShadowColor(context),
                  radius: 18.r,
                  bgColor: getCardColor(context)),
              padding: EdgeInsets.all(10.h),
              child: Row(
                children: [
                  Hero(
                    child: Container(
                      height: (85.h),
                      width: (75.h),
                      decoration: getDefaultDecoration(
                          radius: 18.r, bgColor: tuple3.mainColor),
                      child: Center(
                        child: getSvgIcon(
                            icon: categoryModel.icon,
                            height: 22,
                            color: Colors.black,
                            isHomeIcon: true),
                      ),
                    ),
                    tag: '${index}',
                  ),
                  10.horizontalSpace,
                  Expanded(
                      child: getCustomFont(
                          categoryModel.title, 14, getFontColor(context), 1,
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
      ),
    );
  }
}
