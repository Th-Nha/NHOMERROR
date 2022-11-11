import 'package:flutter/material.dart';
import 'package:phanhoi/body/button.dart';

import '../header/header.dart';

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
        backgroundColor: Color.fromARGB(255, 121, 244, 193),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  header(
                    title: 'Phản Hồi',
                    content: 'Vấn Đề Của Bạn Là Gì ?',
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
                            hintText: 'Nhập Vấn Đề Bạn Gặp Phải',
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
