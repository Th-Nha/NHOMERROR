import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodiengame/choidon/choidon.dart';
import 'package:giaodiengame/hightcore/hightcore.dart';
import 'package:giaodiengame/xephang/screenrank.dart';

class buttongame extends StatelessWidget {
  buttongame(
      {super.key,
      required this.content,
      required this.correctcontent,
      required this.i,
      required this.point,
      required this.sumquestion,
      required this.a,
      required this.b,
      required this.isme});
  String isme;
  String content;
  String correctcontent;
  int i = 0;
  int point = 0;
  int sumquestion = 1;
  int a;
  int b;

  int nextquestion() {
    int t = i;
    return t;
  }

  int Point() {
    int p = point;
    return p;
  }

  int Squestion() {
    int squestion = sumquestion;
    return squestion;
  }

  int minuspoints() {
    int mp = point;
    if (mp <= 100) {
      mp = 100;
    } else {
      mp -= 100;
    }
    return mp;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String score = "";
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 7,
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/button.png'),
            ),
          ),
          child: TextButton(
              onPressed: () async {
                if (Squestion() >= 5) {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => hightcore(point: point),
                      ));
                } else {
                  if (content == correctcontent) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => choidon(
                              nextquestion: nextquestion(),
                              point: Point(),
                              sumquestion: Squestion(),
                              a: a,
                              b: b),
                        ));
                  } else {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        opaque: true,
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            choidon(
                          nextquestion: nextquestion(),
                          point: minuspoints(),
                          sumquestion: Squestion(),
                          a: a,
                          b: b,
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
                }
                DocumentSnapshot user = await FirebaseFirestore.instance
                    .collection("highscore")
                    .doc('hightscoreuser1')
                    .get();
                if (user['email'] == isme) {
                  FirebaseFirestore.instance
                      .collection('highscore')
                      .doc("hightscoreuser1")
                      .update({"score": Point().toString()});
                } else if (user['email'] != isme) {
                  FirebaseFirestore.instance
                      .collection('highscore')
                      .doc("hightscoreuser1")
                      .update({"score": Point().toString()});
                }
                //update high score
                // DocumentSnapshot temp = await FirebaseFirestore.instance
                //     .collection("highscore")
                //     .doc('hightscoreuser2')
                //     .get();
                // // print(temp['score']);
                // print('Ponit:' + Point().toString());
                // String t = temp['score'];
                // if (int.parse(t.toString()) <= Point()) {
                //   FirebaseFirestore.instance
                //       .collection('highscore')
                //       .doc("idhighscore")
                //       .update({"score": Point().toString()});
                // }
                // FirebaseFirestore.instance
                //     .collection('scorenow')
                //     .add({"score": Point().toString()});
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    content,
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
