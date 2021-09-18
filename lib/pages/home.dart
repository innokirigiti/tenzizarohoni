import 'package:copy_large_file/copy_large_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:search_page/search_page.dart';

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
  //Declare a textEditingController to capture search inputs
  TextEditingController? _textEditingController = TextEditingController();

  //Empty list to be populated later with Tenzi objects
  var tenziList = <Tenzi>[];
  String searchText = '';

  //A method to deal with database issues
  dbDealing() async {
    var _tenziList = await DatabaseHelper().retrieveTenzi();
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
        title: Text('Tenzi Za Rohoni'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => showSearch(//From search plugin
                    context: context,
                    delegate: SearchPage<Tenzi>(
                      items: tenziList,
                      searchLabel: 'Tafuta Wimbo',
                      suggestion: Center(
                        child: Text('Tafuta kwa namba ya Wimbo au Jina'),
                      ),
                      failure: Center(
                        child: Text('Hakuna Wimbo kama hiyo :('),
                      ),
                      filter: (tenzi) => [
                        tenzi.title,
                        tenzi.titleNo.toString(),
                      ],
                      builder: (tenzi) => TenziCard(tenzi: tenzi),
                      // builder: (tenzi) => ListTile(
                      //   title: Text(tenzi.title),
                      //   subtitle: Text(tenzi.titleEn??''),
                      //   leading: Text(tenzi.titleNo.toString()),
                      // ),
                    ),
                  ),
              icon: Icon(Icons.search,
              )),
          SizedBox(width: 25,)
        ],
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
