

import 'package:copy_large_file/copy_large_file.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tenzi/models/tenzi.dart';

class DatabaseHelper {

  var dbName = 'tenzi.db';
  var songsTable = 'songs';

// ToDo - Ensure there is a successful database upgrading

  //Initialize the DB using the path provided & return the DB instance Object
  Future<Database> initializeDB() async {

    //We already know the path, call the copyTenziDatabase to return it
    String path = await copyTenziDatabase();

    //Create connection to the db using the path above
    var dbInstance = await openDatabase(path, version: 1);
    return dbInstance;
  }

  //Copy the existing tenzi.db from assets to docs directory & return a path
  Future<String> copyTenziDatabase() async {
    try {
      String _path = await CopyLargeFile(dbName).copyLargeFile;
      print('Database path is: $_path');
     return _path;
    }
     on PlatformException {
      print('Failed to copy the Tenzi DB File.');
      return 'Error Copying $dbName ';
    }
  }

  //Get a list of all Tenzi from tenzi.db, it returns List<Tenzi> ready for use
  // in a list view (a list containing tenzi objects)
  Future<List<Tenzi>> retrieveTenzi() async {
    final Database db = await initializeDB();
    //Query from songs table in tenzi.db
    final List<Map<String, dynamic>> queryResult = await db.query(songsTable);
    return queryResult.map((e) => Tenzi.fromMap(e)).toList();
  }

  //Get a list of all Favorite Tenzi
  // by filtering only Tenzis with  (is_favorite = 1) column in tenzi.db
  Future<List<Tenzi>> retrieveFavorites() async {
    final Database db = await initializeDB();
    //Query from songs table in tenzi.db
    final List<Map<String, dynamic>> queryResult =
    await db.rawQuery('SELECT * FROM $songsTable WHERE is_favorite = 1;');
    return queryResult.map((e) => Tenzi.fromMap(e)).toList();
  }

  //Update Favorite Tenzi
  // Takes a value from favButton(true/false) & titleNo
  Future<void> updateFavorites(value,int titleNo) async {
    final Database db = await initializeDB();
    //Query from songs table in tenzi.db
    final List<Map<String, dynamic>> queryResult =
    await db.rawQuery('''
UPDATE $songsTable SET is_favorite = '$value' WHERE title_no = $titleNo;
    ''');
  }

}
