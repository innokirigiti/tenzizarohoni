// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tenzi/constants.dart';
import 'pages/home.dart';

void main() async {
// Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Constants.primaryColor,
        ),
        initialRoute: '/',
        routes: {
          '/':(context)=>Home(),
          // '/tenzi_details':(context)=>TenziDetails(tenzi: null,),
        },
      )
  );
}

