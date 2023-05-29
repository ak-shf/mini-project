import 'package:flutter/material.dart';

import 'package:mini_project/views/staff/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  final String? title;

  const SplashScreen({super.key, this.title});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> splashes() async {
    await Future.delayed(const Duration(seconds: 2));
    const SplashScreen();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const SelectionPage()));
  }

  @override
  void initState() {
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
