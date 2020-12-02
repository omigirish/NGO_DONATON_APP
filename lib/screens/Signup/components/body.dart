import 'package:flutter/material.dart';
import 'package:mydonationapp/screens/Login/login_screen.dart';
import 'package:mydonationapp/screens/Signup/components/background.dart';
import 'package:mydonationapp/screens/Signup/components/or_divider.dart';
import 'package:mydonationapp/screens/Signup/components/social_icon.dart';
import 'package:mydonationapp/components/already_have_an_account_acheck.dart';
import 'package:mydonationapp/components/rounded_button.dart';
import 'package:mydonationapp/components/rounded_input_field.dart';
import 'package:mydonationapp/components/rounded_password_field.dart';
import 'package:mydonationapp/homePage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mydonationapp/services/auth.dart';
import 'package:mydonationapp/shared/loading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthService _auth = AuthService();
    String email, password;
    bool loading = false;
    return loading
        ? Loading()
        : Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "YellowTail",
                        fontSize: 50),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: size.height * 0.35,
                  ),
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  RoundedButton(
                    text: "SIGNUP",
                    press: () async {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result != null) {
                        print(result.uid);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      } else {
                        print("Problem in signing in");
                        loading = false;
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.facebookSquare,
                        size: 32,
                        color: Colors.orange[800],
                      ),
                      Icon(
                        FontAwesomeIcons.twitter,
                        size: 32,
                        color: Colors.orange[800],
                      ),
                      Icon(
                        FontAwesomeIcons.google,
                        size: 32,
                        color: Colors.orange[800],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
