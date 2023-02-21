import 'package:flutter/material.dart';
import 'package:flutter_maths_tricks/model/dummy_model.dart';
import 'package:flutter_maths_tricks/ui/common/common.dart';
import 'package:flutter_maths_tricks/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/database_helper.dart';
import '../../theme/color_scheme.dart';

class HintDialog extends StatelessWidget {
  final Color color;
  final DummyModel dummyModel;

  HintDialog({
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              getCustomFont('Hint', 22, getFontColor(context), 1,
                  fontWeight: FontWeight.w700),
              FutureBuilder<String?>(
                future: databaseHelper.getImageFromId(dummyModel.formulaId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return getProgressDialog(context);
                  } else if (!snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return Container();
                  } else if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return Image.asset('${assetTrickImages}${snapshot.data}');
                  }
                  return Container();
                },
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
          ),
        ));
  }
}
