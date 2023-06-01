import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestoreservices {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
   getrole() async {
    String res = 'something went wrong';
    try {
      String uid = auth.currentUser!.uid; //login uid get
      final data = await firestore.collection('staff').doc(uid).get();
      final data1 = await firestore.collection('parent').doc(uid).get();
      final data2 = await firestore.collection('doctor').doc(uid).get();
      final data3 = await firestore.collection('users').doc(uid).get();
      if (data.data() != null) {
        res = data.data()!['role'];
      } else if (data1.data() != null) {
        res = data1.data()!['role'];
      } else if (data2.data() != null) {
        res = data2.data()!['role'];
      } else if (data3.data() != null) {
        res = data3.data()!['role'];
      }
    } catch (e) {
      res = e.toString();
      print(res);
    }
    return res;
  }
}
