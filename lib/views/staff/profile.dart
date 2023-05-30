import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/services/auth_services.dart';
import 'package:mini_project/services/storage.dart';
import 'package:mini_project/views/staff/loginscreen.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  SecureStorage secureStorage = SecureStorage();
  String email = "";
  String name = "";
  String phone = "";
  String address = "";
  String dateofbirth = "";
  String image = "";
  // String? email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getname();
  }

  getname() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('staff')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      email = (snap.data() as Map<String, dynamic>)['email'];
      name = (snap.data() as Map<String, dynamic>)['name'];
      address = (snap.data() as Map<String, dynamic>)['address'];
      phone = (snap.data() as Map<String, dynamic>)['mobile'];
      dateofbirth = (snap.data() as Map<String, dynamic>)['dateofbirth'];
      image = (snap.data() as Map<String, dynamic>)['imageLink'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    double ss = (sizeWidth - 300) / 2;
    double radio = (sizeWidth - 50) / 2;

    return Scaffold(
      body: Stack(
        //alignment: Alignment.center,
        children: [
          Container(
            height: sizeHeight,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          Container(
            height: 160,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(50),
              //   bottomRight: Radius.circular(50),
              // ),
              color: Color.fromARGB(255, 39, 49, 244),
            ),
          ),
          Positioned(
            top: 80,
            child: Row(
              children: [
                SizedBox(
                  height: 300,
                  width: ss,
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(offset: Offset(5, 5), blurRadius: 5)
                      ]),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('ASSISTANT PROFFESSOR:COMPUTER SCIENCE',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10)),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('STAFF id:#25',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(dateofbirth,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(email,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(phone,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11)),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 100,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final res =
                                  await AuthServices.signout().whenComplete(() {
                                secureStorage.deleteSecureData('email');
                                secureStorage.deleteSecureData('role');
                              });
                              initState() {
                                secureStorage.deleteSecureData('email');
                                secureStorage.deleteSecureData('role');
                              }

                              if (res == null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectionPage()));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: res));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(width: 1),
                              foregroundColor: Colors.black,
                              backgroundColor:
                                  const Color.fromARGB(245, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  "logout",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Icon(
                                  Icons.logout,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: ss,
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            child: Row(
              children: [
                SizedBox(
                  //color: Colors.amber,
                  height: 50,
                  width: radio - 23,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(image),
                ),
                SizedBox(
                  // color: Colors.amber,
                  height: 50,
                  width: radio,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
