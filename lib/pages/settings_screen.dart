import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //ToDo -Implement settings screen
  // Include the following
  // 1. Change theme into Dark / Bright (Default)
  // 2. Choose fontSize for lyrics(HTML detail)
  //   -include it on the dtl screen too( as action in appbar)
  // 3.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mipangilio'),
        elevation: 0,
      ),
      body: Center(
        child: Text('ToDo - settings screen'),
      ),
    );
  }
}
