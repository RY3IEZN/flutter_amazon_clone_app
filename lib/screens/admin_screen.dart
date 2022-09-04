import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/screens/posts_screen.dart';

import '../common/global_variables.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int currentPage = 0;

  List pages = [
    PostsScreen(),
    Center(
      child: Text("analtics"),
    ),
    Center(
      child: Text("Menu or settings Page"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/amazon_in.png",
                  width: 120,
                  height: 45,
                ),
              ),
              Text(
                "Admin Panel",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xffebecee),
        iconSize: 28,
        onTap: (value) {
          setState(() {
            currentPage = value;
            print(currentPage);
          });
        },
        items: [
          // home
          BottomNavigationBarItem(
              icon: Container(
                width: 32,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: currentPage == 0 ? Colors.blue : Color(0xffebecee),
                    ),
                  ),
                ),
                child: Icon(Icons.home),
              ),
              label: "Posts"),
          // profile
          BottomNavigationBarItem(
              icon: Container(
                width: 32,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: currentPage == 1 ? Colors.blue : Color(0xffebecee),
                    ),
                  ),
                ),
                child: Icon(Icons.analytics),
              ),
              label: "Analytics"),
          BottomNavigationBarItem(
              icon: Container(
                width: 32,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: currentPage == 3 ? Colors.blue : Color(0xffebecee),
                    ),
                  ),
                ),
                child: Icon(Icons.menu),
              ),
              label: "Menu"),
        ],
      ),
    );
  }
}
