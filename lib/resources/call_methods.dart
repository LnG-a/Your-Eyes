import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_eyes/models/call.dart';

class CallMethods {
  final CollectionReference callCollection =
      FirebaseFirestore.instance.collection("calls");

  Stream<DocumentSnapshot> callStream({required String uid}) =>
      callCollection.doc(uid).snapshots();

  Future<bool> makeCall({required Call call}) async {
    try {
      call.hasDialled = true;
      Map<String, dynamic> hasDialledMap = call.toMap();

      call.hasDialled = false;
      Map<String, dynamic> hasNotDialledMap = call.toMap();

      await callCollection.doc(call.callerId).set(hasDialledMap);
      await callCollection.doc(call.receiverId).set(hasNotDialledMap);
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }

  Future<bool> endCall({required Call call}) async {
    try {
      await callCollection.doc(call.callerId).delete();
      await callCollection.doc(call.receiverId).delete();
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
}
