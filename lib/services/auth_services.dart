import 'dart:convert';

import 'package:chatgpt_course/auth_screens/signIn.dart';
import 'package:chatgpt_course/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_course/auth_screens/signUp.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utilities/globals.dart' as globals;
import '../utilities/error_handling.dart'; 


class authServices {
    
    //Sign Up
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try { 
      globals.userName = name;
      http.Response res = await http.post(
          Uri.parse('${globals.uri}/api/users/'),
          body:json.encode({
             "username":name,
             "email":email,
             "password":password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            // 'origin': '*',
            // 'Access-Control-Allow-Origin': '*',
          }
          );
          // });
          print(res.statusCode);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account created login with the same credentials');
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabsScreen()));
          });
          return;
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
 
 //Logging in
 void signInUser({
    required BuildContext context,
    required String name,
    required String password,
  }) async {
    try {
      globals.userName = name;
      http.Response res = await http.post(
        Uri.parse('${globals.uri}/api/users/login/'),
        body: jsonEncode({
          'username': name,
          'password': password,
        }),
         headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',
         },
      );
      print(res.statusCode);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          // globals.userName = res.body[name];
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabsScreen()));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
