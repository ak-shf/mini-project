import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestoreservices {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  getrole() async {
    String res = 'something went wrong';
    try {
      String uid = auth.currentUser!.uid; //login uid get
      final data = await firestore.collection('users').doc(uid).get();
      if (data.data() != null) {
        res = data.data()!['role'];
      }
    } catch (e) {
      res = e.toString();
      print(res);
    }
    return res;
  }
}
