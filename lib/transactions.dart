import 'package:flutter/material.dart';
import 'package:mydonationapp/globals.dart' as global;
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
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
      historylist.add(_transactionlog(
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
                    'Transactions',
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
            Container(
                height: MediaQuery.of(context).size.height - 370,
                child: ListView(children: historylist)),
            SizedBox(height: 10.0),
          ],
        ));
  }

  _transactionlog(String imgurl, String username, String desc, String price,
      String status) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15),
      child: Stack(
        children: <Widget>[
          Container(
            height: 95.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: status == "pending"
                  ? Colors.yellow[50]
                  : status == "rejected"
                      ? Colors.red[50]
                      : Colors.teal[50],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircularProfileAvatar(
                    imgurl,
                    animateFromOldImageOnUrlChange: true,
                    radius: 35,
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
                              fontFamily: 'Varella',
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 5.0),
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
