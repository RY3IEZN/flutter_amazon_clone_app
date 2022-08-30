import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/common/error_handling.dart';
import 'package:flutter_amazonclone/common/utils.dart';
import 'package:flutter_amazonclone/model/user.dart';
import 'package:flutter_amazonclone/provider/user_provider.dart';
import 'package:flutter_amazonclone/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //  signup logic

  void signUpUser(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      User user = User(
          id: "",
          name: name,
          email: email,
          password: password,
          address: "",
          type: "",
          token: "");
// always use the IP address of the machine that is hosting your localhost
      http.Response res = await http.post(
          Uri.parse("http://192.168.0.232:3008/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            "Content-type": "application/json; charset=UTF-8"
          });
      print(res.body);
      print(res.statusCode);

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context,
                "Account succesfully created, login in with the same details");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
      print(e.hashCode);
      print("${e.toString()} look here");
      print(e.runtimeType);
    }
  }

//sign in Logic
//
  void signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
// always use the IP address of the machine that is hosting your localhost
      http.Response res = await http.post(
          Uri.parse("http://192.168.0.232:3008/api/signin"),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            "Content-type": "application/json; charset=UTF-8"
          });
      print(res.body);
      print(res.statusCode);

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await preferences.setString(
                "x-auth-token", jsonDecode(res.body)["token"]);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          });
      showSnackBar(context, "Login Successful");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
      print(e.hashCode);
      print("${e.toString()} look here");
      print(e.runtimeType);
    }
  }

  // get USerdata
  void getUserData({required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");
      if (token == null) {
        prefs.setString("x-auth-token", "");
      }

      var tokenRes = await http.post(
          Uri.parse("http://192.168.0.232:3008/api/tokenIsValid"),
          headers: <String, String>{
            "Content-type": "application/json; charset=UTF-8",
            "x-auth-token": token!
          });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
            Uri.parse("http://192.168.0.232:3008/"),
            headers: <String, String>{
              "Content-type": "application/json; charset=UTF-8",
              "x-auth-token": token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
      print(e);
      print(e.hashCode);
      print("${e.toString()} look here");
      print(e.runtimeType);
    }
  }
}
