import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/services/auth_services.dart';
import 'package:mini_project/services/storage.dart';

class DeleteUser extends StatefulWidget {
  const DeleteUser({super.key});

  @override
  State<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  bool _isLoading = false;
  int flag = 1;
  _DeleteUserState() {
    valuechoose = selectList[0];
  }
  String? valuechoose;

  List selectList = ['STAFF', 'DOCTOR', 'PARENT'];
  @override
  Widget build(BuildContext context) {
    SecureStorage secureStorage = SecureStorage();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Text(
              'Register User',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            DropdownButtonFormField(
                value: valuechoose,
                onTap: () {},
                items: selectList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    valuechoose = value as String;
                    if (value == "STAFF") {
                      flag = 1;
                    } else if (value == "PARENT") {
                      flag = 2;
                    } else {
                      flag = 3;
                    }
                  });
                }),
            Expanded(
              child: ListView.builder(
                itemBuilder: ((context, index) => staff(valuechoose)),
                itemCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  staff(String? valuechoose) {
    TextEditingController registercontroller = TextEditingController();
    TextEditingController passwordcontroller1 = TextEditingController();

    TextEditingController idcontroller = TextEditingController();
    return Column(
      children: [
        TextFormField(
          controller: registercontroller,
          decoration: const InputDecoration(hintText: 'username'),
        ),
        TextFormField(
          controller: passwordcontroller1,
          decoration: const InputDecoration(hintText: 'password'),
        ),
        ElevatedButton(
            onPressed: () async {
              if (!mounted) return;
              setState(() {
                _isLoading = true;
              });
              String res = await AuthServices.deleteuser(
                email: registercontroller.text.trim(),
                password: passwordcontroller1.text.trim(),
              );
              if (valuechoose == "STAFF") {
                // ignore: use_build_context_synchronously
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Do you want to delete',
                          style: TextStyle(fontSize: 15),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                await FirebaseFirestore.instance
                                    .collection('staff')
                                    .doc(res)
                                    .delete();
                              },
                              child: const Text('Delete')),
                        ],
                      );
                    });
              } else if (valuechoose == "PARENT") {
                // ignore: use_build_context_synchronously
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Do you want to delete',
                          style: TextStyle(fontSize: 15),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                await FirebaseFirestore.instance
                                    .collection('parent')
                                    .doc(res)
                                    .delete();
                              },
                              child: const Text('Delete')),
                        ],
                      );
                    });
              } else if (valuechoose == "DOCTOR") {
                // ignore: use_build_context_synchronously
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Do you want to delete',
                          style: TextStyle(fontSize: 15),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                await FirebaseFirestore.instance
                                    .collection('parent')
                                    .doc(res)
                                    .delete();
                              },
                              child: const Text('Delete')),
                        ],
                      );
                    });
              }

              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Delete User')));
              if (!mounted) return;
              setState(() {
                _isLoading = false;
              });
            },
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Text('Delete Account')),
      ],
    );
  }
}
