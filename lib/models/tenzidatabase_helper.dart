//ToDo - Integrate full Database logic & complete cycle
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tenzi/models/tenzi.dart';

class DatabaseHelper {
  //Initialize the DB using the path provided & return the DB instance Object
  Future<Database> initializeDB() async {
// ToDo - Ensure there is a successful database upgrading
    //We already know the path, retrieve & provide it to the openDatabase method
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, 'tenzi.db');

    return openDatabase(
      path,
      version: 1,
    );
  }

  //Get a list of all Tenzi from tenzi.db, it returns List<Tenzi> ready for use
  // in a list view (a list containing tenzi objects)
  Future<List<Tenzi>> retrieveTenzi() async {
    final Database db = await initializeDB();
    //Query from songs table in tenzi.db
    final List<Map<String, Object?>> queryResult = await db.query('songs');
    return queryResult.map((e) => Tenzi.fromMap(e)).toList();
  }

}
