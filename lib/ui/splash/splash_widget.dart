import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/app/key_util.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_maths_tricks/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../common/common.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<SplashWidget> createState() => _SplashWidget();
}

class _SplashWidget extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    Future.delayed(
      Duration(seconds: 3),
      () => Get.toNamed(KeyUtil.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    setScreenSize(
      context,
    );
    return Semantics(
      label: "Splash Screen",
      child: Scaffold(
        appBar: getNoneAppBar(context, color: Colors.white),
        backgroundColor: getBackgroundColor(context),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('${assetPath}mask_group.png',
                      height: 400.h, width: double.infinity, fit: BoxFit.fill),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        '${assetPath}splash.svg',
                        height: 130.h,
                      ),
                      15.verticalSpace,
                      getCustomFont('Math Tricks', 30, Colors.black, 2,
                          fontWeight: FontWeight.w600, font: 'RedRose'),
                      5.verticalSpace,
                      getCustomFont('By Ankit Kumar', 20, Colors.black, 2,
                          fontWeight: FontWeight.w400, font: 'RedRose')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
