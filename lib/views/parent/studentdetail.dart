import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/resources/store.dart';
import 'package:mini_project/resources/utils.dart';
import 'package:mini_project/views/admin/adminstudentlist.dart';
import 'package:mini_project/views/parent/studentdetails1.dart';

class StudentDetail extends StatefulWidget {
  String uidstudent;
  StudentDetail({super.key, required this.uidstudent});

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  @override
  void initState() {
    getstudent();
    super.initState();
  }

  Future<String> getImage(String image, String profile, Uint8List file) async {
    Reference ref = storage.ref().child(image).child(profile).child(studentid!);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  String image = "";
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  TextEditingController datecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController relegioncontroller = TextEditingController();
  TextEditingController thalukcontroller = TextEditingController();
  TextEditingController villagecontroller = TextEditingController();
  TextEditingController panchayathcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController wardcontroller = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  Future<String> studentImage({required Uint8List file}) async {
    try {
//       secureStorage.readSecureData('role').then((value){
// Finalrole=value;
//       });
      String res = "something went wrong";
      // FirebaseFirestore.instance
      //     .collection('student')
      //     .where('uid', isEqualTo: studentid)
      //     .get();

      String imageUrl = await getImage('Image Folder', "profile Image", file);
      FirebaseFirestore.instance.collection('student').doc(studentid).update(
        {'imageLink': imageUrl},
      );

      res = "success";
      return res;
    } catch (e) {
      return e.toString();
    }
  }

  void saveprofile() async {
    String resp = await studentImage(file: _image!);
  }

  getstudent() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('student')
        .doc(studentid)
        .get();
    setState(() {
      namecontroller.text = (snap.data() as Map<String, dynamic>)['name'];
      addresscontroller.text = (snap.data() as Map<String, dynamic>)['address'];
      relegioncontroller.text =
          (snap.data() as Map<String, dynamic>)['relegion'];

      thalukcontroller.text = (snap.data() as Map<String, dynamic>)['thaluk'];
      wardcontroller.text = (snap.data() as Map<String, dynamic>)['ward'];
      panchayathcontroller.text =
          (snap.data() as Map<String, dynamic>)['panchayath'];

      datecontroller.text =
          (snap.data() as Map<String, dynamic>)['dateofbirth'];
      image = (snap.data() as Map<String, dynamic>)['imageLink'];
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
            height: 20,
          ),
          Stack(children: [
            _image != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: MemoryImage(_image!),
                  )
                : Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover),
                        color: const Color.fromARGB(255, 138, 115, 115),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                  ),
            Positioned(
                top: 50,
                left: 65,
                child: IconButton(
                    onPressed: () async {
                      // ImagePicker imagePicker = ImagePicker();
                      // XFile? file = await imagePicker.pickImage(
                      //     source: ImageSource.gallery);
                      selectImage();
                    },
                    icon: const Icon(Icons.add_a_photo)))
          ]),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: namecontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Name of the Child'),
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
            controller: datecontroller,
            keyboardType: TextInputType.none,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? DatePicker = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2060));
                      if (DatePicker != Null) {
                        setState(() {
                          datecontroller.text =
                              DateFormat('dd-MM-yyyy').format(DatePicker!);
                        });
                      } else {
                        print('erroe');
                      }
                    },
                    icon: const Icon(Icons.calendar_month)),
                isDense: true,
                contentPadding: const EdgeInsets.all(14),
                label: const Text('Date of Birth'),
                fillColor: const Color.fromARGB(120, 255, 255, 255),
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                errorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 85, 64, 220))),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: relegioncontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.handshake),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Religion'),
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
            controller: thalukcontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.handshake),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Thaluk'),
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
          // TextFormField(
          //   controller: villagecontroller,
          //   decoration: const InputDecoration(
          //       prefixIcon: Icon(Icons.handshake),
          //       isDense: true,
          //       contentPadding: EdgeInsets.all(14),
          //       label: Text('Village'),
          //       fillColor: Color.fromARGB(120, 255, 255, 255),
          //       filled: true,
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(20)),
          //           borderSide:
          //               BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
          //       errorBorder: OutlineInputBorder(
          //           borderSide:
          //               BorderSide(color: Color.fromARGB(255, 64, 116, 220))),
          //       focusedBorder: OutlineInputBorder(
          //           borderSide:
          //               BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          // ),

          TextFormField(
            controller: panchayathcontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.handshake),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Panchayat'),
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
            controller: wardcontroller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.handshake),
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Ward'),
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
            controller: addresscontroller,
            minLines: 2,
            maxLines: 2,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                label: Text('Address'),
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.home),
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
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  saveprofile();
                  getstudent();
                  FirebaseFirestore.instance
                      .collection('student')
                      .doc(studentid)
                      .update(
                    {
                      "name": namecontroller.text.trim(),
                      "relegion": relegioncontroller.text.trim(),
                      "thaluk": thalukcontroller.text.trim(),
                      // "village": villagecontroller.text.trim(),
                      "dateofbirth": datecontroller.text.trim(),
                      "panchayath": panchayathcontroller.text.trim(),
                      "ward": wardcontroller.text.trim(),
                      "address": addresscontroller.text.trim(),
                    },
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentDetails1()));
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
