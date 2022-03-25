// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tenzi/constants.dart';
import 'pages/home.dart';
import 'package:tenzi/fooderlich_theme.dart';

void main() async {
// Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
        theme: FooderlichTheme.dark(),
        initialRoute: '/',
        routes: {
          '/':(context)=>Home(),
          // '/tenzi_details':(context)=>TenziDetails(tenzi: null,),
        },
      )
  );
}

