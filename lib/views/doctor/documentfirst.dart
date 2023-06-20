import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/doctor/doctorsearch.dart';
import 'package:mini_project/views/doctor/view.dart';

String doctorStudent="";

class DocumentFirst extends StatefulWidget {
  const DocumentFirst({super.key, required uid});

  @override
  State<DocumentFirst> createState() => _DocumentFirstState();
}

class _DocumentFirstState extends State<DocumentFirst> {
  String s = "";
  @override
  void initState() {
    super.initState();
    getStudnet();
  }

  String name = "";
  String image = "";
  String uid = "";
  getStudnet() async {
    print('s');
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('student')
        .doc(studentnow)
        .get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['name'];
      uid = (snap.data() as Map<String, dynamic>)['uid'];

      image = (snap.data() as Map<String, dynamic>)['imageLink'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image == ""
                    ? const CircleAvatar(
                        radius: 50,
                        // backgroundImage: MemoryImage(image),
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover),
                            color: Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                      ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name.toUpperCase(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PdfViews(uid: uid)));
                setState(() {
                  doctorStudent = uid;
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Text(
                    'View Record',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
