import 'package:flutter/material.dart';
import 'package:mini_project/services/auth_services.dart';
import 'package:mini_project/views/staff/loginscreen.dart';


class ParentProfile extends StatelessWidget {
  const ParentProfile({super.key});

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
              color: Colors.blue,
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
                        children: const [
                          Text(
                            'Abel',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Parent',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10)),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('DATE OF BIRTH:09-12-2002',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11)),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('aakarsh@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11)),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('9995513825',
                          style: TextStyle(
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
                              final res = await AuthServices.signout();
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
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg'),
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
