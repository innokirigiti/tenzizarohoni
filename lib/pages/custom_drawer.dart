import 'package:flutter/material.dart';
import 'package:tenzi/constants.dart';
import 'package:tenzi/pages/settings_screen.dart';

import 'favorite_songs.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

//ToDo - Design the drawer (or use a bottom NavigationBar)
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Constants.primaryColor,
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Tenzi Za Rohoni",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Nyimbo Pendwa"),
            leading: Icon(Icons.favorite),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FavoriteSongs()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
              title: Text("Mipangilio"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SettingsScreen()));
              })
        ],
      ),
    );
  }
}
