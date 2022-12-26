import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:giaodiengame/loaddatajson/question_obj.dart';
import 'package:giaodiengame/loaddatajson/question_provider.dart';
import 'package:giaodiengame/timmer/timer.dart';
import 'package:giaodiengame/trangchu/trangchu.dart';
import 'package:giaodiengame/xephang/screenrank.dart';

class hightcore extends StatefulWidget {
  int point;
  hightcore({super.key, required this.point});
  @override
  State<hightcore> createState() => _hightcore();
}

class _hightcore extends State<hightcore> {
  @override
  int point() {
    int p = widget.point;
    return p;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover)),
        ),
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Container(
              child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Container(
                        height: MediaQuery.of(context).size.height / 10,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => trangchu(),
                                        ));
                                  },
                                  icon: Image.asset('images/back.png'),
                                  iconSize:
                                      MediaQuery.of(context).size.width / 8,
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                      child: Text(
                        'Điểm Của Bạn Là:  ',
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      ),
                    ),
                    Container(
                      child: Text(
                        ' ' + point().toString(),
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red,
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => trangchu(),
                                  ));
                            },
                            child: Text(
                              'Tiếp Tục',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800),
                            )),
                      ),
                    )
                  ]),
                ],
              )
            ],
          )),
        )
      ],
    ));
  }
}
