import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthMethods {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final CollectionReference _userCollection =
      firestore.collection("USERS_COLLECTION");
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = _auth.currentUser!;
    return currentUser;
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
    return AppUser("uid", "name", "email", "username", "status", 1);
  }
}
