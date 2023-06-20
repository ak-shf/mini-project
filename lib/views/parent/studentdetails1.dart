import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/admin/adminstudentlist.dart';
import 'package:mini_project/views/parent/studentdetails2.dart';

class StudentDetails1 extends StatefulWidget {
  const StudentDetails1({super.key});

  @override
  State<StudentDetails1> createState() => _StudentDetails1State();
}

class _StudentDetails1State extends State<StudentDetails1> {
  @override
  void initState() {
     getstudent();
    super.initState();
  }

  TextEditingController telephonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pschoolcontroller = TextEditingController();
  TextEditingController reasoncontroller = TextEditingController();
  TextEditingController castecontroller = TextEditingController();
  TextEditingController dpcontroller = TextEditingController();
  TextEditingController aadharcontroller = TextEditingController();

  getstudent() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('student')
        .doc(studentid)
        .get();
    setState(() {
      telephonecontroller.text =
          (snap.data() as Map<String, dynamic>)['telephone'];
      emailcontroller.text = (snap.data() as Map<String, dynamic>)['email'];
      pschoolcontroller.text =
          (snap.data() as Map<String, dynamic>)['previous school'];

      reasoncontroller.text = (snap.data() as Map<String, dynamic>)['Reason'];
      castecontroller.text = (snap.data() as Map<String, dynamic>)['caste'];
      dpcontroller.text =
          (snap.data() as Map<String, dynamic>)['disability percentage'];

      aadharcontroller.text = (snap.data() as Map<String, dynamic>)['aadhar'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const Text(
            'ENTER STUDENT BASIC DETAILS',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: telephonecontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Nearest Telephone'),
                fillColor: Color.fromARGB(120, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailcontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Nearest Email'),
                fillColor: Color.fromARGB(120, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: pschoolcontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.school),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Previous School attended if any'),
                fillColor: Color.fromARGB(120, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: reasoncontroller,
            minLines: 2,
            maxLines: 2,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                label: Text('Reason for leaving'),
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.school),
                fillColor: Color.fromARGB(120, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: castecontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.handshake),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Caste'),
                fillColor: Color.fromARGB(120, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: dpcontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.percent),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Disability Percentage'),
                fillColor: Color.fromARGB(120, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: aadharcontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_2),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Aadhar Number'),
                fillColor: Color.fromARGB(120, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                   // getstudent();
                  FirebaseFirestore.instance
                      .collection('student')
                      .doc(studentid)
                      .update(
                    {
                      "telephone": telephonecontroller.text.trim(),
                      "email": emailcontroller.text.trim(),
                      "previous school": pschoolcontroller.text.trim(),
                      "Reason": reasoncontroller.text.trim(),
                      "caste": castecontroller.text.trim(),
                      "disability percentage": dpcontroller.text.trim(),
                      "aadhar": aadharcontroller.text.trim(),
                    },
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentDetails2()));
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    )));
  }
}
