import 'package:mydonationapp/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mydonationapp/models/user.dart';
import 'package:mydonationapp/login.dart';
import 'package:mydonationapp/screens/Login/login_screen.dart';

class Authenticate extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      print("user null");
      return LoginScreen();
    } else {
      print("logged in");
      return HomePage();
    }
  }
}
