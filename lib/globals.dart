import 'package:cloud_firestore/cloud_firestore.dart';

String imgurl;
String uid;
String username;
String type;

String itemname = "";
String itempickup = "";
String itemcount = "";
int itemcategory = -1;
String itemphoto = "";

var items = [];

DocumentReference userinst;
DocumentSnapshot userdata;
String calledfrom = "";

getdata() async {
  userdata = await userinst.get();
  imgurl = userdata.get('img');
  type = userdata.get('type');
  try {
    items = userdata.get('items');
  } catch (e) {
    print("No items for this account");
  }
  username = userdata.get('name');
}

cleardata() {
  imgurl = "";
  uid = "";
  username = "";
  type = "";

  itemname = "";
  itempickup = "";
  itemcount = "";
  itemcategory = -1;
  itemphoto = "";

  items = [];

  calledfrom = "";
}
