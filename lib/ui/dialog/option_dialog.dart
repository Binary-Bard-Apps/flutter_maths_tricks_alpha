import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color_scheme.dart';

class OptionDialog extends StatelessWidget {
  final Color color;

  OptionDialog({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 350.h;
    var circle = 115.h;
    var margin = horSpace;
    var radius = 20.r;

    return Center(
      child: Container(
        height: appBarHeight,
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: (margin)),
        child: Stack(
          children: [
            SizedBox(
              height: appBarHeight,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                primary: false,
                appBar: AppBar(
                  bottomOpacity: 0.0,
                  title: const Text(''),
                  toolbarHeight: 0,
                  elevation: 0,
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Container(
                    width: (circle),
                    height: (circle),
                    decoration: BoxDecoration(
                        color: getBackgroundColor(context),
                        shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: getSvgIcon(
                      icon: 'hint.svg',
                      color: color,
                      height: 50,
                      width: 50,
                    )),
                bottomNavigationBar: Container(
                  height: (appBarHeight),
                  decoration: getDefaultDecoration(
                      radius: radius,
                      shadow: false,
                      bgColor: Colors.transparent),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                    child: BottomAppBar(
                      color: getBackgroundColor(context),
                      elevation: 0,
                      shape: CircularNotchedRectangle(),
                      notchMargin: (7),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 20.h),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: getCloseIcon(
                                  color: color,
                                  function: () {
                                    Navigator.of(context).pop(null);
                                  }),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                getCommonButton(
                                  title: 'Hint',
                                  function: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  verSpace: 0,
                                  color: color,
                                ),
                                25.verticalSpace,
                                getCommonHintButton(
                                    title: 'Solution',
                                    function: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    verSpace: 0,
                                    color: color),
                                40.verticalSpace
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
