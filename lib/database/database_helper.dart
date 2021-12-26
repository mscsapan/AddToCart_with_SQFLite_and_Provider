import 'dart:io';

import '../model/model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._databaseConstructor();

  static final DatabaseHelper databaseHelper =
      DatabaseHelper._databaseConstructor();
  static Database? _database;

  static const _databaseName = 'cart_database.db';
  static const _tableName = 'cart';

  Future<Database?> get getDatabase async {
    if (_database != null) return _database;
    return _database = await _initializeDatabase();
  }

  _initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path, version: 8, onCreate: _onCreate);
  }

  Future _onCreate(Database? db, int version) async {
    await db!.execute('''
     CREATE TABLE $_tableName  
      (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      image TEXT,
      initialPrice INTEGER,
      price INTEGER,
      quantity INTEGER,
      unit TEXT
      )
      ''');
  }

  Future<Product> insertProduct(Product product) async {
    debugPrint('${product.toProductMap()}');
    var db = await databaseHelper.getDatabase;
    await db!.insert(_tableName, product.toProductMap());
    return product;
  }

  Future<List<Product>> getDatabaseProduct() async {
    var db = await databaseHelper.getDatabase;
    final List<Map<String, dynamic>> mapResult = await db!.query(_tableName);
    return mapResult.map((product) => Product.fromProduct(product)).toList();
  }

  Future deleteItem(int deleteId) async {
    var db = await databaseHelper.getDatabase;
    return db!.delete(_tableName, where: 'id = ? ', whereArgs: [deleteId]);
  }

  Future deleteDatabase() async {
    debugPrint('Successfully Delete');
    var db = await databaseHelper.getDatabase;
    return await db!.delete(_tableName);
  }

  Future updateQuantity(Product product) async {
    var db = await databaseHelper.getDatabase;
    await db!.update(_tableName, product.toProductMap(),
        where: 'id = ?', whereArgs: [product.id]);
  }
}
