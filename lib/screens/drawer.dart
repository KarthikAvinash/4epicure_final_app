import 'package:chatgpt_course/screens/contact_screen.dart';
import 'package:chatgpt_course/screens/get_nutrients_screen.dart';
import 'package:flutter/material.dart';
import '../utilities/colors.dart';

import '../utilities/globals.dart' as globals;

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isLight = false;
  Color card_color = Color.fromRGBO(220, 208, 208, 1);
   Border? border_color;

  @override
  void initState() {
    super.initState();
    border_color = Border.all(
      color: isLight ? Colors.white30 : Colors.black,
      width: 1.0,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  // backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${globals.userName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                // Text(
                //   'Recipe History',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 16,
                //   ),
                // ),
              ],
            ),
          ),
          ListTile(
            leading:const Icon(Icons.food_bank_outlined),
            title: Text('Get nutrition informations'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => getNutrientsScreen(),
              ),
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // TODO: implement settings
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              // TODO: implement help
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // TODO: implement logout
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isLight,
    onChanged: (value) {
      // Toggle the mode and update the colors
      setState(() {
        isLight = !isLight;
        card_color = isLight
            ? Color.fromRGBO(220, 208, 208, 1)
            : Colors.black54;
        border_color = Border.all(
          color: isLight ? Colors.white30 : Colors.white,
          width: 1.0,
        );
      });
    },
  ),
  onTap: () {
    // Toggle the mode and update the colors
    setState(() {
      isLight = !isLight;
      card_color = isLight
          ? Color.fromRGBO(220, 208, 208, 1)
          : Colors.black54;
       border_color = Border.all(
                  color: isLight ? Colors.white30 : Colors.white,
                  width: 1.0,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}