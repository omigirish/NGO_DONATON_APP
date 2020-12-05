import 'package:cloud_firestore/cloud_firestore.dart';

String imgurl;
String uid;
String username;
String type;

String itemname = "";
String itempickup = "";
String itemcount = "";
String itemcategory = "";
String itemphoto = "";

var items;

DocumentReference userinst;
DocumentSnapshot userdata;
String calledfrom = "";

getdata() async {
  userdata = await userinst.get();
  imgurl = userdata.get('img');
  type = userdata.get('type');
  items = userdata.get('items');
  username = userdata.get('name');
}
