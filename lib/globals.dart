import 'package:cloud_firestore/cloud_firestore.dart';

String imgurl;
String uid;
String type;

DocumentReference userinst;
DocumentSnapshot userdata;
String calledfrom = "";

getdata() async {
  userdata = await userinst.get();
  imgurl = userdata.get('img');
  type = userdata.get('type');
}
