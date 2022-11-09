import 'package:flutter/material.dart';
import 'package:random/Chung/header.dart';
import 'package:random/xephang/rank.dart';

class rank extends StatefulWidget {
  const rank({super.key});

  @override
  State<rank> createState() => _rank();
}

Widget vonglap(int countstar) {
  List<Widget> lstrank = List.empty(growable: true);
  int temp = countstar;
  for (int i = 1; i <= countstar; i++) {
    lstrank.add(xephang(
        thanhtich: 'Top ' + '$i',
        rank: 'images/ht.png',
        cap: '50',
        ten: 'KingCute',
        ttcd: '4500',
        ttcn: '5000'));
  }
  return Column(
    children: [for (var i in lstrank) i],
  );
}

class _rank extends State<rank> {
  @override
  Widget build(BuildContext context) {
    double chia = 8;
    double chia2 = 10;
    int font = 40;
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/TG.jpg"),
            fit: BoxFit.cover,
          ),
        )),
        SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: Icon(Icons.home, size: 30, color: Colors.yellow)),
                  header(title: 'Bảng Xếp Hạng'),
                ],
              )),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / chia2,
                          child: Column(
                            children: [
                              Text(
                                'Thành Tích',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 50,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.yellow),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / chia,
                          child: Row(
                            children: [
                              Text('Xếp Hạng',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              font,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.yellow))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 8,
                          child: Row(
                            children: [
                              Text('Cấp',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              font,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.yellow))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / chia,
                          child: Row(
                            children: [
                              Text('Tên',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              font,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.yellow))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5,
                          child: Column(
                            children: [
                              Text('Thành Tích Cá Nhân',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              font,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.yellow)),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5,
                          child: Column(
                            children: [
                              Text('Thành Tích Cộng Động',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              font,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.yellow)),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              vonglap(5)
            ],
          )),
        )
      ],
    ));
  }
}
