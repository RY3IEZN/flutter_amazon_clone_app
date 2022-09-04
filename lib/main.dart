import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/auth/auth_screen.dart';
import 'package:flutter_amazonclone/navigation/route.dart';
import 'package:flutter_amazonclone/provider/user_provider.dart';
import 'package:flutter_amazonclone/screens/admin_screen.dart';
import 'package:flutter_amazonclone/screens/bottom_bar.dart';
import 'package:flutter_amazonclone/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == "user"
              ? BottomBar()
              : AdminScreen()
          : AuthScreen(),
    );
  }
}
