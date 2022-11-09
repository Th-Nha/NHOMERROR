import 'package:flutter/material.dart';
import 'package:random/Chung/header.dart';
import 'package:random/setting/setting.dart';

class giaodien extends StatefulWidget {
  const giaodien({super.key});

  @override
  State<giaodien> createState() => _giaodien();
}

class _giaodien extends State<giaodien> {
  double amthanh = 0;
  double fontchu = 0;
  Color? color = Colors.blue[50];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/TG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.height / 10,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.red, width: 3),
                        ),
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => setting(),
                                  ));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: MediaQuery.of(context).size.height / 20,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  header(
                    title: 'Giao Diện',
                  ),
                  Column(
                    children: [
                      Text(
                        'Độ Sáng',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Slider(
                        thumbColor: Color.fromARGB(255, 9, 97, 212),
                        activeColor: Color.fromARGB(255, 9, 97, 212),
                        min: 0,
                        max: 10,
                        value: amthanh,
                        label: '$amthanh',
                        onChanged: (newValue) => setState(
                          () {
                            amthanh = newValue;
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Font Chữ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Slider(
                        thumbColor: Color.fromARGB(255, 9, 97, 212),
                        activeColor: Color.fromARGB(255, 9, 97, 212),
                        min: 0,
                        max: 10,
                        value: fontchu,
                        label: '$fontchu',
                        onChanged: (newValue) => setState(
                          () {
                            fontchu = newValue;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
