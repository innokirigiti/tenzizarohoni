// import 'dart:io';

import 'package:copy_large_file/copy_large_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tenzi/constants.dart';
import 'package:tenzi/pages/tenzi_details.dart';
//
// import 'package:flutter/services.dart';
// import 'package:copy_large_file/copy_large_file.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

import 'pages/home.dart';

void main() async {
// // Avoid errors caused by flutter upgrade.
// // Importing 'package:flutter/widgets.dart' is required.
//   WidgetsFlutterBinding.ensureInitialized();
// // Open the database and store the reference.
//   final database = openDatabase(
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//     join(await getDatabasesPath(), 'tenzi.db'),
//   );
  runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Constants.primaryColor,
          // textTheme: GoogleFonts.rubikTextTheme(
          //   TextTheme(),
          // ),
        ),
        initialRoute: '/demo',
        routes: {
          '/':(context)=>Home(),
          '/demo':(context)=>DemoHome(),

          // '/tenzi_details':(context)=>TenziDetails(tenzi: null,),
        },
      )
  );


}



class DemoHome extends StatefulWidget {
  const DemoHome({Key? key}) : super(key: key);

  @override
  _DemoHomeState createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  var path ='No path';
  var tenziList;

//    openDatabase(path) async{
//     // Avoid errors caused by flutter upgrade.
// // Importing 'package:flutter/widgets.dart' is required.
//     WidgetsFlutterBinding.ensureInitialized();
// // Open the database and store the reference.
//     final database = openDatabase(path);
//   }

  Future<void> copyTenziDatabase() async {
    String? platformVersion;
    try {
      platformVersion = await CopyLargeFile.platformVersion;
      print(platformVersion);
      String _path = await CopyLargeFile("tenzi.db").copyLargeFile;
      print(_path);
      setState(() {
        path = _path;
      });

    } on PlatformException {
      print('Failed to copy the Tenzi DB File.');
      return;
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
    // Copy tenzi.db into docs directory for use within the app
    copyTenziDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Container(
            child: Text(path),
          ),
        ),
      ),
    );
  }
}
