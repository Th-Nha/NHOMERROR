import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: adddata(),
    );
  }
}

class adddata extends StatefulWidget {
  adddata({super.key});

  @override
  State<adddata> createState() => _adddataState();
}

class _adddataState extends State<adddata> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Dữ Liệu Tự Động'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _firestore.collection('questions').add({
                        "id": "5",
                        "question":
                            "Miệng rộng lớn nhưng không nói một từ, là con gì?",
                        "answera": "Con cá voi ",
                        "answerb": "Con khỉ đột ",
                        "answerc": "Con sông ",
                        "answerd": "Con voi ",
                        "correctanswer": "Con sông "
                      });
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(' Thông Báo!'),
                            content: Text('Đã Thêm Dữ Liệu'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => adddata(),
                                      ));
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Ấn Nút Để Tự Động Thêm'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
