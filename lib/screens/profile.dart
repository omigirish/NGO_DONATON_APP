import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Center(
            heightFactor: 22,
            widthFactor: 10,
            child: MaterialButton(
              height: 70,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color(0xff00b4ff), width: 3)),
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
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
          ),
        ],
      ),
    );
  }
}
