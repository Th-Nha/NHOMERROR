import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:giaodiengame/Chung/buttondoikhang.dart';
import 'package:giaodiengame/Chung/countdowntimedoikhang.dart';
import 'package:giaodiengame/choidoikhang/scoredetail.dart';
import 'package:giaodiengame/hightcore/hightcore.dart';

import 'package:giaodiengame/trangchu/trangchu.dart';
import 'package:giaodiengame/xephang/screenrank.dart';

class ChoiDoiKhang extends StatefulWidget {
  int point;
  int sumquestion;
  String emailfriend;
  ChoiDoiKhang({
    super.key,
    required this.point,
    required this.sumquestion,
    required this.emailfriend,
  });

  @override
  State<ChoiDoiKhang> createState() => _ChoiDoiKhang();
}

class _ChoiDoiKhang extends State<ChoiDoiKhang> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String default_img = 'images/amthah.png';
  @override
  int nextquestion() {
    int i = Random().nextInt(80) + 1;
    return i;
  }

  int sumquestion() {
    int i = widget.sumquestion;
    i++;
    return i;
  }

  int point() {
    int p = widget.point + 100;
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
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width / 2,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('multiplay')
                .orderBy('createdate')
                .snapshots(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                final emailLogon = _auth.currentUser!.email;
                final data = snapshot.data!.docs.reversed;
                List<MessagaBubble> lsMess = [];
                for (var m in data) {
                  var user1 = m['email'];
                  var user2 = m['email'];
                  final mess =
                      MessagaBubble(user1, m['score'], user1 == emailLogon);
                  lsMess.add(mess);
                }
                return GridView.builder(
                  reverse: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: lsMess.length,
                  itemBuilder: (context, index) => lsMess[index],
                );
              }
              return CircularProgressIndicator();
            }),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Container(
              child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    buttontimedoikhang(
                      emailfriend: widget.emailfriend,
                      point: point(),
                      nextquestion: nextquestion(),
                      sumquestion: sumquestion(),
                    ),
                  ]),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //body
                                  Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        child: ListView.builder(
                                            itemCount: lsquestions.length,
                                            itemBuilder: (context, index) =>
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: SizedBox(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/cauhoi.png'),
                                                              fit:
                                                                  BoxFit.cover),
                                                          border: Border.all(
                                                              width: 5,
                                                              color: Colors
                                                                  .black)),
                                                      child: TextButton(
                                                          onPressed:
                                                              () async {},
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                lsquestions[
                                                                    index],
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        35,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          )),
                                                    ),
                                                  ),
                                                )),
                                      )),

                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: ListView.builder(
                                        itemCount: lsquestions.length,
                                        itemBuilder: (context, index) =>
                                            Container(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        buttondoikhang(
                                                          emailfriend: widget
                                                              .emailfriend,
                                                          content:
                                                              lsanswera[index],
                                                          correctcontent:
                                                              lscorrectanswer[
                                                                  index],
                                                          point: point(),
                                                          sumquestion:
                                                              sumquestion(),
                                                          isMe: loginuser!.email
                                                              .toString(),
                                                        ),
                                                        buttondoikhang(
                                                            emailfriend: widget
                                                                .emailfriend,
                                                            content: lsanswerb[
                                                                index],
                                                            correctcontent:
                                                                lscorrectanswer[
                                                                    index],
                                                            point: point(),
                                                            sumquestion:
                                                                sumquestion(),
                                                            isMe: loginuser
                                                                .email
                                                                .toString())
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        buttondoikhang(
                                                          emailfriend: widget
                                                              .emailfriend,
                                                          content:
                                                              lsanswerc[index],
                                                          correctcontent:
                                                              lscorrectanswer[
                                                                  index],
                                                          point: point(),
                                                          sumquestion:
                                                              sumquestion(),
                                                          isMe: loginuser.email
                                                              .toString(),
                                                        ),
                                                        buttondoikhang(
                                                          emailfriend: widget
                                                              .emailfriend,
                                                          content:
                                                              lsanswerd[index],
                                                          correctcontent:
                                                              lscorrectanswer[
                                                                  index],
                                                          point: point(),
                                                          sumquestion:
                                                              sumquestion(),
                                                          isMe: loginuser.email
                                                              .toString(),
                                                        )
                                                      ],
                                                    ),
                                                  ]),
                                            )),
                                  ),
                                  //footer
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    margin:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.red,
                                          ),
                                          child: TextButton(
                                              onPressed: () {
                                                showDialog<void>(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Thông Báo!'),
                                                        content: Text(
                                                            'Bạn Có Chắc Muốn Đầu Hàng!!'),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () {
                                                              Text(
                                                                  'Mời Bạn Tiếp Tục Trả Nghiệm Game!');
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Không'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'multiplay')
                                                                  .doc(
                                                                      "player_1")
                                                                  .update({
                                                                "score": '0'
                                                              });
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'multiplay')
                                                                  .doc(
                                                                      "player_2")
                                                                  .update({
                                                                "score": '0'
                                                              });
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'multiplay')
                                                                  .doc(
                                                                      "player_1")
                                                                  .update({
                                                                "sumquestion":
                                                                    '0'
                                                              });
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'multiplay')
                                                                  .doc(
                                                                      "player_2")
                                                                  .update({
                                                                "sumquestion":
                                                                    '0'
                                                              });
                                                              Navigator.popUntil(
                                                                  context,
                                                                  (route) =>
                                                                      false);

                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              trangchu()));
                                                            },
                                                            child: const Text(
                                                                'Có'),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Text(
                                                'Đầu Hàng',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
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
              )
            ],
          )),
        )
      ],
    ));
  }
}
