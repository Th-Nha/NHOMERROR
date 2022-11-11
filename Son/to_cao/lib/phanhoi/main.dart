import 'package:flutter/material.dart';
import 'package:TO_CAO/main.dart';

import '../widget/button.dart';
import 'CHUNG/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const phanhoi(title: 'Flutter Demo Home Page'),
    );
  }
}

class phanhoi extends StatefulWidget {
  const phanhoi({super.key, required this.title});

  final String title;

  @override
  State<phanhoi> createState() => _phanhoi();
}

class _phanhoi extends State<phanhoi> {
  double fontchu = 0;
  Color? color = Colors.blue[50];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 224, 191),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  header(
                    title: 'Tố Cáo',
                    content: 'Lý Do Tố Cáo',
                  ),
                  Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 6,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red)),
                            hintText: 'Nhập Nội Dung Tố Cáo',
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 93, 147, 240)))),
                      ),
                    ],
                  ),
                  Button(title: 'Gửi', pathscreen: widget)
                ],
              )),
        ));
  }
}
