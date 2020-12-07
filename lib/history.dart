import 'package:flutter/material.dart';
import 'package:mydonationapp/globals.dart' as global;
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Widget> historylist = [];
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    historylist = [];
    global.requestlistuser.forEach((data) {
      historylist.add(_pushnotification(
        data['donorimg'],
        data['donorname'],
        data['itemname'],
        'Qty: ' + data['quantity'],
        data['status'],
      ));
    });
    Future.delayed(Duration(seconds: 1), () async {
      global.getrequests('uid');
      setState(() {});
    });
    return Scaffold(
        backgroundColor: Colors.black87,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 160.0,
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
                    'Donation History',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 28.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            for (var item in historylist) item,
            SizedBox(height: 10.0),
          ],
        ));
  }

  _pushnotification(String imgurl, String username, String desc, String price,
      String status) {
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
                            print("Accepted");
                          },
                          child: Text(
                            status,
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
                  CircularProfileAvatar(
                    imgurl,
                    animateFromOldImageOnUrlChange: true,
                    radius: 45,
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
                              fontFamily: 'Montserrat',
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
