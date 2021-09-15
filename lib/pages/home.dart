import 'package:flutter/material.dart';

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
        titleNo: "1",
        title: "Mwokozi umeokoa",
        titleEnglish: "Precious Saviour",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "2",
        title: "Twamsifu Mungu",
        titleEnglish: "Whe praise Thee, O God",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "3",
        title: "Hata ndimi elfu",
        titleEnglish: "O for a thousand tongues to sing",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "1",
        title: "Mwokozi umeokoa",
        titleEnglish: "Precious Saviour",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "2",
        title: "Twamsifu Mungu",
        titleEnglish: "Whe praise Thee, O God",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "3",
        title: "Hata ndimi elfu",
        titleEnglish: "O for a thousand tongues to sing",
        verses: 'Blah blah'),    Tenzi(
        titleNo: "1",
        title: "Mwokozi umeokoa",
        titleEnglish: "Precious Saviour",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "2",
        title: "Twamsifu Mungu",
        titleEnglish: "Whe praise Thee, O God",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "3",
        title: "Hata ndimi elfu",
        titleEnglish: "O for a thousand tongues to sing",
        verses: 'Blah blah'),    Tenzi(
        titleNo: "1",
        title: "Mwokozi umeokoa",
        titleEnglish: "Precious Saviour",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "2",
        title: "Twamsifu Mungu",
        titleEnglish: "Whe praise Thee, O God",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "3",
        title: "Hata ndimi elfu",
        titleEnglish: "O for a thousand tongues to sing",
        verses: 'Blah blah'),    Tenzi(
        titleNo: "1",
        title: "Mwokozi umeokoa",
        titleEnglish: "Precious Saviour",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "2",
        title: "Twamsifu Mungu",
        titleEnglish: "Whe praise Thee, O God",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "3",
        title: "Hata ndimi elfu",
        titleEnglish: "O for a thousand tongues to sing",
        verses: 'Blah blah'),
    Tenzi(
        titleNo: "161",
        title: "Jina la Yesu, salamu!",
        titleEnglish: "All hail for the power of Jesus",
        verses: 'Blah Blah')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:BorderTextField(
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
                // Container(
                //   // height: ScreenUtil().setHeight(180.0),
                //   // width: ScreenUtil().setWidth(339.24),
                //   height: 180,
                //   width: 339.24,
                //   decoration: BoxDecoration(
                //     color: Constants.primaryColor,
                //     borderRadius: BorderRadius.circular(8.0),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Color.fromRGBO(255, 99, 128, 0.6),
                //         spreadRadius: 0,
                //         blurRadius: 6,
                //         offset: Offset(0, 2), // changes position of shadow
                //       ),
                //     ],
                //   ),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Padding(
                //           padding: const EdgeInsets.all(10.0),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.stretch,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Row(
                //                 children: [
                //                   Container(
                //                     width: 30.0,
                //                     height: 30.0,
                //                     decoration: BoxDecoration(
                //                       shape: BoxShape.circle,
                //                       color: Colors.white,
                //                     ),
                //                     child: Center(
                //                       child: Text(
                //                         "20",
                //                         style: TextStyle(
                //                           color: Constants.primaryTextColor,
                //                           fontWeight: FontWeight.w600,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     width: 10.0,
                //                   ),
                //                   Text(
                //                     "Points",
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.w600,
                //                       fontSize: 14.0,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //               Text(
                //                 "Daily English Conversation",
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 24.0,
                //                 ),
                //               ),
                //               Text(
                //                 "Learn More",
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 20.0,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: Container(
                //           decoration: BoxDecoration(
                //             image: DecorationImage(
                //               fit: BoxFit.fill,
                //               image: AssetImage(
                //                 "assets/images/course-1.png",
                //               ),
                //             ),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 30.0,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "My lessons",
                //       style: TextStyle(
                //         fontSize: 21.0,
                //         color: Constants.primaryTextColor,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //     Text(
                //       "View all",
                //       style: TextStyle(
                //         fontSize: 15.0,
                //         color: Constants.captionTextColor,
                //       ),
                //     ),
                //   ],
                // ),
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
}
