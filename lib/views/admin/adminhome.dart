import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/services/auth_services.dart';
import 'package:mini_project/services/storage.dart';
import 'package:mini_project/views/admin/adddetails.dart';
import 'package:mini_project/views/admin/admin.dart';
import 'package:mini_project/views/admin/deleteuser/deleteuser.dart';

import 'package:mini_project/views/staff/loginscreen.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  SecureStorage secureStorage = SecureStorage();
  List<List> services = [
    [
      "Register User",
      'assets/loginimage/undraw_flagged_2uty.png',
    ],
    [
      'Delete User',
      'assets/loginimage/undraw_flagged_2uty.png',
    ],
    ['Enter Student Details', 'assets/loginimage/undraw_flagged_2uty.png'],
  ];
  int index = 0;
  int selectervice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: AlertDialog(
                          title: const Text(
                            'Do you want to Log Out?',
                            style: TextStyle(fontSize: 15),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () async {
                                  final res = await AuthServices.signout();
                                  secureStorage.deleteSecureData('email');
                                  secureStorage.deleteSecureData("Role");
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
                                child: const Text('Log Out')),
                          ],
                        ),
                      );
                    });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.7,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 30),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return FadeInUp(
                          child: serviceContainer(
                              services[index][0], services[index][1], index));
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  serviceContainer(String name, String image, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),

              spreadRadius: selectervice == index ? 1 : 0,
              blurRadius: selectervice == index ? 2 : 0,
              offset: selectervice == index
                  ? const Offset(0, 3)
                  : const Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
              width: 2,
              color: selectervice == index
                  ? Colors.blue
                  : const Color.fromARGB(138, 182, 172, 172)),
          color: selectervice == index
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 255, 255, 255)),
      child: InkWell(
        onTap: () {
          if (index == 0) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AdminPage()));
          } else if (index == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DeleteUser()));
          } else {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddDetails()));
          }
        },
        child: Column(
          children: [
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 10,
            ),
            Positioned(top: 80, child: Text(name))
          ],
        ),
      ),
    );
  }
}
