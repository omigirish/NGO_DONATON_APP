import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydonationapp/authenticate.dart';
import 'package:mydonationapp/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mydonationapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:mydonationapp/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
