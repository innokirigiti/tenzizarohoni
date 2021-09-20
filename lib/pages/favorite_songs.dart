import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tenzi/models/tenzi.dart';
import 'package:tenzi/models/tenzidatabase_helper.dart';
import 'package:tenzi/widgets/tenzi_card.dart';

import '../constants.dart';

class FavoriteSongs extends StatefulWidget {
  const FavoriteSongs({Key? key}) : super(key: key);

  @override
  _FavoriteSongsState createState() => _FavoriteSongsState();
}

class _FavoriteSongsState extends State<FavoriteSongs> {
  //Empty list to be populated later with Tenzi objects
  var tenziList = <Tenzi>[];
  String searchText = '';

  //A method to deal with database issues
  dbDealing() async {
    var _tenziList = await DatabaseHelper().retrieveFavorites();
    setState(() {
      tenziList = _tenziList;
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
        title: Text('Nyimbo Pendwa'),
        elevation: 0,
      ),
      // bottomNavigationBar: BottomBar(), available on og
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Flexible(
                  //If tenziList =null, show spinner, else List of Tenzi
                  child: (tenziList.isEmpty)
                      ? SpinKitThreeBounce(
                    color: Constants.primaryColor,
                    size: 50.0,
                  )
                      : Scrollbar(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return TenziCard(tenzi: tenziList[index]);
                      },
                      itemCount: tenziList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

