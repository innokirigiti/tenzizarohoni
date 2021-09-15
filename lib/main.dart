// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tenzi/constants.dart';
import 'package:tenzi/pages/tenzi_details.dart';
//
// import 'package:flutter/services.dart';
// import 'package:copy_large_file/copy_large_file.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

import 'pages/home.dart';

void main() {
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
        // initialRoute: '/',
        routes: {
          '/':(context)=>Home(),
          // '/tenzi_details':(context)=>TenziDetails(tenzi: null,),
        },
      )
  );
}