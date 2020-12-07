import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydonationapp/authenticate.dart';
import 'package:mydonationapp/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mydonationapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:mydonationapp/models/user.dart';
import 'package:mydonationapp/globals.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseMessaging _messaging = FirebaseMessaging();

//  _messaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         _showItemDialog(message);
//       },
//       onBackgroundMessage: myBackgroundMessageHandler,
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         _navigateToItemDetail(message);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//         _navigateToItemDetail(message);
//       },
//     );
  @override
  Widget build(BuildContext context) {
    _messaging.getToken().then((token) => print("Token:" + token));
    return MultiProvider(
      providers: [
        StreamProvider<User>(create: (_) => AuthService().user),
        StreamProvider<QuerySnapshot>(create: (_) => DatabaseService().users),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Authenticate(),
      ),
    );
  }
}
