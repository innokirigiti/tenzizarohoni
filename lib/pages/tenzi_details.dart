import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tenzi/constants.dart';
import 'package:tenzi/models/tenzi.dart';
import 'package:tenzi/models/tenzidatabase_helper.dart';

class TenziDetails extends StatefulWidget {
  const TenziDetails({Key? key, required this.tenzi}) : super(key: key);

  // Declare a field that holds the
  final Tenzi tenzi;

  @override
  State<TenziDetails> createState() => _TenziDetailsState();
}

class _TenziDetailsState extends State<TenziDetails> {

  double _fontSize = Constants.versesFontSize;
  final double _baseFontSize = 18;
  double _fontScale = 1;
  double _baseFontScale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.tenzi.titleNo} ' '${widget.tenzi.title} '),
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
          child: GestureDetector(
            onScaleStart: (scaleStartDetails) {
              _baseFontScale = _fontScale;
            },
            onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
              // don't update the UI if the scale didn't change
              if (scaleUpdateDetails.scale == 1.0) {
                return;
              }
              setState(() {
                _fontScale = (_baseFontScale * scaleUpdateDetails.scale).clamp(0.5, 5.0);
                _fontSize = _fontScale * _baseFontSize;
              });
            },
            child: Html(
              //TODO - Add the zoom in/out to change fontsize of tenzidetails
              data: """<p>${widget.tenzi.verses}</p>""",
              style:{
                // text that renders p and font elements will be centered
                "p": Style(textAlign: TextAlign.center,
                    fontSize: FontSize(_fontSize),
                ),
                "font": Style(textAlign: TextAlign.center,
                  fontSize: FontSize(_fontSize),
                ),
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
      child: FavoriteButton(
        iconSize: 45,
        iconDisabledColor: Colors.white70,
        iconColor: Colors.black87,
        isFavorite: (widget.tenzi.isFavorite==1)?true:false,
        valueChanged: (_isFavorite) async{
          //If changed value is true, Update to 1 in DB with respective titleNo
          if(_isFavorite == true){
            await DatabaseHelper().updateFavorites(1, widget.tenzi.titleNo!);
          }else //Update to 0 in DB
            await DatabaseHelper().updateFavorites(0, widget.tenzi.titleNo!);
        },
      ),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}