import 'package:flutter/material.dart';
import 'package:random/Chung/button.dart';
import 'package:random/Chung/username.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  int? role = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/TG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            padding: EdgeInsets.only(top: 10),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        border: Border.all(
                          color: Colors.yellow,
                          width: 3,
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
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 35),
                  child: Text(
                    'Thay Đổi Thông Tin',
                    style: TextStyle(
                        color: Colors.white,
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
                            color: Colors.yellow,
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
                                color: Colors.yellow,
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
                                color: Colors.yellow,
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
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 30, left: 20),
                          child: Column(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.height / 20,
                              child: Container(
                                  child: TextButton(
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Setting'),
                                        content: Text('Bạn Đã Lưu'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Hủy',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              30),
                                ),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orangeAccent),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: BorderSide(
                                                color: Colors.black)))),
                              )),
                            )
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30, left: 20),
                          child: Column(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.height / 20,
                              child: Container(
                                  child: TextButton(
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Setting'),
                                        content: Text('Bạn Đã Hủy'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Lưu',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              30),
                                ),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orangeAccent),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: BorderSide(
                                                color: Colors.black)))),
                              )),
                            )
                          ]),
                        ),
                      ]),
                )
              ],
            )),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
