// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mydonationapp/globals.dart' as global;

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  List<Widget> notilist = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    notilist = []; // Never Remive this line
    global.requestlist.forEach((data) async {
      notilist.add(_pushnotification(
        data['img'],
        data['username'],
        'I would like to Donate ' + data['itemname'],
        'Qty: ' + data['quantity'].toString(),
      ));
    });
    Future.delayed(Duration(seconds: 1), () async {
      global.getrequests();
      setState(() {});
    });

    // notilist.add(_pushnotification(
    //   'https://lh3.googleusercontent.com/a-/AOh14Gh2wZV5hAUJ4rJbc4Yb3_xb4oGiF3F8zjGOVbqQsPo=s96-c',
    //   'Nathani Trust',
    //   'Request: We Need Smartphones to help Needy Students in Lockdown to study',
    //   'Qty: 10',
    // ));

    // notilist.add(_pushnotification(
    //   'https://firebasestorage.googleapis.com/v0/b/donationapp-89333.appspot.com/o/images%2F2020-12-05%2020%3A54%3A58.958832?alt=media&token=2cb5a166-c8e3-4270-ae55-0cc4e563f138',
    //   'Soni Trust',
    //   'Request: We Need Smartphones to help Needy Students in Lockdown to study',
    //   'Qty: 10',
    // ));
    return Scaffold(
        backgroundColor: Colors.black87,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 230.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          // colors: [Color(0x000000), Color(0xBB923CB5)],
                          colors: [
                            Colors.purple[500], //Color(0xBB923CB5)
                            Color(0x21212),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(75.0)),
                      color: Color(0xFFFD7465)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.0, left: 15.0),
                  child: Text(
                    'One for All',
                    style: TextStyle(
                        fontFamily: 'yellowTail',
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 95.0, left: 15.0),
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 28.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 160.0, left: 15.0, right: 35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.0),
                          bottomLeft: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                        )),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Search in Notifications',
                        hintStyle:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 14.0),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            ),
            for (Widget notification in notilist) notification,
            SizedBox(height: 20.0)
          ],
        ));
  }

  _pushnotification(String imgurl, String username, String desc, String price) {
    void makeCall(String number) async {
      var url = 'tel:$number';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "Could Not Place Call";
      }
    }

    void email(String emailId) async {
      var url = 'mailto:${emailId}?subject=Request%20for%20Donation';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "Could Not Send email";
      }
    }

    void message(String number) async {
      var url = 'sms:${number}?body=Request%20for%20Donation';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "Could Not Send email";
      }
    }

    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 145.0,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: 15.0,
            top: 30.0,
            child: Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width - 15.0,
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          Positioned(
              left: 95.0,
              top: 64.0,
              child: Container(
                height: 80.0,
                width: MediaQuery.of(context).size.width - 15.0,
                decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3.0,
                          blurRadius: 3.0)
                    ]),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 25.0),
                        Icon(Icons.thumb_up,
                            color: Colors.green[700], size: 15.0),
                        SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              customHeader: Icon(Icons.comment),
                              animType: AnimType.BOTTOMSLIDE,
                              tittle: 'Dialog Title',
                              desc: 'Dialog description here.............',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            )..show();
                          },
                          child: Text(
                            "Accept Request",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700]),
                          ),
                        ),
                        SizedBox(width: 25.0),
                        Icon(Icons.cancel, color: Colors.red, size: 15.0),
                        SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            print("Rejected");
                          },
                          child: Text(
                            "Reject",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Container(
            height: 115.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: CircularProfileAvatar(
                      imgurl,
                      animateFromOldImageOnUrlChange: true,
                      radius: 45,
                      onTap: () {
                        AwesomeDialog(
                          // btnOkColor: Colors.purple[400],
                          customHeader: CircularProfileAvatar(imgurl,
                              animateFromOldImageOnUrlChange: true, radius: 55),
                          context: context,
                          animType: AnimType.SCALE,
                          // dialogType: DialogType.INFO,
                          body: Column(
                            children: [
                              Text(
                                "Contact",
                                style: TextStyle(
                                    fontFamily: "Varela", fontSize: 20),
                              ),
                              Text(
                                username,
                                style: TextStyle(
                                    fontFamily: "Varela",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.phoneAlt,
                                        color: Colors.green[700],
                                        size: 32,
                                      ),
                                      onPressed: () {
                                        makeCall("9136091244");
                                      },
                                    ),
                                    SizedBox(width: 15),
                                    IconButton(
                                      icon: Icon(
                                        Icons.message,
                                        color: Colors.amber,
                                        size: 38,
                                      ),
                                      onPressed: () {
                                        message("9136091244");
                                      },
                                    ),
                                    SizedBox(width: 15),
                                    IconButton(
                                      icon: Icon(
                                        Icons.email,
                                        color: Colors.red,
                                        size: 38,
                                      ),
                                      onPressed: () {
                                        email("omigirish1999@gmail.com");
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          btnOkOnPress: () {},
                        )..show();
                      },
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF563734),
                            fontFamily: 'Montserrat',
                            fontSize: 15.0),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        width: 260.0,
                        child: Text(
                          desc,
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Varela',
                              fontSize: 11.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                            fontFamily: 'Montserrat',
                            fontSize: 15.0),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
