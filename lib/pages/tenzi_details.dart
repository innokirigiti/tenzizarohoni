import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tenzi/constants.dart';
import 'package:tenzi/models/tenzi.dart';
import 'package:tenzi/models/tenzidatabase_helper.dart';

class TenziDetails extends StatelessWidget {
  const TenziDetails({Key? key, required this.tenzi}) : super(key: key);

  // Declare a field that holds the
  final Tenzi tenzi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${tenzi.titleNo} ' '${tenzi.title} '),
        actions: [
          IconButton(
              onPressed: () {
                /**ToDo - Play music on play icon clicked in Details screen
                 * - Also use ternary operator to show pause icon & apply
                 * onclick too for it to pause a Tenzi
                 */
              },
              icon: Icon(
                Icons.play_circle_filled,
                color: Colors.black87,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 75),
        child: SingleChildScrollView(
          child: Html(
            data: """<p>${tenzi.verses}</p>""",
            style:{
              // text that renders p and font elements will be centered
              "p": Style(textAlign: TextAlign.center,
                  fontSize: FontSize(Constants.versesFontSize),
              ),
              "font": Style(textAlign: TextAlign.center,
                fontSize: FontSize(Constants.versesFontSize),
              ),
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
      child: FavoriteButton(
        iconSize: 45,
        iconDisabledColor: Colors.white70,
        iconColor: Colors.black87,
        isFavorite: (tenzi.isFavorite==1)?true:false,
        valueChanged: (_isFavorite) async{
          //If changed value is true, Update to 1 in DB with respective titleNo
          if(_isFavorite == true){
            await DatabaseHelper().updateFavorites(1, tenzi.titleNo!);
          }else //Update to 0 in DB
            await DatabaseHelper().updateFavorites(0, tenzi.titleNo!);
        },
      ),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}