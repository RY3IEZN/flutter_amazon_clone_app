import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/auth/auth_screen.dart';
import 'package:flutter_amazonclone/screens/bottom_bar.dart';
import 'package:flutter_amazonclone/widgets/add_products_screen.dart';

import '../screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings) {
  switch (RouteSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: RouteSettings, builder: (_) => AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: RouteSettings, builder: (_) => HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: RouteSettings, builder: (_) => BottomBar());
    case AddProductsScreen.routeName:
      return MaterialPageRoute(
          settings: RouteSettings, builder: (_) => AddProductsScreen());
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
