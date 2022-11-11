import 'package:TO_CAO/phanhoi/main.dart';
import 'package:flutter/material.dart';
import 'package:TO_CAO/widget/button.dart';
import 'package:TO_CAO/widget/username.dart';

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
  int? role = 1;

  get ischecked => null;

  MaterialPropertyResolver<Color?>? get getColor => null;
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

          child: Container(
            child: Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 40,
                              padding: EdgeInsets.only(top: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                child: TextField(
                                  decoration: InputDecoration(),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      onPressed: null,
                                      child: const Text('Tìm Kiếm'),
                                    ),
                                  ]),
                            )
                          ]),
                        ),
                        /* Container(
                           Button(title: 'Tìm', pathscreen: phanhoi(title: ''),),
                        )*/
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 35),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            color: Colors.black,
                            border: Border.all(
                              width: 5,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              'images/avtda.png',
                              width: MediaQuery.of(context).size.height / 5,
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Sơn 1234456',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Button(
                              title: 'Tố Cáo',
                              pathscreen: phanhoi(title: ''),
                            )
                          ]),
                    )
                  ],
                )),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        )
      ],
    ));
  }
}
