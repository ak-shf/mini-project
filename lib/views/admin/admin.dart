import 'package:flutter/material.dart';
import 'package:mini_project/services/auth_services.dart';
import 'package:mini_project/views/staff/loginscreen.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  _AdminPageState() {
    valuechoose = selectList[0];
  }
  String? valuechoose;
  List selectList = ['STAFF', 'DOCTOR', 'PARENT'];
  @override
  Widget build(BuildContext context) {
    TextEditingController registercontroller = TextEditingController();
    TextEditingController passwordcontroller1 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Text(
              'Register a user',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: registercontroller,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            TextFormField(
              controller: passwordcontroller1,
              decoration: const InputDecoration(hintText: 'password'),
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
                  });
                }),
            ElevatedButton(
                onPressed: () => AuthServices.signup(
                      email: registercontroller.text.trim(),
                      password: passwordcontroller1.text.trim(),
                      role: valuechoose.toString(),
                    ),
                child: const Text('Register')),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () async {
                  final res = await AuthServices.signout();
                  if (res == null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SelectionPage()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: res));
                  }
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 1),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(245, 255, 255, 255),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
