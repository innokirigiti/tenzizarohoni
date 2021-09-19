import 'package:flutter/material.dart';
import 'package:tenzi/constants.dart';

import 'favorite_songs.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);
//ToDo - Design the drawer (or use a bottom NavigationBar)
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
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
                      "Tenzi App",
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
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: ()
            {
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
            leading: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
              },
            ),
            // onTap: ()
            // {
            //   Navigator.of(context).pop();
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (BuildContext context) => contact()));
            // },
          )
        ],
      ) ,
    );
  }
}


