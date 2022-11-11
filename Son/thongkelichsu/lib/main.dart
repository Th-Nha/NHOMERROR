import 'package:flutter/material.dart';
import 'package:thongkelichsu/widget/button.dart';
import 'package:thongkelichsu/widget/username.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/TG.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("images/TG.jpg"),
                    fit: BoxFit.cover,
                  )),
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
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
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          'Sơn 1234456',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 35),
                        child: Text(
                          'Thống Kê',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                        color: Colors.black,
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 10, 10),
                      ),
                      username(
                        title: 'Số trận XH đã chơi',
                        temp: '100',
                      ),
                      username(
                        title: 'Số trận đối kháng đã chơi ',
                        temp: '30',
                      ),
                      username(
                        title: 'Tổng số trận đã chơi ',
                        temp: '130',
                      ),
                      username(
                        title: 'Tổng số câu hỏi đã trả lời ',
                        temp: '1000',
                      ),
                      username(
                        title: 'Rank mùa trước',
                        temp: 'Vàng',
                      ),
                      username(
                        title: 'Rank mùa hiện tại ',
                        temp: 'Bạc',
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Button(title: 'Thoát'),
                            ]),
                      )
                    ],
                  )),
            ),
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
