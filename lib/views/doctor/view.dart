import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/doctor/documentfirst.dart';

class PdfViews extends StatefulWidget {
  const PdfViews({super.key, required String uid});

  @override
  State<PdfViews> createState() => _PdfViewsState();
}

class _PdfViewsState extends State<PdfViews> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];
  Future<String> uploadPdf(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child('pdfs/$fileName.pdf');
    final UploadTask = reference.putFile(file);
    await UploadTask.whenComplete(() {});
    final downloadLink = await reference.getDownloadURL();

    return downloadLink;
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      String randomDocumentId =
          FirebaseFirestore.instance.collection('random').doc().id;
      final downloadLink = await uploadPdf(fileName, file);
      await _firebaseFirestore
          .collection("student")
          .doc(doctorStudent)
          .collection('pdfs')
          .doc(randomDocumentId)
          .set({"name": fileName, "url": downloadLink, "id": randomDocumentId});
      FirebaseFirestore.instance.collection('random').doc().delete();
      print("Pdf uploaded Sucessfully");

      setState(() {});
    }
  }

  void getAllPdf() async {
    final results = await _firebaseFirestore
        .collection("student")
        .doc(doctorStudent)
        .collection('pdfs')
        .get();
    pdfData = results.docs.map((e) => e.data()).toList();
    setState(() {});
  }

  @override
  //screen ke start hote hi function call hojayega
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pdfs'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickFile();

          print("hello");
        },
        // ignore: sort_child_properties_last
        child: const Icon(
          Icons.upload_file,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
          primary: true,
          itemCount: pdfData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onLongPress: () {
                  String id = pdfData[index]['id'];
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
                                      .collection('student')
                                      .doc(doctorStudent)
                                      .collection("pdfs")
                                      .doc(id)
                                      .delete();
                                  FirebaseAuth.instance.currentUser!.delete();
                                },
                                child: const Text('Delete')),
                          ],
                        );
                      });
                },
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          PdfViewerScreen(pdfUrl: pdfData[index]['url'])));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/pdf.png',
                        height: 100,
                        width: 80,
                      ),
                      Text(
                        pdfData[index]['name'],
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class PdfViewerScreen extends StatefulWidget {
  final String pdfUrl;
  const PdfViewerScreen({super.key, required this.pdfUrl});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PDFDocument? document;

  void initializePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: document != null
            ? PDFViewer(
                document: document!,
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ));
  }
}
