import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  TextEditingController datecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  // controller: namecontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Name of the Child'),
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
                  // controller: namecontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.handshake),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Religion'),
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
                  // controller: namecontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.handshake),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Thaluk'),
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
                  // controller: namecontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.handshake),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Village'),
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
                  // controller: namecontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.handshake),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Panchayat'),
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
                  // controller: namecontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.handshake),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Ward'),
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
                  //controller: addresscontroller,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
