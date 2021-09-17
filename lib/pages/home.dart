import 'package:copy_large_file/copy_large_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:tenzi/models/tenzi.dart';
import 'package:tenzi/models/tenzidatabase_helper.dart';
import 'package:tenzi/pages/custom_drawer.dart';
import 'package:tenzi/widgets/border_text_field.dart';
import 'package:tenzi/widgets/tenzi_card.dart';

import '../constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//ToDo - Implement list searching capability

  //Empty list to be populated later with Tenzi objects
  var tenziList =[];

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
