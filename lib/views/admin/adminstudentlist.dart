import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/parent/studentdetail.dart';

String? studentid;

class AdminSearch extends StatefulWidget {
  const AdminSearch({Key? key}) : super(key: key);

  @override
  State<AdminSearch> createState() => _AdminSearchState();
}

class _AdminSearchState extends State<AdminSearch> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Form(
            child: TextFormField(
              controller: searchController,
              decoration:
                  const InputDecoration(labelText: 'Search for a user...'),
              onFieldSubmitted: (String _) {
                setState(() {});
              },
            ),
          ),
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('student')
              .where(
                'name',
                isGreaterThanOrEqualTo: searchController.text,
              )
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StudentDetail(
                          uidstudent: (snapshot.data! as dynamic).docs[index]
                              ['uid'],
                        ),
                      ),
                    );
                    setState(() {
                      studentid =
                          (snapshot.data! as dynamic).docs[index]['uid'];
                      print(studentid);
                    });
                  },
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          (snapshot.data! as dynamic).docs[index]['id'],
                        ),
                        const Text('   '),
                        Text(
                          (snapshot.data! as dynamic).docs[index]['name'],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
