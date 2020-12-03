import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection service
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      {String name,
      String email,
      String type,
      String phone,
      String img}) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'email': email,
      'type': type,
      'phone': phone,
      'img': img,
    });
  }
}
