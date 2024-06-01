import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io; //input output
import 'package:fetahi_ca'
    'rs_show/Local_Db/Model_User/UserModel.dart';

import '../Model_User/itemsModel.dart';


class DbControll {
  static Database? _db;
  static const String DB_Name = 'db.db';
  static const String Table_User = 'user';
  static const String Table_Items = 'items';
  static const int Version = 1;

  //_____________USER_______________
  static const String C_Email = 'email';
  static const String C_Password = 'password';
  //_____________ITEMS_______________
  static const String C_ID = 'id';
  static const String C_Name = 'name';
  static const String C_Img = 'img';
  static const String C_Price = 'price';

  Future <Database?> get db async{
    if (_db != null ){
      return _db;
    }
    else {
      _db = await initDb();
      return _db;
    }
  }

  initDb () async{
    io.Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version,onCreate: _onCreate,onUpgrade: _onUpgrade);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_Email TEXT,"
        " $C_Password TEXT,"
        " PRIMARY KEY ($C_Email)"
        ")");
    // print('---------------bbbbbbbbbbbbbbb------------------');
    await db.execute("CREATE TABLE $Table_Items ("
        " $C_ID INTEGER,"
        " $C_Name TEXT,"
        " $C_Img TEXT,"
        " $C_Price INTEGER,"
        " PRIMARY KEY ($C_ID)"
        ")");
  }

  Future<int> saveData(UserModel user,) async {
    var dbClient = await db;
    var res = await dbClient!.insert(Table_User, user.toMap());
    return res;
  }


  Future<int> saveDataItems(ItemsModel item,) async {
    var dbClient = await db;
    var res = await dbClient!.insert(Table_Items, item.toMap());
    return res;
  }


  Future<UserModel?> getLoginUser(String user_email,String user_password) async {
    print("mohammmmeM_____________M__________________________________________");
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_Email    = '$user_email' AND "
        "$C_Password = '$user_password'");

    if(res.length > 0) {
      return UserModel.formMap(res.first);
    }

    return null;
  }

  Future<ItemsModel?> getItem(String item_name) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_Items WHERE "
        "$C_Name = '$item_name'");

    if(res.length > 0) {
      return ItemsModel.formMap(res.first);
    }

    return null;
  }

   fetchAllItems() async {
    print("mohammmmeM_____________M__________________________________________");
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_Items");

//    for()
    if(res.length > 0) {
      return res;
    }

      return {};
  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient!.update(Table_User, user.toMap(),
         where: '$C_Email = ?', whereArgs: [user.email]);
    return res;
  }

  Future<int> deleteUser(String user_email) async {
    var dbClient = await db;
    var res = await dbClient!
        .delete(Table_User, where: '$C_Email = ?',
        whereArgs: [user_email]);
    return res;
  }
  void _onUpgrade(Database db, int oldVersion, int newVersion)async{
    // In this case, oldVersion is 1, newVersion is 2
    if (oldVersion == 1) {
      // await db.execute("ALTER TABLE AssetAssemblyTable...") ;// add new column to existing table.
      await db.execute("CREATE TABLE $Table_Items ("
          " $C_Name TEXT,"
          " $C_Img TEXT,"
          " $C_Price TEXT,"
          " PRIMARY KEY ($C_Name)"
          ")");    }
  }
}