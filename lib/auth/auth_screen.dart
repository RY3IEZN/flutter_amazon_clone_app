import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/common/custom_button.dart';
import 'package:flutter_amazonclone/common/custom_textfield.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebecee),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                tileColor:
                    _auth == Auth.signup ? Colors.white : Color(0xffebecee),
                leading: Radio(
                  activeColor: Colors.amber,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
                title: Text(
                  "Create account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomeTextField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(text: "Sign Up", onPressed: () {})
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor:
                    _auth == Auth.signin ? Colors.white : Color(0xffebecee),
                leading: Radio(
                  activeColor: Colors.amber,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
                title: Text(
                  "Sign-In",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Form(
                    key: _signinFormKey,
                    child: Column(
                      children: [
                        CustomeTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(text: "Sign In", onPressed: () {})
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
