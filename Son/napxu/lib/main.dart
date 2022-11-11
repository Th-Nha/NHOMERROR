import 'package:flutter/material.dart';

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

enum SingingCharacter { lafayette, jefferson }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum loaithe { viettel, vina }

Color? getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused
  };
}

@override
State<MyHomePage> createState() => _MyHomePageState();

class _MyHomePageState extends State<MyHomePage> {
  loaithe? _loaithe = loaithe.viettel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/TG.jpg'), fit: BoxFit.cover),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(children: [
                Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.pink)),
                  child: Column(
                    children: [
                      Text(
                        'Nạp Xu',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 0, 179),
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            padding: EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black)),
                                    hintText: 'Nhập Mã Số Thẻ',
                                    hintStyle: TextStyle(color: Colors.yellow)),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: SizedBox(
                              width: 200.0,
                              height: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 231, 144, 22)),
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Nạp Thẻ Thành Công'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Thoát'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'NẠP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              25),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chọn Loại Thẻ',
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25),
                              ),
                              RadioListTile<loaithe>(
                                  title: Text(
                                    'Viettel',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25),
                                  ),
                                  value: loaithe.viettel,
                                  groupValue: _loaithe,
                                  onChanged: (loaithe? value) {
                                    setState(() {
                                      _loaithe = value;
                                    });
                                  }),
                              RadioListTile<loaithe>(
                                  title: Text(
                                    'Vina',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25),
                                  ),
                                  value: loaithe.vina,
                                  groupValue: _loaithe,
                                  onChanged: (loaithe? value) {
                                    setState(() {
                                      _loaithe = value;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Row()
              ]),
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
