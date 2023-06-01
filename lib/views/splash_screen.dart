import 'package:flutter/material.dart';
import 'package:mini_project/services/storage.dart';
import 'package:mini_project/views/admin/adminhome.dart';
import 'package:mini_project/views/doctor/doctorhome.dart';
import 'package:mini_project/views/staff/loginscreen.dart';
import 'package:mini_project/views/staff/staffirst.dart';

String? finalEmail, finalRole;

class SplashScreen extends StatefulWidget {
  final String? title;

  const SplashScreen({super.key, this.title});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorage secureStorage = SecureStorage();
  Future<void> splashes() async {
    await Future.delayed(const Duration(seconds: 2));
    const SplashScreen();
    if (finalEmail == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SelectionPage()));
    } else if (finalRole.toString() == 'STAFF' && finalEmail != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const StaffFirst()));
    } else if (finalRole.toString() == 'ADMIN' && finalEmail != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AdminHome()));
    } else if (finalRole.toString() == 'DOCTOR' && finalEmail != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DoctorFirst()));
    } else if (finalRole.toString() == 'PARENT' && finalEmail != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const StaffFirst()));
    }

    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const SelectionPage()));
  }

  @override
  void initState() {
    secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
    });
    secureStorage.readSecureData('role').then((value) {
      finalRole = value;
    });
    // TODO: implement initState
    splashes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/asha nilayam.png')),
    );
  }
}
