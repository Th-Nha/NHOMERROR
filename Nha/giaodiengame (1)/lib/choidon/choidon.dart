import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:giaodiengame/Chung/buttonchoidon.dart';
import 'package:giaodiengame/Chung/countdowntimechoidon.dart';
import 'package:giaodiengame/chude/chude.dart';
import 'package:giaodiengame/hightcore/hightcore.dart';
import 'package:giaodiengame/trangchu/trangchu.dart';

class choidon extends StatefulWidget {
  int nextquestion;
  int point;
  int sumquestion;
  int a;
  int b;
  choidon(
      {super.key,
      required this.nextquestion,
      required this.point,
      required this.sumquestion,
      required this.a,
      required this.b});
  @override
  State<choidon> createState() => _vaogame();
}

class _vaogame extends State<choidon> {
  final _auth = FirebaseAuth.instance;
  // List<questionobject> lscontact = [];

  @override
  void initState() {
    super.initState();
  }

  int nextquestion() {
    int i = Random().nextInt(widget.a) + widget.b;
    return i;
  }

  int sumquestion() {
    int i = widget.sumquestion;
    i++;
    return i;
  }

  int point() {
    int p = widget.point;
    p += 100;
    return p;
  }

  @override
  Widget build(BuildContext context) {
    final loginuser = _auth.currentUser;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover)),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("questions")
              .where('id', isEqualTo: nextquestion())
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!.docs.reversed;
              List<String> lsquestions = [];
              for (var row in data) {
                final r = row.data() as Map<String, dynamic>;
                lsquestions.add(r['question']);
              }

              List<String> lsanswera = [];
              for (var row in data) {
                final r = row.data() as Map<String, dynamic>;
                lsanswera.add(r['answera']);
              }
              List<String> lsanswerb = [];
              for (var row in data) {
                final r = row.data() as Map<String, dynamic>;
                lsanswerb.add(r['answerb']);
              }
              List<String> lsanswerc = [];
              for (var row in data) {
                final r = row.data() as Map<String, dynamic>;
                lsanswerc.add(r['answerc']);
              }
              List<String> lsanswerd = [];
              for (var row in data) {
                final r = row.data() as Map<String, dynamic>;
                lsanswerd.add(r['answerd']);
              }
              List<String> lscorrectanswer = [];
              for (var row in data) {
                final r = row.data() as Map<String, dynamic>;
                lscorrectanswer.add(r['correctanswer']);
              }
              return Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Stack(
                                    children: [
                                      Text(
                                        'Point: ' + point().toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                                ],
                              )),
                          buttontime(
                            i: nextquestion(),
                            point: point(),
                            a: widget.a,
                            b: widget.b,
                          ),
                        ]),
                        //body
                        Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            height: MediaQuery.of(context).size.height / 4,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              child: ListView.builder(
                                  itemCount: lsquestions.length,
                                  itemBuilder: (context, index) => Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        child: SizedBox(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/cauhoi.png'),
                                                    fit: BoxFit.cover),
                                                border: Border.all(
                                                    width: 5,
                                                    color: Colors.black)),
                                            child: TextButton(
                                                onPressed: () async {},
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      lsquestions[index],
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              35,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      )),
                            )),

                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ListView.builder(
                              itemCount: lsquestions.length,
                              itemBuilder: (context, index) => Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              buttongame(
                                                content: lsanswera[index],
                                                correctcontent:
                                                    lscorrectanswer[index],
                                                i: nextquestion(),
                                                point: point(),
                                                sumquestion: sumquestion(),
                                                a: widget.a,
                                                b: widget.b,
                                                isme:
                                                    loginuser!.email.toString(),
                                              ),
                                              buttongame(
                                                content: lsanswerb[index],
                                                correctcontent:
                                                    lscorrectanswer[index],
                                                i: nextquestion(),
                                                point: point(),
                                                sumquestion: sumquestion(),
                                                a: widget.a,
                                                b: widget.b,
                                                isme:
                                                    loginuser.email.toString(),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              buttongame(
                                                content: lsanswerc[index],
                                                correctcontent:
                                                    lscorrectanswer[index],
                                                i: nextquestion(),
                                                point: point(),
                                                sumquestion: sumquestion(),
                                                a: widget.a,
                                                b: widget.b,
                                                isme:
                                                    loginuser.email.toString(),
                                              ),
                                              buttongame(
                                                content: lsanswerd[index],
                                                correctcontent:
                                                    lscorrectanswer[index],
                                                i: nextquestion(),
                                                point: point(),
                                                sumquestion: sumquestion(),
                                                a: widget.a,
                                                b: widget.b,
                                                isme:
                                                    loginuser.email.toString(),
                                              )
                                            ],
                                          ),
                                        ]),
                                  )),
                        ),
                        //footer
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black,
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('MESSAGER!'),
                                            content: Text(
                                                'Bạn Có Chắc Muốn Thoát!!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Text(
                                                      'Mời Bạn Tiếp Tục Trả Nghiệm Game!');
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Không'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.popUntil(context,
                                                      (route) => false);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            chude(),
                                                      ));
                                                },
                                                child: const Text('Có'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Thoát',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red,
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Thông Báo!'),
                                            content: Text(
                                                'Bạn Có Chắc Muốn Đầu Hàng!!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Text(
                                                      'Mời Bạn Tiếp Tục Trả Nghiệm Game!');
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Không'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.popUntil(context,
                                                      (route) => false);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            hightcore(
                                                                point: point()),
                                                      ));
                                                },
                                                child: const Text('Có'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Đầu Hàng',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Có Lỗi Xảy Ra'),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
