import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthMethods {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = _auth.currentUser!;
    return currentUser;
  }

  static Future<AppUser> userLogin(String email) async {
    AppUser appUser;
    appUser = AppUser(_auth.currentUser!.uid.toString(), email, true);
    final docUser = _userCollection.doc(appUser.uid);
    docUser.set(appUser.toMap());
    return appUser;
  }

  static Future<void> userSignup(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    AppUser appUser = AppUser(auth.currentUser!.uid.toString(), email, true);
    final docUser = _userCollection.doc(appUser.uid);

    docUser.set(appUser.toMap());
    return;
  }

  static Future<AppUser> readUserFromFirestore(String uid) async {
    final docUser = _userCollection.doc(uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return AppUser.fromMap(snapshot.data() as Map<String, dynamic>);
    } else {
      return AppUser("uid", "email", true);
    }
  }

  static Future<AppUser> getUserDetails() async {
    try {
      User currentUser = await getCurrentUser();

      final doc = _userCollection.doc(currentUser.uid);
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
  }
}
