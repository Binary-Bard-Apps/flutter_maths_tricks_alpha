import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/app/app_store.dart';
import 'package:flutter_maths_tricks/data/data_file.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_maths_tricks/ui/home/home_item.dart';

import '../common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    setScreenSize(
      context,
    );

    return WillPopScope(
        child: Scaffold(
          appBar: getNoneAppBar(context, color: getAlphaPrimaryColor(context)),
          body: SafeArea(
            child: Stack(
              children: [
                getCommonHeader(context,
                    widget: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(children: [
                                SizedBox(
                                  child: getHeaderTitleOne("Math", context),
                                  // flex: 1,
                                ),
                                SizedBox(
                                  child: getHeaderTitleTwo(" Matics", context),
                                  // flex: 1,
                                ),
                              ]),
                            ),
                            getSettingIcon(context),
                          ],
                        ),
                        10.verticalSpace,
                        getCustomFont(
                            'Learn Basic Math : Arithmetic Operations',
                            14,
                            Colors.white,
                            2,
                            fontWeight: FontWeight.w300)
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 132.h),
                  child: ListView.builder(
                    itemCount: DataFile.getCategoryList().length,
                    itemBuilder: (context, index) {
                      return HomeItem(index: index);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          exitApp();
          return false;
        });
  }
}
