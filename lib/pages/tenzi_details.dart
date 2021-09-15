import 'package:flutter/material.dart';
import 'package:tenzi/models/tenzi.dart';

class TenziDetails extends StatelessWidget {
  const TenziDetails({Key? key, required this.tenzi}) : super(key: key);

  // Declare a field that holds the
  final Tenzi tenzi;

  @override
  Widget build(BuildContext context) {
    // Use the Todo - to create detail screen UI.
    return Scaffold(
      appBar: AppBar(
        title: Text('${tenzi.titleNo} ' '${tenzi.title} '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(tenzi.verses),
      ),
    );
  }
}