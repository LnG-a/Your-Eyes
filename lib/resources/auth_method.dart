import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthMethods {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static late AppUser currentAppUser;

  static Future<void> initCurrentAppUser() async {
    currentAppUser = AppUser("uid", "email", true);
    currentAppUser = await readUserFromFirestore();
  }

  static Future<void> userLogin(String email, bool isBlind) async {
    final docUser = _userCollection.doc(_auth.currentUser!.uid);
    final snapshot = await docUser.get();

    AppUser appUser =
        AppUser(_auth.currentUser!.uid.toString(), email, isBlind);
    docUser.set(appUser.toMap());

    // if (snapshot.exists) {
    //   appUser = AppUser.fromMap(snapshot.data() as Map<String, dynamic>);
    // }

    currentAppUser = appUser;
  }

  static Future<void> userSignup(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    AppUser appUser = AppUser(auth.currentUser!.uid.toString(), email, true);
    final docUser = _userCollection.doc(appUser.uid);

    docUser.set(appUser.toMap());
    return;
  }

  static Future<AppUser> readUserFromFirestore() async {
    final docUser = _userCollection.doc(_auth.currentUser!.uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return AppUser.fromMap(snapshot.data() as Map<String, dynamic>);
    } else {
      return AppUser("uid", "email", true);
    }
  }

  static Future<AppUser> getUserDetails() async {
    try {
      final doc = _userCollection.doc(_auth.currentUser!.uid);
      final snapshot = await doc.get();

      if (snapshot.exists) {
        return AppUser.fromMap(snapshot.data() as Map<String, dynamic>);
      }
    } catch (e) {
      rethrow;
    }
    return AppUser("uid", "email", true);
  }

  static void userLogout() {
    _auth.signOut();
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
