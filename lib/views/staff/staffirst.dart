import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/services/auth_services.dart';
import 'package:mini_project/views/calander/calanderview.dart';
import 'package:mini_project/views/staff/loginscreen.dart';

import 'package:mini_project/views/staff/staffhome.dart';
import 'package:mini_project/views/staff/profile.dart';

var scafflodkey = GlobalKey<ScaffoldState>();

class StaffFirst extends StatefulWidget {
  const StaffFirst({super.key});

  @override
  State<StaffFirst> createState() => _StaffFirstState();
}

class _StaffFirstState extends State<StaffFirst> {
  List pages = [const HomeScreen(), const MyHomePage(), const MyProfile()];
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
                color: Colors.white,
                size: 35,
              ),
            )),
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 39, 49, 244),
        title: const Text(
          'ashaNilayam',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
            ),
          )
        ],
      ),
      drawer: Drawer(
        width: 290,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
        ),
        // width: 280,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            SizedBox(
              height: 180,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(color: Colors.black),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(image),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // // Text(
                              //   "+91-$phone",
                              //   style: const TextStyle(
                              //       color: Color.fromARGB(255, 255, 255, 255)),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const ListTile(
              title: Text('CALANDER'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                height: 2,
                // color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text('ATTENDENCE'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                height: 2,
                // color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text('SELECT STUDENTS'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(

                  // color: Colors.black,
                  ),
            ),
            ListTile(
              title: const Text('LOG OUT'),
              onTap: () async {
                final res = await AuthServices.signout();
                if (res == null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SelectionPage()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: res));
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                height: 2,
              ),
            ),
          ],
        ),
      ),
      body: pages[myIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.white,
        height: 48,
        // animationCurve: Curves.bounceIn,
        color: const Color.fromARGB(255, 39, 49, 244),
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
