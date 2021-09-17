// import 'dart:io';

import 'package:copy_large_file/copy_large_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tenzi/constants.dart';
import 'package:tenzi/models/tenzi.dart';
import 'package:tenzi/models/tenzidatabase_helper.dart';
import 'package:tenzi/pages/custom_drawer.dart';
import 'package:tenzi/pages/tenzi_details.dart';
import 'package:tenzi/widgets/border_text_field.dart';
import 'package:tenzi/widgets/tenzi_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  var tenziList =[];

  // var dbInitialization = DatabaseHelper().retrieveTenzi();

  dbDealing() async {
    var _tenziList = await DatabaseHelper().retrieveTenzi();
    setState(() {
      tenziList =_tenziList;
    });
  }

  @override
  void initState() {
    super.initState();
    // Copy tenzi.db into docs directory for use within the app
    dbDealing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BorderTextField(
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          borderRadius: 50.0,
          hintText: "Tafuta Nyimbo...",
        ),
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      // bottomNavigationBar: BottomBar(), available on og
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // UserMenuBar(), available on og
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 12.0,
                ),
                Flexible(
                  //If tenziList =null, show spinner, else List of Tenzi
                  child: (tenziList.isEmpty)? SpinKitThreeBounce(
                    color: Constants.primaryColor,
                    size: 50.0,
                  ) :ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return TenziCard(tenzi: tenziList[index]);
                    },
                    itemCount: tenziList.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
