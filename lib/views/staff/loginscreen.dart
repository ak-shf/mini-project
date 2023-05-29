import 'package:flutter/material.dart';
import 'package:mini_project/services/auth_services.dart';
import 'package:mini_project/views/admin/admin.dart';
import 'package:mini_project/views/doctor/doctorhome.dart';
import 'package:mini_project/views/parent/parenthome.dart';
import 'package:mini_project/views/staff/staffdetails.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool isHidepassword = true;
  bool _isLoading = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _loginUser() async {
    final email = emailcontroller.text.trim();
    final password = passwordController.text.trim();

    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });

    final role = await AuthServices.login(email: email, password: password);

    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
    if (role != "ADMIN" &&
        role != "DOCTOR" &&
        role != "STAFF" &&
        role != "PARENT") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('invalid username and password')));
      return;
    }

    Widget? page;
    switch (role.toUpperCase()) {
      case 'DOCTOR':
        page = const DoctorFirst();
        print("IS A DOCTOR");
        break;
      case 'STAFF':
        page = const StaffDetails();
        print("IS A STAFF");

        break;
      case 'PARENT':
        page = const ParentFirst();
        print("IS A PARENT");

        break;
      case 'ADMIN':
        page = const AdminPage();
        print("IS A DOCTOR");
        break;
      default:
        print(role);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(role)));
    }
    if (page != null) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx2) => page!));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 370,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/loginimage/background.png'),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Container(
                      width: 80,
                      height: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/loginimage/light-1.png'),
                      )),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    child: Container(
                      width: 80,
                      height: 120,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/loginimage/light-2.png'),
                      )),
                    ),
                  ),
                  Positioned(
                    left: width * 0.7,
                    top: height * 0.05,
                    child: Container(
                      width: 80,
                      height: 120,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/loginimage/clock.png'),
                      )),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Column(children: [
                Row(
                  children: const [
                    Text(
                      'Login Id',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      hintText: 'login id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: passwordController,
                  obscureText: isHidepassword,
                  decoration: InputDecoration(
                      hintText: 'password',
                      suffixIcon: InkWell(
                          onTap: check,
                          child: const Icon(
                            Icons.visibility,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'forgot password?',
                          style:
                              TextStyle(color: Color.fromARGB(245, 2, 21, 42)),
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 155, height: 40),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: _loginUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(245, 2, 21, 42),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          child: const Text('SIGN IN'),
                        ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void check() {
    setState(() {
      isHidepassword = !isHidepassword;
    });
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
