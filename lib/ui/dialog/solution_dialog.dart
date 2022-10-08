import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/model/dummy_model.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_maths_tricks/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../data/data_file.dart';
import '../../data/database_helper.dart';
import '../../theme/color_scheme.dart';

class SolutionDialog extends StatelessWidget {
  final Color color;
  final DummyModel dummyModel;

  SolutionDialog({
    required this.color,
    required this.dummyModel,
  });
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    var margin = horSpace;

    return Container(
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: (margin)),
        padding: EdgeInsets.symmetric(vertical: margin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getCustomFont('Solution', 22, getFontColor(context), 1,
                fontWeight: FontWeight.w700),
            Container(
              child: HtmlWidget(
                  decode(DataFile.getTrickRulesSolution()[
                      dummyModel.formulaId - 1]),
                  textStyle: TextStyle(
                    color: color,
                  )),
              margin: EdgeInsets.only(top: 40.h),
            ),
            50.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: getCommonBorderButton(
                      title: 'Cancel',
                      function: () {
                        Navigator.of(context).pop();
                      },
                      verSpace: 0,
                      hSpace: 0,
                      color: color),
                  flex: 1,
                ),
                horSpace.horizontalSpace,
                Expanded(
                  child: getCommonButton(
                      title: 'Ok',
                      function: () {
                        Navigator.of(context).pop();
                      },
                      verSpace: 0,
                      hSpace: 0,
                      color: color),
                  flex: 1,
                ),
              ],
            ),
            8.verticalSpace
          ],
        ));
  }
}
