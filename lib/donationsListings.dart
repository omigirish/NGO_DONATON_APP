import 'package:flutter/material.dart';
import 'package:mydonationapp/cookie_detail.dart';
import 'package:mydonationapp/globals.dart' as global;

class Donations extends StatefulWidget {
  @override
  _DonationsState createState() => _DonationsState();
}

class _DonationsState extends State<Donations>
    with SingleTickerProviderStateMixin {
  List<Widget> donorList = [];
  List<Widget> ngoList = [];
  TabController tabController;

  @override
  void initState() {
    global.getdata();
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    donorList = []; //Donot Remove at any cost.....!!!!!
    for (var item in global.items) {
      print(item);
      donorList.add(_buildDonationCard(
          context,
          item['itemcategory'],
          item['itemname'],
          int.parse(item['itemcount']),
          global.username,
          item['itemphoto']));
    }

    return Scaffold(
      // backgroundColor: Color(0xFFF9EFEB),
      backgroundColor: Colors.black87,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 220.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      // colors: [Color(0x000000), Color(0xBB923CB5)],
                      colors: [
                        Colors.purple[500], //Color(0xBB923CB5)
                        Color(0x21212),
                      ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(75.0)),
                  // color: Color(0xFFFD7465)),
                  // color: Colors.grey[900],
                ),
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
                  'Donation Listings',
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
                      hintText: 'Search for an item',
                      hintStyle:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 14.0),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              )
            ],
          ),
          TabBar(
            controller: tabController,
            indicatorColor: Colors.purple, //Color(0xFFFE8A7E)
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.0,
            isScrollable: true,
            labelColor: Colors.purple, //Color(0xFF440206)
            unselectedLabelColor: Colors.white, //Color(0xFF440206)
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Listed By You',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'NGO Requests',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.9,
                    children: donorList),
                ListView(children: ngoList),
              ],
            ),
          ),
        ],
      ),
    );
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
              child: Text('Helloworld'),
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

_buildDonationCard(BuildContext context, String category, String itemName,
    int qty, String name, String imgurl) {
  return Padding(
    padding: EdgeInsets.only(top: 8.0, left: 15.0, bottom: 10.0, right: 15),
    child: GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CookieDetail(
                imgurl: imgurl,
                cookieprice: "Qty: " + qty.toString(),
                cookiename: itemName),
          ),
        ),
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 15.0, top: 5.0),
                  child: Icon(
                    Icons.food_bank_rounded,
                    color: Colors.grey[900],
                    size: 110,
                  ),
                ),
              ],
            ),
            Container(
              width: 125.0,
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                itemName,
                style: TextStyle(
                    fontFamily: "Varela",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Qty: ' + qty.toString(),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Varela',
                    color: Colors.purple),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_box,
                        color: Color(0xFFF75A4C), size: 15.0),
                    SizedBox(width: 5.0),
                    Text(
                      name,
                      style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ))
          ],
        ),
      ),
    ),
  );
}
