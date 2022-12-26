import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giaodiengame/Chung/countdowntimedoikhang.dart';
import 'package:giaodiengame/choidoikhang/choidoikhang.dart';
import 'package:giaodiengame/choidoikhang/danhsach.dart';
import 'package:giaodiengame/hightcore/hightcore.dart';
import 'package:giaodiengame/trangchu/trangchu.dart';

class buttondoikhang extends StatefulWidget {
  buttondoikhang(
      {super.key,
      required this.content,
      required this.correctcontent,
      required this.point,
      required this.sumquestion,
      required this.emailfriend,
      required this.isMe});
  String content;
  String correctcontent;
  String isMe;
  int point = 100;
  int sumquestion = 1;
  String emailfriend;
  @override
  State<buttondoikhang> createState() => _buttondoikhang();
}

class _buttondoikhang extends State<buttondoikhang> {
  int Point() {
    int p = widget.point;
    return p;
  }

  int Squestion() {
    int squestion = widget.sumquestion;
    return squestion;
  }

  int minuspoints() {
    int mp = widget.point;
    if (mp <= 100) {
      mp = 100;
    } else {
      mp -= 100;
    }
    return mp;
  }

  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final _firestore = FirebaseFirestore.instance;
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 9,
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/button.png'),
            ),
          ),
          child: TextButton(
              onPressed: () async {
                DocumentSnapshot temp = await FirebaseFirestore.instance
                    .collection("multiplay")
                    .doc('player_1')
                    .get();
                DocumentSnapshot temp2 = await FirebaseFirestore.instance
                    .collection("multiplay")
                    .doc('player_2')
                    .get();

// kiem tra tai khoang dung voiws tai khoan dang nhap
                if (temp['email'] == widget.isMe) {
                  FirebaseFirestore.instance
                      .collection('multiplay')
                      .doc("player_1")
                      .update({"sumquestion": Squestion().toString()});
                  if (Squestion() >= 5) {
                    if (int.parse(temp2['sumquestion'].toString()) < 5) {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Thông Báo!'),
                            content: Text('Vui Lòng Đợi Đối Thủ Xong!!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    // kiem tra thang thua user 1
                    else {
                      if (int.parse(temp['score'].toString()) >
                          int.parse(temp2['score'].toString())) {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thông Báo!'),
                              content: Text('Bạn Đã Thắng !!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('history')
                                        .add({
                                      "result": 'Thắng',
                                      'createddate': DateTime.now(),
                                      'email': temp['email']
                                    });

                                    Navigator.pop(context);
                                    Navigator.popUntil(
                                        context, (route) => false);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => trangchu()));
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      } else if ((int.parse(temp['score'].toString()) <
                          int.parse(temp2['score'].toString()))) {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thông Báo!'),
                              content: Text('Bạn Đã Thua !!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('history')
                                        .add({
                                      "result": 'Thua',
                                      'createddate': DateTime.now(),
                                      'email': temp['email']
                                    });

                                    Navigator.pop(context);
                                    Navigator.popUntil(
                                        context, (route) => false);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => trangchu()));
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thông Báo!'),
                              content: Text('Bạn Đã Hòa Với Đối Thủ !!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('history')
                                        .add({
                                      "result": 'Hòa',
                                      'createddate': DateTime.now(),
                                      'email': temp['email']
                                    });

                                    Navigator.pop(context);
                                    Navigator.popUntil(
                                        context, (route) => false);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => trangchu()));
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  }
                  // kiem tra cau hoi dung sai
                  else {
                    if (widget.content == widget.correctcontent) {
                      Navigator.pop(context);
                      Navigator.popUntil(context, (route) => false);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChoiDoiKhang(
                              point: Point(),
                              sumquestion: Squestion(),
                              emailfriend: widget.emailfriend,
                            ),
                          ));
                    } else {
                      Navigator.popUntil(context, (route) => false);
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          opaque: true,
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ChoiDoiKhang(
                            point: minuspoints(),
                            sumquestion: Squestion(),
                            emailfriend: widget.emailfriend,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                      begin: Offset(-1, 0), end: Offset.zero)
                                  .animate(animation),
                              child: child,
                            );
                          },
                        ),
                      );
                    }
                    //up date diem vao firebase
                    FirebaseFirestore.instance
                        .collection('multiplay')
                        .doc("player_1")
                        .update({"score": Point().toString()});
                  }
                }
                // kiem tra khac tai khoan
                else if (temp['email'] != widget.isMe) {
                  FirebaseFirestore.instance
                      .collection('multiplay')
                      .doc("player_2")
                      .update({"sumquestion": Squestion().toString()});
                  {
                    // kiem tra user 1 da tra loi xong chua
                    if (Squestion() >= 5) {
                      if (int.parse(temp['sumquestion'].toString()) < 5) {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thông Báo!'),
                              content: Text('Vui Lòng Đợi Đối Thủ Xong!!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      // kiem tra thang thua user 2
                      else {
                        if (int.parse(temp['score'].toString()) <
                            int.parse(temp2['score'].toString())) {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Thông Báo!'),
                                content: Text('Bạn Đã Thắng !!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('history')
                                          .add({
                                        "result": 'Thắng',
                                        'createddate': DateTime.now(),
                                        'email': temp2['email']
                                      });

                                      Navigator.pop(context);
                                      Navigator.popUntil(
                                          context, (route) => false);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  trangchu()));
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if ((int.parse(temp['score'].toString()) >
                            int.parse(temp2['score'].toString()))) {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Thông Báo!'),
                                content: Text('Bạn Đã Thua !!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('history')
                                          .add({
                                        "result": 'Thua',
                                        'createddate': DateTime.now(),
                                        'email': temp2['email']
                                      });

                                      Navigator.pop(context);
                                      Navigator.popUntil(
                                          context, (route) => false);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  trangchu()));
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Thông Báo!'),
                                content: Text('Bạn Đã Hòa Với Đối Thủ !!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('history')
                                          .add({
                                        "result": 'Hòa',
                                        'createddate': DateTime.now(),
                                        'email': temp2['email']
                                      });

                                      Navigator.pop(context);
                                      Navigator.popUntil(
                                          context, (route) => false);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  trangchu()));
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    }
                    // kiem tra tra loi cau hoir dung sai
                    else {
                      if (widget.content == widget.correctcontent) {
                        Navigator.pop(context);
                        Navigator.popUntil(context, (route) => false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChoiDoiKhang(
                                point: Point(),
                                sumquestion: Squestion(),
                                emailfriend: widget.emailfriend,
                              ),
                            ));
                      } else {
                        Navigator.popUntil(context, (route) => false);
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            opaque: true,
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ChoiDoiKhang(
                              point: minuspoints(),
                              sumquestion: Squestion(),
                              emailfriend: widget.emailfriend,
                            ),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                        begin: Offset(-1, 0), end: Offset.zero)
                                    .animate(animation),
                                child: child,
                              );
                            },
                          ),
                        );
                      }
                      //up date diem vao firebase
                      FirebaseFirestore.instance
                          .collection('multiplay')
                          .doc("player_2")
                          .update({"score": Point().toString()});
                    }
                  }
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.content,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
