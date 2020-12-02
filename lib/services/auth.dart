import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:mydonationapp/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //create user obj based on firebase user
  User _userFromFirebaseUser(auth.User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth
        .authStateChanges()
        .map((auth.User user) => _userFromFirebaseUser(user));
  }

  //sign in with anon
  Future signInAnon() async {
    try {
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //signin with email password
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      auth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //signin with google
  Future googleSignIn() async {
    try {
      GoogleSignInAccount googleuser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleauth = await googleuser.authentication;
      auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
          accessToken: googleauth.accessToken, idToken: googleauth.idToken);
      auth.UserCredential result = await _auth.signInWithCredential(credential);
      auth.User user = result.user;
      print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
