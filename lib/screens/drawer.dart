import 'package:chatgpt_course/screens/contact_screen.dart';
import 'package:flutter/material.dart';
import '../utilities/colors.dart';

import '../utilities/globals.dart' as globals;

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
            title: Text('Recipe'),
            onTap: () {
              // TODO: implement settings
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
              value: false,
              onChanged: (value) {
                // TODO: implement dark mode switch
              },
            ),
            onTap: () {
              // TODO: implement dark mode
            },
          ),
                    ListTile(
            leading:const Icon(Icons.person),
            title: Text('Contact page'),
            onTap: () {
              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContactPage()));
            },
          ),
        ],
      ),
    );
  }
}