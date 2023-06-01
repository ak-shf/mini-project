import 'package:flutter/material.dart';
import 'package:mini_project/services/auth_services.dart';
import 'package:mini_project/services/storage.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool _isLoading = false;
  int flag = 1;
  _AdminPageState() {
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
    TextEditingController namecontroller = TextEditingController();
    return Column(
      children: [
        TextFormField(
          controller: namecontroller,
          decoration: const InputDecoration(hintText: 'Name'),
        ),
        TextFormField(
          controller: registercontroller,
          decoration: const InputDecoration(hintText: 'username'),
        ),
        TextFormField(
          controller: passwordcontroller1,
          decoration: const InputDecoration(hintText: 'password'),
        ),
        TextFormField(
          controller: idcontroller,
          decoration:
              InputDecoration(hintText: "${valuechoose?.toLowerCase()}-id"),
        ),
        ElevatedButton(
            onPressed: () {
              if (!mounted) return;
              setState(() {
                _isLoading = true;
              });
              AuthServices.signup(
                  email: registercontroller.text.trim(),
                  password: passwordcontroller1.text.trim(),
                  role: valuechoose.toString(),
                  id: idcontroller.text.trim(),
                  value: flag);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('registerd')));
              if (!mounted) return;
              setState(() {
                _isLoading = false;
              });
            },
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Text('Register')),
      ],
    );
  }
}
