import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shopping/models/Item.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'school.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      //create all tables
      db.execute(
          "create table items(id integer primary key autoincrement, name varchar(50),  price real)");
    });
    return _db;
  }

  Future<int> createItem(Item item) async {
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('items', item.toMap());
  }

  Future<List> allItems() async {
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")

    return db.query('items');
  }

  Future<int> deleteItems(int id) async {
    Database db = await createDatabase();
    return db.delete('items', where: 'id = ?', whereArgs: [id]);
  }

  String sum;
  double value;
  Future getTotal() async {
    Database db = await createDatabase();

    var result = await db.rawQuery("SELECT SUM(price) FROM items");

    value = result[0]["SUM(price)"];
    print(value);
    return result.toString();
  }

  Widget con(context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width / 2.2,
      color: Colors.grey[100],
      child: Center(
          child: Text(
        value == null ? "0" : value.toString(),
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
