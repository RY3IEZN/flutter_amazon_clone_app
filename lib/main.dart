import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/auth/auth_screen.dart';
import 'package:flutter_amazonclone/navigation/route.dart';
import 'package:flutter_amazonclone/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      onGenerateRoute: ((settings) => generateRoute(settings)),
    );
  }
}
