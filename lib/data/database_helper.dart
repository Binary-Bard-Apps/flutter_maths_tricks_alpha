import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = 'trickes';
  static final _databaseVersion = 2;
  static final tableMainCat = 'category_table';
  static final tableReminder = 'tbl_reminder';
  static final tableSubCat = 'sub_category';
  static final progressTable = 'progress_table';
  static final historyTable = 'history_table';
  static final historyTableData = 'history_data';
  static final quizTable = 'quiz_data';
  static String dbPath = "";

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase(false);
    }
    return _database!;
  }

  Future<Database> _initDatabase(bool fromupdate) async {
    print("getversioncreate2---$_databaseVersion");
    var databasepath = await getDatabasesPath();
    String path = join(databasepath, _databaseName);
    dbPath = path;
    var exists = await databaseExists(path);
    print("getversioncreate2exist]==$exists");
    if (!exists) {
      try {
        // await Directory(dirname(path)).create(recursive: false);
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // await File(path).writeAsBytes(bytes, flush: true);
      await File(path).writeAsBytes(bytes, flush: true);
    } else if (fromupdate) {
      try {
        // await Directory(dirname(path)).create(recursive: false);
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    print("fromVersion==$_databaseVersion");
    return await openDatabase(path,
        version: _databaseVersion,
        readOnly: false,
        onUpgrade: _onUpgrade,
        onCreate: _onCreate,
        singleInstance: true);
    // return _db;
  }

  void _onCreate(db, version) {
    print("getversioncreate---$version");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("getversionb---$oldVersion---$newVersion");
    if (oldVersion < newVersion) {
      print("getversioncreate2---$_databaseVersion");
      var databasepath = await getDatabasesPath();
      String path = join(databasepath, _databaseName);
      dbPath = path;
      var exists = await databaseExists(path);
      print("getversioncreate2exist]==$exists");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    // updateDatabase();
  }

  // Future<List> getAllMainCatList() async {
  //   Database database = await instance.database;
  //   var results = await database.query(tableMainCat);
  //   return results.toList();
  // }
  //
  // Future<int> getLevelSize(int refId) async {
  //   Database database = await instance.database;
  //   // var results = await database.query("SELECT * FROM $table_main_cat");
  //   // var results = await database.query(tableMainCat);
  //   var res = await database
  //       .query(quizTable, where: 'sub_cat_id=?', whereArgs: [refId]);
  //   // final response = await database.query(
  //   //   quizTable,
  //   //   distinct: true,
  //   //   orderBy: 'level',
  //   //   where: 'sub_cat_id = ?',
  //   //   whereArgs: [refId],
  //   // );
  //   final response = await database.rawQuery(
  //       "SELECT DISTINCT level FROM quiz_data WHERE sub_cat_id=$refId");
  //   //   "SELECT DISTINCT level, sub_cat_id "
  //   //       "FROM quiz_data "
  //   //       "WHERE quiz_data.sub_cat_id == ? "
  //   //       "ORDER BY sub_cat_id.level DESC",
  //   //   [refId],
  //   // );
  //
  //   print("getvals==${response.toList().length}");
  //   return response.toList().length;
  // }

  Future<String?> getImageFromId(int id) async {
    Database database = await instance.database;
    var res = await database
        .query('image_table', where: "id" + " = ?", whereArgs: [id]);

    String? image = null;
    for (int i = 0; i < res.length; i++) {
      image = res[i]['image'] as String;
    }

    return image;
  }
}
