import 'package:flutter/material.dart';
import 'package:tim_tran/button.dart';
import 'package:tim_tran/header.dart';
import 'package:tim_tran/text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.blue[50],
          child: Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Column(
                children: [
                  header(title: 'Tìm Bạn Bè'),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: TextField(
                                decoration: InputDecoration(),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Expanded(
                        flex: 2,
                        child: Button(title: 'Tìm'),
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text_content(title: 'ID 32125'),
                          Text_content(title: 'ID 32126'),
                          Text_content(title: 'ID 32127'),
                          Text_content(title: 'ID 32128'),
                          Text_content(title: 'ID 32129'),
                        ],
                      )),
                ],
              )),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
