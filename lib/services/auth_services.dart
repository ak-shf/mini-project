import 'dart:typed_data';
import "package:mini_project/usermodel/modle.dart" as model;

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
      required int value,
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
      model.Staff staff = model.Staff(
          email: email,
          address: address,
          name: name,
          mobile: mobile,
          uid: cred.user?.uid,
          role: role);
      model.Parent parent = model.Parent(
          email: email,
          address: address,
          name: name,
          mobile: mobile,
          uid: cred.user?.uid,
          role: role);
      // model.Admin admin = model.Admin(
      // email: email,
      // address: address,
      // name: name,
      // mobile: mobile,
      // uid: cred.user?.uid,
      // role: role);
      model.Doctor doctor = model.Doctor(
          email: email,
          address: address,
          name: name,
          mobile: mobile,
          uid: cred.user?.uid,
          role: role);

      if (value == 1) {
        await FirebaseFirestore.instance
            .collection('staff')
            .doc(cred.user?.uid)
            .set(staff.toJson());
      } else if (value == 2) {
        await FirebaseFirestore.instance
            .collection('partners')
            .doc(cred.user?.uid)
            .set(parent.toJson());
      } else {
        await FirebaseFirestore.instance
            .collection('doctor')
            .doc(cred.user?.uid)
            .set(doctor.toJson());
      }

      res = 'succes ';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
  calander(){}
}
