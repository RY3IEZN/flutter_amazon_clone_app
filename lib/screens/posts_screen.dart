import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/widgets/add_products_screen.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddProductsScreen.routeName);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.teal,
          tooltip: "Add Products",
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
