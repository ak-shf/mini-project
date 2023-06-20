import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/resources/store.dart';
import 'package:mini_project/services/storage.dart';
import 'package:mini_project/views/staff/staffirst.dart';
import 'package:mini_project/resources/utils.dart';

String? finalrole;

class StaffDetails extends StatefulWidget {
  const StaffDetails({super.key});

  @override
  State<StaffDetails> createState() => _StaffDetailsState();
}

class _StaffDetailsState extends State<StaffDetails> {
  final SecureStorage secureStorage = SecureStorage();
  Uint8List? _image;
  TextEditingController datecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController email1controller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  String image = "";
  // String? email=email1controller.text;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveprofile() async {
    String resp = await Storedata().addImage(file: _image!);
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getstaff();

    secureStorage.readSecureData('role').then((value) {
      finalrole = value;
    });
  }

  getstaff() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('staff')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      email1controller.text =
          (snap.data() as Map<String, dynamic>)['personalemail'];
      namecontroller.text = (snap.data() as Map<String, dynamic>)['name'];
      addresscontroller.text = (snap.data() as Map<String, dynamic>)['address'];
      phonecontroller.text = (snap.data() as Map<String, dynamic>)['mobile'];
      datecontroller.text =
          (snap.data() as Map<String, dynamic>)['dateofbirth'];
      image = (snap.data() as Map<String, dynamic>)['imageLink'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'ENTER YOUR BASIC DETAILS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
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
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover),
                                color: Colors.black,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100))),
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
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: namecontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('User Name'),
                      fillColor: Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email1controller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Email'),
                      fillColor: Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phonecontroller,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Contact'),
                      fillColor: Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
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
                                datecontroller.text = DateFormat('dd-MM-yyyy')
                                    .format(DatePicker!);
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
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 85, 64, 220))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
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
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                    ),
                    onPressed: () {
                      saveprofile();
                      // role() {
                      //   String roles = AuthServices().currentuser().toString();
                      //   print(roles);
                      // }

                      secureStorage.writeSecureData('uploadStaff',
                          FirebaseAuth.instance.currentUser!.uid);

                      FirebaseFirestore.instance
                          .collection('staff')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update(
                        {
                          "name": namecontroller.text.trim(),
                          "personalemail": email1controller.text.trim(),
                          "mobile": phonecontroller.text.trim(),
                          "address": addresscontroller.text.trim(),
                          "dateofbirth": datecontroller.text.trim(),
                        },
                      );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StaffFirst()));
                    },
                    child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text(
                          'UPLOAD',
                          style: TextStyle(fontSize: 20),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
