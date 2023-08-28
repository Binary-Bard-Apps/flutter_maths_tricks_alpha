import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../model/color_model.dart';
import '../../theme/color_scheme.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FeedbackScreen();
  }
}

class _FeedbackScreen extends State<FeedbackScreen> {
  void backClicks() {
    Get.back();
  }

  ValueNotifier darkMode = ValueNotifier(false);

  double rate = 0;
  @override
  void initState() {
    super.initState();

    getSpeakerVol();
  }

  getSpeakerVol() async {
    Future.delayed(Duration.zero, () {
      darkMode.value = Theme.of(context).brightness != Brightness.light;
    });
  }

  double fontTitleSize = 30;

  ColorModel tuple3 = getRandomColor(0);

  @override
  Widget build(BuildContext context) {
    int selection = 1;

    EdgeInsets edgeInsets = EdgeInsets.symmetric(horizontal: horSpace);
    double starSize = 60.h;

    return WillPopScope(
      child: Scaffold(
        appBar: getNoneAppBar(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCommonAppBar(
                  context: context,
                  function: () {
                    backClicks();
                  },
                  title: '',
                  isSetting: true,
                  color: tuple3.darkColor),
              buildExpandedData(edgeInsets, starSize, selection, context),
              getCommonButton(
                  title: 'Submit Feedback',
                  function: () async {
                    if (rate >= 3) {
                      String feedback = "";

                      if (feedbackController.value.text.isNotEmpty) {
                        feedback = feedbackController.text.toString();
                      }

                      final Email email = Email(
                          body: feedback,
                          subject: 'App Feedback',
                          isHTML: false,
                          recipients: ['ankit.k.j1999@gmail.com']);
                      await FlutterEmailSender.send(email);
                    }
                  })
            ],
          ),
        ),
      ),
      onWillPop: () async {
        backClicks();
        return false;
      },
    );
  }

  TextEditingController feedbackController = TextEditingController();

  Expanded buildExpandedData(EdgeInsets edgeInsets, double starSize,
      int selection, BuildContext context) {
    Color fontColor = Theme.of(context).textTheme.titleSmall!.color!;
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        primary: true,
        padding: edgeInsets,
        children: [
          20.verticalSpace,
          getCustomFont("Give Feedback", 25, fontColor, 1,
              fontWeight: FontWeight.w700),
          7.verticalSpace,
          getTextWidget("Give your feedback about our app", 16, fontColor,
              fontWeight: FontWeight.w400),
          60.verticalSpace,
          getCustomFont("Are you satisfied with this app?", 16, fontColor, 1,
              fontWeight: FontWeight.w500),
          30.verticalSpace,
          RatingBar(
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: (horSpace / 2)),
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
          70.verticalSpace,
          getCustomFont("Tell us what can be improved!", 16, fontColor, 1,
              fontWeight: FontWeight.w500),
          30.verticalSpace,
          getDefaultTextFiled(context, "Write your feedback...",
              feedbackController, fontColor, Colors.black,
              minLines: true)
        ],
      ),
      flex: 1,
    );
  }
}

// flutter build small app bundle release command
// flutter build appbundle --target-platform android-arm,android-arm64,android-x64 --split-per-abi
