import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_project/views/doctor/doctorsearch.dart';
import 'package:mini_project/views/staff/veruthe.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  List<List> services = [
    [
      'Add Student',
      'assets/loginimage/undraw_flagged_2uty.png',
    ],
    [
      'attendence',
      'assets/loginimage/undraw_flagged_2uty.png',
    ],
    ['add', 'assets/loginimage/undraw_flagged_2uty.png'],
  ];
  int index = 0;
  int selectervice = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        selectervice = Random().nextInt(services.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: SpeedDial(
      //   visible: true,
      //   animatedIcon: AnimatedIcons.add_event,
      //   label: const Text('edit'),
      //   children: [
      //     SpeedDialChild(child: const Icon(Icons.person), label: 'Student'),
      //     SpeedDialChild(child: const Icon(Icons.person_2), label: 'Doctor'),
      //     SpeedDialChild(child: const Icon(Icons.person_4), label: 'My Profile')
      //   ],
      // ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SizedBox(
                width: 30,
              ),
              Text('Medical Report',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 300,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/yuriy-kovalev-nN1HSDtKdlw-unsplash.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: 100,
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 30,
                        child: Row(
                          children: [
                            const Text(
                              'Report',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              color: Colors.white,
                              iconSize: 15,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contact) => const DoctorSearch()));
            },
          ),
          const SizedBox(
            height: 15,
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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const veruthe()));
          } else if (index == 1) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const veruthe()));
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const veruthe()));
          }
        },
        child: Column(
          children: [
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 10,
            ),
            Positioned(top: 70, child: Text(name))
          ],
        ),
      ),
    );
  }
}
