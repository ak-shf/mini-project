import 'package:flutter/material.dart';
import 'package:mini_project/views/calander/calanderview.dart';
import 'package:mini_project/views/doctor/doctorview.dart';

import 'doctorprofille.dart';

class DoctorFirst extends StatefulWidget {
  const DoctorFirst({super.key});

  @override
  State<DoctorFirst> createState() => _DoctorFirstState();
}

class _DoctorFirstState extends State<DoctorFirst> {
  List pages = [const DoctorHome(), const MyHomePage(), const DoctorProfile()];
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 37, 146, 255),
        title: const Text('ashaNilayam'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15, top: 10, bottom: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg'),
            ),
          )
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: pages[myIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          showUnselectedLabels: false,
          selectedItemColor: const Color.fromARGB(255, 40, 39, 39),
          unselectedItemColor: const Color.fromARGB(255, 153, 148, 148),
          showSelectedLabels: false,
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
                backgroundColor: Color.fromARGB(255, 255, 255, 255)),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'home',
                backgroundColor: Color.fromARGB(255, 255, 255, 255)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
                backgroundColor: Color.fromARGB(255, 255, 255, 255))
          ]),
    );
  }
}
