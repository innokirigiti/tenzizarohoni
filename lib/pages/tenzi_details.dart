import 'package:flutter/material.dart';

class TenziDetails extends StatelessWidget {
  const TenziDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail screen'),
      ),
      body: Container(
        child: Text('Tenzi Details screen'),
      ),
    );
  }
}
