import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/screens/account_screen.dart';
import 'package:flutter_amazonclone/screens/home_screen.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);
  static const String routeName = "/main-home";

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentPage = 0;

  List pages = [
    HomeScreen(),
    Accountscreen(),
    Center(
      child: Text("cart page"),
    ),
    Center(
      child: Text("Menu or settings Page"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              label: "Home"),
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
                child: Icon(Icons.person),
              ),
              label: "Profile"),
          // shopping cart
          BottomNavigationBarItem(
              icon: Container(
                width: 32,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: currentPage == 2 ? Colors.blue : Color(0xffebecee),
                    ),
                  ),
                ),
                child: Badge(
                  badgeContent: Text("2"),
                  badgeColor: Colors.red,
                  child: Icon(Icons.shopping_cart),
                ),
              ),
              label: "Cart"),
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
              label: "Cart"),
        ],
      ),
    );
  }
}
