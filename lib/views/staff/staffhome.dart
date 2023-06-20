import 'dart:async';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/staff/attendence.dart';
import 'package:mini_project/views/staff/medicalreport.dart';
import 'package:mini_project/views/staff/search.dart';
import 'package:mini_project/views/staff/veruthe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            height: 40,
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return FadeInUp(
                          child: serviceContainer(
                              services[index][0], services[index][1], index));
                    }),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     NestedScrollView(
          //         headerSliverBuilder: (context, bool innerBoxScrolled) {
          //           return [];
          //         },
          //         body: const Center()),
          //     const SizedBox(
          //       width: 15,
          //     ),
          //     const Text('MY CLASS',
          //         style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          //   ],
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SizedBox(
                width: 30,
              ),
              Text('MY CLASS',
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
                              'Academics',
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
                      builder: (contact) => const SearchScreen()));
            },
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
             onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contact) => const Report()));
            },
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
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
                            'Medical',
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
                .push(MaterialPageRoute(builder: (context) => AttendancePage()));
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
