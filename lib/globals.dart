import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydonationapp/cookie_detail.dart';

String imgurl = "nullurl";
String uid = "nulluid";

DocumentReference userinst;
DocumentSnapshot userdata;
String calledfrom = "";
