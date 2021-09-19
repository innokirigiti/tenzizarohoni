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
    /** Todo - to create detail screen UI - Render HTML.
     * ToDo - Implement list searching capability
     */
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
              // text that renders p and em elements will be centered
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
        onPressed: (){},//ToDO - Use a package to add favorite functionality
      child: FavoriteButton(
        iconSize: 45,
        iconDisabledColor: Colors.black87,
        isFavorite: false,
        valueChanged: (_isFavorite) async{
          if(_isFavorite == true){
            await DatabaseHelper().updateFavorites(1, tenzi.titleNo!);
          }else
            await DatabaseHelper().updateFavorites(0, tenzi.titleNo!);
        },
      ),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}

//Method to update DB with favs
updateDB(value,titleNo) async {
  await DatabaseHelper().updateFavorites(value, titleNo);
}