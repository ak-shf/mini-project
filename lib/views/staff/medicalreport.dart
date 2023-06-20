import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/doctor/documentfirst.dart';
import 'package:mini_project/views/doctor/view.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
                isGreaterThanOrEqualTo: searchController.text.toUpperCase(),
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
                        builder: (context) => PdfViews(
                          uid: (snapshot.data! as dynamic).docs[index]['uid'],
                        ),
                      ),
                    );
                    setState(() {
                      doctorStudent =
                          (snapshot.data! as dynamic).docs[index]['uid'];
                    });
                  },
                  child: ListTile(
                    leading: (snapshot.data! as dynamic).docs[index]
                                ['imageLink'] ==
                            null
                        ? const CircleAvatar(
                            backgroundImage: NetworkImage('image/png;base64,'),
                            radius: 16,
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                              (snapshot.data! as dynamic).docs[index]
                                  ['imageLink'],
                            ),
                            radius: 16,
                          ),
                    title: Text(
                      (snapshot.data! as dynamic)
                          .docs[index]['name']
                          .toString()
                          .toUpperCase(),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
