import 'package:flutter/material.dart';
import 'package:tenzi/models/tenzi.dart';

class TenziDetails extends StatelessWidget {
  const TenziDetails({Key? key, required this.tenzi}) : super(key: key);

  // Declare a field that holds the
  final Tenzi tenzi;

  @override
  Widget build(BuildContext context) {
    /** Todo - to create detail screen UI.
     *  - Add HTML View in place of body
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
        child: Text(tenzi.verses),
      ),
    );
  }
}