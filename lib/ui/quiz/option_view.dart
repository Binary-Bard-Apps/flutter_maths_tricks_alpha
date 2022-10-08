import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/color_model.dart';
import '../common/common.dart';

class OptionView extends StatelessWidget {
  final ColorModel color;
  final List<String> list;
  final Function function;

  OptionView({required this.color, required this.list, required this.function});

  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = 2;
    double height = MediaQuery.of(context).size.width / 3.5;

    double _crossAxisSpacing = 30.h;
    var widthItem = (MediaQuery.of(context).size.width -
            ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;

    double _aspectRatio = widthItem / height;

    return Center(
      child: GridView.count(
        crossAxisCount: _crossAxisCount,
        childAspectRatio: _aspectRatio,
        shrinkWrap: true,
        crossAxisSpacing: _crossAxisSpacing,
        mainAxisSpacing: 30.h,
        primary: false,
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
        children: List.generate(list.length, (index) {
          return InkWell(
            child: Container(
              height: height,
              decoration:
                  getGradientDecoration(color: color.colorList, radius: 20.r),
              child: Stack(
                children: [
                  Center(
                    child: getCustomFont(list[index], 30, Colors.white, 1,
                        fontWeight: FontWeight.w700),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Transform.translate(
                          offset: Offset(-constraints.maxHeight / 10, 38),
                          child: getCustomFont(
                              list[index], 75, Colors.white10, 1,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.end),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              function(list[index]);
            },
          );
        }),
      ),
    );
  }
}
