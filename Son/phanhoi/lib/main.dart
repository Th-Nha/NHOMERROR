import 'package:flutter/material.dart';
import 'package:phanhoi/body/button.dart';
import 'package:phanhoi/phanhoi/main.dart';
import 'package:phanhoi/header/header.dart';

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
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/TG.jpg"),
            fit: BoxFit.cover,
          )),
        ),
        SingleChildScrollView(
          child: Container(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    header(
                      title: 'Phản Hồi',
                      content: '',
                    )
                  ],
                ),
                Container(
                  color: Colors.black,
                  height: 0.5,
                ),
                Container(
                    child: Column(
                  children: [
                    Button(
                      title: 'Giao Diện Game',
                      pathscreen: phanhoi(title: 'Phản Hồi'),
                    ),
                    Button(
                        title: 'Hình Ảnh',
                        pathscreen: phanhoi(title: 'Phản Hồi')),
                    Button(
                        title: 'Âm Thanh',
                        pathscreen: phanhoi(title: 'Phản Hồi')),
                    Button(
                        title: 'Mức Độ Câu Hỏi',
                        pathscreen: phanhoi(title: 'Phản Hồi')),
                    Button(
                        title: 'Mức Độ Rak',
                        pathscreen: phanhoi(title: 'Phản Hồi')),
                    Button(
                        title: 'Phần Thưởng',
                        pathscreen: phanhoi(title: 'Phản Hồi ')),
                  ],
                )),
              ]),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        )
      ],
    ));
  }
}
