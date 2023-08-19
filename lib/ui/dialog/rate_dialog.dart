import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/app/key_util.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';

import '../../utils/util.dart';

class RateViewDialog extends StatelessWidget {
  const RateViewDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double starSize = 50.h;
    double radius = 20.r;

    double width = 370.w;
    double rate = 0;
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: 0.0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: getDefaultDecoration(
              radius: radius, bgColor: getCardColor(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(assetPath + "rate.png"),
                ),
              ),
              getTextWidget("Give Your Opinion", 20, getFontColor(context),
                  fontWeight: FontWeight.w700, textAlign: TextAlign.center),
              10.verticalSpace,
              getTextWidget(
                  "Make better math goal for you,and would love to know how would rate our app?",
                  15,
                  getFontColor(context),
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center),
              50.verticalSpace,
              RatingBar(
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 7.w),
                  allowHalfRating: false,
                  itemSize: starSize,
                  initialRating: 0,
                  updateOnDrag: true,
                  glowColor: Theme.of(context).scaffoldBackgroundColor,
                  ratingWidget: RatingWidget(
                    full: getSvgImageWithSize(
                        context, "star_fill.svg", starSize, starSize),
                    empty: getSvgImageWithSize(
                        context, "star.svg", starSize, starSize),
                    half: getSvgImageWithSize(
                        context, "star_fill.svg", starSize, starSize),
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      rate = rating;
                    });
                  }),
              40.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: getCommonBorderButton(
                          title: "Cancel",
                          function: () {
                            Navigator.pop(context);
                          },
                          color: getFontColor(context),
                          hSpace: 0,
                          verSpace: 0)),
                  horSpace.horizontalSpace,
                  Expanded(
                      child: getCommonButton(
                          title: "Submit",
                          function: () {
                            Navigator.pop(context);
                            if (rate >= 4) {
                              LaunchReview.launch();
                            } else {
                              Get.toNamed(KeyUtil.feedbackPage);
                            }
                          },
                          color: getPrimaryColor(context),
                          hSpace: 0,
                          verSpace: 0))
                ],
              ),
              10.verticalSpace,
            ],
          ),
        ),
      );
    });
  }
}
