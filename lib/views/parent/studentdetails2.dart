import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/admin/adminhome.dart';
import 'package:mini_project/views/admin/adminstudentlist.dart';

class StudentDetails2 extends StatefulWidget {
  const StudentDetails2({super.key});

  @override
  State<StudentDetails2> createState() => _StudentDetails2State();
}

class _StudentDetails2State extends State<StudentDetails2> {
  String? valuechoose;
  String? valuechoose1;
  String? valuechoose2;
  String? valuechoose3;
  String? valuechoose4;
  String? yesno1;

  List selectList = [
    "Full Term",
    "Premature ",
    "Delayed Labour",
    "Caesarlan ",
    "Foreceps"
  ];
  List previous = [
    "Convulsion",
    "Brain feaver",
    "Brain Injury",
    "Paralysis",
    "Jaundice"
  ];
  List yesno = ["YES", "NO"];
  List physical = ["Sight", "Speech", "Limbs"];
  List temperment = ['cheerful', 'Lovable', 'withdrawn', 'Aggressive'];
  @override
  void initState() {
    getstudent();
    super.initState();
  }

  TextEditingController any = TextEditingController();

  TextEditingController anyheri = TextEditingController();
  TextEditingController special = TextEditingController();

  getstudent() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('student')
        .doc(studentid)
        .collection('case history')
        .doc(studentid)
        .get();
    setState(() {
      any.text =
          (snap.data() as Map<String, dynamic>)['Any other serious illness'];

      anyheri.text = (snap.data() as Map<String, dynamic>)[
          'Any hereditary mental retardation in the family'];
      special.text = (snap.data() as Map<String, dynamic>)['hostel'];
      valuechoose = (snap.data() as Map<String, dynamic>)['Delivery'];
      valuechoose1 = (snap.data() as Map<String, dynamic>)['Previous sickness'];
      valuechoose2 = (snap.data() as Map<String, dynamic>)['Physical Defects'];
      valuechoose3 = (snap.data() as Map<String, dynamic>)['Temperment'];
      yesno1 = (snap.data() as Map<String, dynamic>)['hostel'];
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
            'CASE HISTORY OF THE CHILD',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 35,
          ),
          DropdownButtonFormField(
              decoration: const InputDecoration(
                label: Text('Delivery'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              value: valuechoose,
              onTap: () {},
              hint: const Text('Delivery'),
              items: selectList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  valuechoose = value as String;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
              decoration: const InputDecoration(
                label: Text('Previous sickness'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              value: valuechoose1,
              onTap: () {},
              hint: const Text('Previous sickness'),
              items: previous
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  valuechoose1 = value as String;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: any,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(14),
                label: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                          'Other serious illness during\n infancy of childhood'),
                    ],
                  ),
                ),
                fillColor: const Color.fromARGB(120, 255, 255, 255),
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                errorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220))),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 64, 116, 220)))),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
              decoration: const InputDecoration(
                label: Text('Physical Defects'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              value: valuechoose2,
              onTap: () {},
              hint: const Text('Physical Defects'),
              items: physical
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  valuechoose2 = value as String;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
              decoration: const InputDecoration(
                label: Text('Temperment'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              value: valuechoose3,
              onTap: () {},
              hint: const Text('Temperment'),
              items: temperment
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  valuechoose3 = value as String;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: anyheri,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Any hereditary mental retardation in the family?'),
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
          DropdownButtonFormField(
              decoration: const InputDecoration(
                label: Text('Whether hostel \naccommodation needed?'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              value: yesno1,
              onTap: () {},
              // hint: const Text('Whether hostel \naccommodation needed?'),
              items: yesno
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  yesno1 = value as String;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: special,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                label: Text('Special Remarks'),
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
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: AlertDialog(
                                title: const Text(
                                  'Do you want to Save?',
                                  style: TextStyle(fontSize: 15),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AdminHome()));
                                        FirebaseFirestore.instance
                                            .collection('student')
                                            .doc(studentid)
                                            .collection('case history')
                                            .doc(studentid)
                                            .set(
                                          {
                                            "Delivery": valuechoose.toString(),
                                            "Previous sickness":
                                                valuechoose1.toString(),
                                            "Any other serious illness":
                                                any.text.trim(),
                                            "Any hereditary mental retardation in the family":
                                                anyheri.text.trim(),
                                            "Special Remarks":
                                                special.text.trim(),
                                            "Physical Defects":
                                                valuechoose2.toString(),
                                            "Temperment":
                                                valuechoose3.toString(),
                                            "hostel": yesno1.toString(),
                                          },
                                        );
                                      },
                                      child: const Text('SAVE')),
                                ],
                              ),
                            );
                          });
                    },
                    child: const Text(
                      'SAVE',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ],
          )
        ]),
      ),
    )));
  }
}
