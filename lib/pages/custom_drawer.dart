import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
         SafeArea(
           child: Text('To do', style: TextStyle(
             fontSize: 40,
             color: Colors.black
           ),),
         )
        ],
      ),
    );
  }
}

