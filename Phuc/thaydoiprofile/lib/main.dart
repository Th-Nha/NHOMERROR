import 'package:flutter/material.dart';
import 'package:thaydoiprofile/widget/button.dart';
import 'package:thaydoiprofile/widget/username.dart';

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
      body: Container(
        color: Colors.blue[50],
        child: Container(
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
                  padding: EdgeInsets.only(top: 35),
                  child: Text(
                    'Sơn KUTE 1234456',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 35),
                  child: Text(
                    'Thay Đổi Thông Tin',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                  color: Colors.black,
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(35, 20, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Giới Tính: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).size.width / 40),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value;
                                });
                              }),
                          Text(
                            'Nữ',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 50,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )),
                      Container(
                          child: Row(
                        children: [
                          Radio(
                              value: 2,
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value;
                                });
                              }),
                          Text(
                            'Nam',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 50,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
                username(
                  title: 'Ngày Sinh ',
                  temp: 'dd/mm/yy',
                ),
                username(
                  title: 'SĐT ',
                  temp: '0123445678',
                ),
                username(
                  title: 'Gmail ',
                  temp: 'sonkute@gmail.com',
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Button(title: 'Hủy'), Button(title: 'Lưu')]),
                )
              ],
            )),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
