import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/auth/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings) {
  switch (RouteSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: RouteSettings, builder: (_) => AuthScreen());
    default:
      return MaterialPageRoute(
          settings: RouteSettings,
          builder: (_) => Scaffold(
                body: Center(
                  child: Text("page not found"),
                ),
              ));
  }
}
