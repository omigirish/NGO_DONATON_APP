import 'package:flutter/material.dart';
import 'package:mydonationapp/globals.dart' as global;

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
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
            _listItem(
                'assets/steak.png',
                'Chocolate lemon cup cake',
                'The sour and sweetness of the lemon neutralizes the sweetness of the cream',
                '\$18.0',
                134,
                2412,
                '2-3per'),
            SizedBox(height: 10.0),
          ],
        ));
  }

  _listItem(String imgPath, String foodName, String desc, String price,
      int likes, int calCount, String serving) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 170.0,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: 15.0,
            top: 30.0,
            child: Container(
              height: 125.0,
              width: MediaQuery.of(context).size.width - 15.0,
              decoration: BoxDecoration(
                color: Color(0xFFF9EFEB),
                borderRadius: BorderRadius.circular(5.0),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey.withOpacity(0.3),
                //       spreadRadius: 3.0,
                //       blurRadius: 3.0)
                // ],
              ),
              // child: Text('Helloworld'),
            ),
          ),
          Positioned(
              left: 95.0,
              top: 64.0,
              child: Container(
                height: 105.0,
                width: MediaQuery.of(context).size.width - 15.0,
                decoration: BoxDecoration(
                    color: Color(0xFFF9EFEB),
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
                        Icon(Icons.favorite,
                            color: Color(0xFFF75A4C), size: 15.0),
                        SizedBox(width: 5.0),
                        Text(
                          likes.toString(),
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.grey),
                        ),
                        SizedBox(width: 25.0),
                        Icon(Icons.account_box,
                            color: Color(0xFFF75A4C), size: 15.0),
                        SizedBox(width: 5.0),
                        Text(
                          calCount.toString() + 'cal',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.grey),
                        ),
                        SizedBox(width: 25.0),
                        Icon(Icons.play_circle_outline,
                            color: Color(0xFFF75A4C), size: 15.0),
                        SizedBox(width: 5.0),
                        Text(
                          serving,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Container(
            height: 125.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Image.asset(imgPath, fit: BoxFit.cover),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        foodName,
                        style: TextStyle(
                            color: Color(0xFF563734),
                            fontFamily: 'Montserrat',
                            fontSize: 15.0),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        width: 175.0,
                        child: Text(
                          desc,
                          style: TextStyle(
                              color: Color(0xFFB2A9A9),
                              fontFamily: 'Montserrat',
                              fontSize: 11.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        price.toString(),
                        style: TextStyle(
                            color: Color(0xFFF76053),
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
