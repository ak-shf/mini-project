import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isSearching = false;
  List<String> nameCheck = [];
  List<String> nameList = [
    'Aadithya hari',
    'Aakarsh',
    'Aaron',
    'Abdul',
    'Abhijith',
    'Aby',
    'Amarthyag',
    'Allen',
    'Achyuth',
    'Dona',
    'Christy',
    'Lorance',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: !isSearching
              ? const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Select student'),
                )
              : Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          nameCheck = nameList
                              .where((element) => element
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Enter Student name'),
                    ),
                  )),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                  });
                  //showSearch(context: context, delegate: customSearchDelegate());
                },
                icon: const Icon(Icons.search))
          ]),
      body: ListView.separated(
        itemBuilder: (context, index) => _showlist(
            nameList, index, context, nameCheck, _textEditingController),
        separatorBuilder: (context, index) => Container(
          color: const Color.fromARGB(255, 136, 136, 136),
          height: 1,
        ),
        itemCount: _textEditingController.text.isNotEmpty
            ? nameCheck.length
            : nameList.length,
      ),
    );
  }
}

Widget _showlist(nameList, index, context, nameCheck, textEditingController) {
  return Container(
    height: 60,
    color: const Color.fromARGB(255, 255, 255, 255),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                textEditingController!.text.isNotEmpty
                    ? nameCheck[index].toString()
                    : nameList[index].toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 15,
          )
        ],
      ),
    ),
  );
}
