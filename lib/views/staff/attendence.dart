import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});
  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final CollectionReference studentsCollection =
      FirebaseFirestore.instance.collection('student');
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final List<String> studentList = [];

  @override
  void initState() {
    super.initState();
    fetchStudentList();
  }

  Future<void> fetchStudentList() async {
    QuerySnapshot querySnapshot = await studentsCollection.get();
    setState(() {
      studentList.addAll(querySnapshot.docs.map((doc) => doc.id).toList());
    });
  }

  Future<void> markAttendance(String studentId, bool present) async {
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${now.month}-${now.day}";

    await studentsCollection
        .doc(studentId)
        .collection('attendance')
        .doc(formattedDate)
        .set({
      'present': present,
      'timestamp': FieldValue.serverTimestamp(),
    });
    setState(() {});
  }

  Future<bool?> checkAttendance(String studentId) async {
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${now.month}-${now.day}";

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await studentsCollection
            .doc(studentId)
            .collection('attendance')
            .doc(formattedDate)
            .get();

    if (documentSnapshot.exists) {
      return documentSnapshot.data()!['present'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Attendance'),
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          String studentId = studentList[index];
          return ListTile(
            title: Text(studentId),
            trailing: currentUser != null
                ? FutureBuilder<bool?>(
                    future: checkAttendance(studentId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        bool? present = snapshot.data;
                        return Checkbox(
                          value: present,
                          onChanged: (bool? value) {
                            markAttendance(studentId, value ?? false);
                          },
                        );
                      } else {
                        return Checkbox(
                          value: false,
                          onChanged: (bool? value) {
                            markAttendance(studentId, value ?? false);
                          },
                        );
                      }
                    },
                  )
                : null,
          );
        },
      ),
    );
  }
}
