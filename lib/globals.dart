import 'package:cloud_firestore/cloud_firestore.dart';

String imgurl;
String uid;
String username;
String type;

String itemname = "";
String itempickup = "";
String itemcount = "1";
int itemcategory = 0;
String itemphoto = "";

var items = [];
var ngoitemlist = [];
// var ngoitems = [];

DocumentReference userinst;
DocumentSnapshot userdata;
CollectionReference ngoinst;
QuerySnapshot ngodata;
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

getngodata() async {
  List ngoitems = new List();
  ngodata = await ngoinst.where('type', isEqualTo: 'ngo').get();
  for (var data in ngodata.docs) {
    try {
      if (data.data()['items'] != null) ngoitems.add(data.data()['items']);
    } catch (e) {
      // print(e);
    }
  }
  ngoitemlist = ngoitems;
}

cleardata() {
  imgurl = "";
  uid = "";
  username = "";
  type = "";

  itemname = "";
  itempickup = "";
  itemcount = "1";
  itemcategory = 0;
  itemphoto = "";

  items = [];
  // ngoitems = [];

  calledfrom = "";
}
