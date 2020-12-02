import 'package:mydonationapp/homePage.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mydonationapp/services/auth.dart';
// import 'package:provider/provider.dart';
// import 'package:mydonationapp/models/user.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image1.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter)),
        child: Form(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.15,
              ),
              TextFormField(
                onChanged: (val) {},
                style: TextStyle(
                    color: Colors.black, fontFamily: "CentraleSansRegular"),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xffd3dde4), width: 3)),
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: "CentraleSansRegular")),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {},
                obscureText: true,
                style: TextStyle(
                    color: Colors.black, fontFamily: "CentraleSansRegular"),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xffd3dde4), width: 3)),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: "CentraleSansRegular")),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 330,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff471a91), Color(0xff3cabff)],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "CentraleSansRegular",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontFamily: 'CentraleSansRegular',
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              )),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: 330,
                height: 70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xff00b4ff), width: 3)),
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      LineAwesomeIcons.facebook_official,
                      color: Color(0xff00b4ff),
                      size: 40,
                    ),
                    Text(
                      "Connect with Facebook",
                      style: TextStyle(
                          color: Color(0xff00b4ff),
                          fontFamily: "CentraleSansRegular",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: 330,
                height: 70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xff501396), width: 3)),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result != null) {
                    print(result.uid);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    print("Problem in signing in");
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Continue as Guest",
                      style: TextStyle(
                          color: Color(0xff501396),
                          fontFamily: "CentraleSansRegular",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
