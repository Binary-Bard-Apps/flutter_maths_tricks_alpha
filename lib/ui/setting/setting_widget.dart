import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/app/key_util.dart';
import 'package:flutter_maths_tricks/main.dart';
import 'package:flutter_maths_tricks/model/color_model.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/setting_controller.dart';
import '../../utils/util.dart';
import '../common/common.dart';
import '../dialog/rate_dialog.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingPage();
  }
}

class _SettingPage extends State<SettingPage> with TickerProviderStateMixin {
  onBack() {
    Get.back();
  }

  SettingController settingController = Get.put(SettingController());

  ColorModel tuple3 = getRandomColor(0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Semantics(
          label: 'Setting Screen',
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
                      title: 'Setting',
                      isSetting: true,
                      color: tuple3.darkColor),
                  50.verticalSpace,
                  Expanded(
                      child: ListView(
                    children: [
                      Obx(() {
                        return getSwitchItem(
                            context: context,
                            function: (value) {
                              settingController.changeSoundValue(value);
                            },
                            title: 'Sound',
                            value: settingController.isSound.value);
                      }),
                      Obx(() {
                        return getSwitchItem(
                            context: context,
                            function: (value) {
                              settingController.changeVibrationValue(value);
                            },
                            title: 'Vibration',
                            value: settingController.isVibration.value);
                      }),
                      getSwitchItem(
                          context: context,
                          function: (value) {
                            themeController.changeTheme();
                          },
                          title: 'Night Mode',
                          value: themeController.isDarkTheme),
                      getItem(
                        context: context,
                        function: () {
                          Get.toNamed(KeyUtil.reminderPage);
                        },
                        title: 'Reminder',
                      ),
                      getItem(
                        context: context,
                        function: () {
                          launchURL();
                        },
                        title: 'Privacy Policy',
                      ),
                      getItem(
                        context: context,
                        function: () {
                          share();
                        },
                        title: 'Share',
                      ),
                      getItem(
                        context: context,
                        function: () {
                          showCommonDialog(
                              widget: RateViewDialog(), context: context);
                        },
                        title: 'Rate us',
                      ),
                      getItem(
                        context: context,
                        function: () {
                          Get.toNamed(KeyUtil.feedbackPage);
                        },
                        title: 'Feedback',
                      ),
                      getItem(
                        context: context,
                        function: () {
                          developerLaunchURL();
                        },
                        title: 'Contact Developer',
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          onBack();
          return false;
        });
  }

  getItem({
    required BuildContext context,
    required Function function,
    required String title,
  }) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h, right: horSpace, left: horSpace),
        height: 75.h,
        decoration: getDefaultDecoration(
            radius: 15.r,
            bgColor: themeController.isDarkTheme
                ? getCardColor(context)
                : getRandomColor(0).alphaColor),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Expanded(
              child: getText(title),
              flex: 1,
            ),
            getSvgIcon(
                icon: 'next.svg', height: 30, color: getFontColor(context))
          ],
        ),
      ),
    );
  }

  getText(String title) {
    return getCustomFont(title, 15, getFontColor(context), 1,
        fontWeight: FontWeight.w600);
  }

  getSwitchItem({
    required BuildContext context,
    required Function function,
    required String title,
    required bool value,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, right: horSpace, left: horSpace),
      height: 75.h,
      decoration: getDefaultDecoration(
          radius: 15.r,
          bgColor: themeController.isDarkTheme
              ? getCardColor(context)
              : getRandomColor(0).alphaColor),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
            child: getText(title),
            flex: 1,
          ),
          Container(
            child: CupertinoSwitch(
              activeColor: tuple3.darkColor,
              value: value,
              onChanged: (bool v) {
                function(v);
              },
            ),
          ),
        ],
      ),
    );
  }
}
