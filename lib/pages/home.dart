import 'package:copy_large_file/copy_large_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tenzi/constants.dart';
import 'package:tenzi/models/tenzi.dart';
import 'package:tenzi/pages/custom_drawer.dart';
import 'package:tenzi/widgets/border_text_field.dart';
import 'package:tenzi/widgets/tenzi_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Tenzi> tenziList = [
    Tenzi(
        titleNo: 1,
        title: "Mwokozi umeokoa",
        titleEn: "Precious Saviour",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: 2,
        title: "Twamsifu Mungu",
        titleEn: "Whe praise Thee, O God",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: 3,
        title: "Hata ndimi elfu",
        titleEn: "O for a thousand tongues to sing",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: 4,
        title: "Twamsifu Mungu",
        titleEn: "Whe praise Thee, O God",
        verses: 'Blah blah')
  ];

  @override
  void initState() {
    super.initState();
    // Copy tenzi.db into docs directory for use within the app
    copyTenziDatabase();
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
                  child: ListView.builder(
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

  // Copy the database from assets & iOS bundle into docs directory 4 use.
  //On initial app install
  Future<void> copyTenziDatabase() async {
    String? platformVersion;
    try {
      platformVersion = await CopyLargeFile.platformVersion;
      print(platformVersion);
      String yep = await CopyLargeFile("tenzi.db").copyLargeFile;
    } on PlatformException {
      print('Failed to copy the Tenzi DB File.');
      return;
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }
}
