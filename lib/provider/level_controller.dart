import 'dart:convert';

import 'package:flutter_maths_tricks/data/hive_data.dart';
import 'package:flutter_maths_tricks/model/data_model.dart';
import 'package:flutter_maths_tricks/model/dummy_model.dart';
import 'package:flutter_maths_tricks/utils/util.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LevelController extends GetxController {
  RxBool isLoading = true.obs;
  DummyModel dummyModel;
  List<DataModel> dataList = [];

  LevelController(this.dummyModel);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    var box = await Hive.box(HiveData.progressBox);

    String key = HiveData.getKey(dummyModel.categoryId, dummyModel.formulaId);

    dataList = await getListData(box, key);

    print("list===${dataList.length}");
    if (dataList.length != TOTAL_LEVEL_SIZE) {
      await addData(box, key);
      dataList = await getListData(box, key);
    }
    print("list12===${dataList.length}");

    isLoading(false);
  }

  Future getListData(Box box, String key) async {
    List<DataModel> list = [];

    for (int i = 0; i < TOTAL_LEVEL_SIZE; i++) {
      int index = (i + 1);
      var progress = box.get('${key}_${index}');

      print("progress===${'${key}_${index}'}");

      if (progress != null) {
        list.add(new DataModel.fromJson(jsonDecode(progress)));
      }
    }

    return list;
  }

  Future addData(Box box, String key) async {
    for (int i = 0; i < TOTAL_LEVEL_SIZE; i++) {
      int index = (i + 1);

      DataModel dataModel = new DataModel();
      dataModel.tableName = dummyModel.categoryId.toString();
      dataModel.type = dummyModel.formulaId.toString();
      dataModel.level_no = index;
      dataModel.progress = 0;
      dataModel.id = index;
      dataModel.score = 0;
      dataModel.highScore = 0;
      dataModel.isShow = 0;
      box.put('${key}_${index}', dataModel.toJson().toString());
    }

    // box.put(key, list.toString());
  }
}
