import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/staff/calander.dart';

import 'package:mini_project/views/staff/staffhome.dart';
import 'package:mini_project/views/staff/profile.dart';

var scafflodkey = GlobalKey<ScaffoldState>();

class StaffFirst extends StatefulWidget {
  const StaffFirst({super.key});

  @override
  State<StaffFirst> createState() => _StaffFirstState();
}

class _StaffFirstState extends State<StaffFirst> {
  List pages = [const HomeScreen(), const MyCalander(), const MyProfile()];
  int myIndex = 0;
  String image = "";
  String email = "";
  String name = "";
  String phone = "";
  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('staff')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      image = (snap.data() as Map<String, dynamic>)['imageLink'];
      email = (snap.data() as Map<String, dynamic>)['personalemail'];
      name = (snap.data() as Map<String, dynamic>)['name'];
      phone = (snap.data() as Map<String, dynamic>)['mobile'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafflodkey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              scafflodkey.currentState?.openDrawer();
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 35,
              ),
            )),
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'ashaNilayam',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
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
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Container(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(image),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          email,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "+91-$phone",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
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
                label: 'event',
                backgroundColor: Color.fromARGB(255, 255, 255, 255)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
                backgroundColor: Color.fromARGB(255, 255, 255, 255))
          ]),
    );
  }
}
