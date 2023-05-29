import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mini_project/views/staff/studentlist.dart';

class ParentView extends StatefulWidget {
  const ParentView({super.key});

  @override
  State<ParentView> createState() => _ParentViewState();
}

class _ParentViewState extends State<ParentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        visible: true,
        animatedIcon: AnimatedIcons.add_event,
        label: const Text('edit'),
        children: [
          SpeedDialChild(
              child: const Icon(Icons.person_4), label: 'My Profile'),
          SpeedDialChild(child: const Icon(Icons.person), label: 'Student'),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, right: 30),
              child: Container(
                height: 180,
                width: 300,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Aleena Sain',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Doctor',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 155, 153, 153)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                Text('student record',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
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
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contact) => const StudentList()));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
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
                            'Student Records',
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
            const SizedBox(
              height: 15,
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
                        'Medical Records',
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
            const SizedBox(
              height: 15,
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
                        'Academic Records',
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
    );
  }
}
