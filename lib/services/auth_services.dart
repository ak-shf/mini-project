import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_project/services/firestoreservices.dart';

class AuthServices {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final firestoreservices = Firestoreservices();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const ROLES = ['STAFF', 'DOCTOR', 'STUDENT', 'ADMIN'];

  static Future<String> login(
      {required String email, required String password}) async {
    String res = "something went wrong";
    try {
      UserCredential cred = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final role = await firestoreservices.getrole();
      res = role;
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  static signout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> signup(
      {String? email,
      String? password,
      String? role,
      String? name,
      String? mobile,
      String? address,
      String? personalemail,
      String? dateofbirth,
      Uint8List? image}) async {
    String res = "something went wrong";
    try {
      UserCredential cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      await _firestore.collection('users').doc(cred.user!.uid).set({
        'role': role,
        'uid': cred.user!.uid,
        "address": address,
        "email": email,
        "mobile": mobile,
        "name": name,
        "personalemail": personalemail,
        "dateofbirth": dateofbirth,
        "image": image
      });

      res = 'succes ';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
