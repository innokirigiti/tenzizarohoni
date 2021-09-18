import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tenzi/constants.dart';
import 'package:tenzi/models/tenzi.dart';

class TenziDetails extends StatelessWidget {
  const TenziDetails({Key? key, required this.tenzi}) : super(key: key);

  // Declare a field that holds the
  final Tenzi tenzi;

  @override
  Widget build(BuildContext context) {
    /** Todo - to create detail screen UI - Render HTML.
     * ToDo - Implement list searching capability
     * ToDo - Add Splash screen
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
        padding: const EdgeInsets.all(16.0),
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
      floatingActionButton: FloatingActionButton(
          //ToDo - Add Favorite capability
        onPressed: (){},
        child: Icon(Icons.favorite_border),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}