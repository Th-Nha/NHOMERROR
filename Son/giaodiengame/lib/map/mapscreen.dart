import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giaodiengame/chude/chude.dart';
import 'package:giaodiengame/map/buttonmap.dart';
import 'package:giaodiengame/trangchu/trangchu.dart';

class mapscreen extends StatefulWidget {
  mapscreen(
      {super.key,
      required this.a,
      required this.b,
      required this.i,
      required this.upscore});
  int a;
  int b;
  int i;
  int upscore;
  @override
  State<mapscreen> createState() => _mapscreen();
}

class _mapscreen extends State<mapscreen> {
  final _auth = FirebaseAuth.instance;
  int upmap() {
    int t = this.widget.i;
    return t;
  }

  int upscore() {
    int t = this.widget.upscore;
    return t;
  }

  @override
  Widget build(BuildContext context) {
    final loginuser = _auth.currentUser;
    double t = 7;
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
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("highscore")
                    .where('email', isLessThanOrEqualTo: loginuser!.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!.docs.reversed;
                    List<String> lsscore = [];
                    for (var row in data) {
                      final r = row.data() as Map<String, dynamic>;
                      lsscore.add(r['score']);
                    }
                    return Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          child: ListView.builder(
                              itemCount: lsscore.length,
                              itemBuilder: (context, index) => Container(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                7,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    if (widget.i <= 1) {
                                                      return null;
                                                    } else {
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    mapscreen(
                                                              a: widget.a,
                                                              b: widget.b,
                                                              i: widget.i - 5,
                                                              upscore: widget
                                                                      .upscore -
                                                                  2000,
                                                            ),
                                                          ));
                                                    }
                                                  },
                                                  icon: Image(
                                                    image: AssetImage(
                                                        'images/back.png'),
                                                  ),
                                                  iconSize: 50,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              mapscreen(
                                                            a: widget.a,
                                                            b: widget.b,
                                                            i: widget.i + 5,
                                                            upscore:
                                                                widget.upscore +
                                                                    2000,
                                                          ),
                                                        ));
                                                  },
                                                  icon: Image(
                                                    image: AssetImage(
                                                        'images/up.png'),
                                                  ),
                                                  iconSize: 50,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 100, 0),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                t,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                buttonmap(
                                                    content: upmap() + 4,
                                                    score: int.parse(
                                                        lsscore[index]),
                                                    nextmap: upscore() + 2000,
                                                    defaultscore:
                                                        upscore() + 2000,
                                                    a: widget.a,
                                                    b: widget.b)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                50, 0, 50, 0),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                t,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                buttonmap(
                                                    content: upmap() + 3,
                                                    score: int.parse(
                                                        lsscore[index]),
                                                    nextmap: upscore() + 1500,
                                                    defaultscore:
                                                        upscore() + 1500,
                                                    a: widget.a,
                                                    b: widget.b)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                50, 0, 50, 0),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                t,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                buttonmap(
                                                    content: upmap() + 2,
                                                    score: int.parse(
                                                        lsscore[index]),
                                                    nextmap: upscore() + 1000,
                                                    defaultscore:
                                                        upscore() + 1000,
                                                    a: widget.a,
                                                    b: widget.b)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                50, 0, 50, 0),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                t,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                buttonmap(
                                                    content: upmap() + 1,
                                                    score: int.parse(
                                                        lsscore[index]),
                                                    nextmap: upscore() + 500,
                                                    defaultscore:
                                                        upscore() + 500,
                                                    a: widget.a,
                                                    b: widget.b)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                50, 0, 0, 0),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                t,
                                            child: Row(
                                              children: [
                                                buttonmap(
                                                    content: upmap(),
                                                    score: int.parse(
                                                        lsscore[index]),
                                                    nextmap: upscore(),
                                                    defaultscore: upscore(),
                                                    a: widget.a,
                                                    b: widget.b),
                                              ],
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.popUntil(
                                                  context, (route) => false);
                                              Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              chude())))
                                                  .then((value) {
                                                if (value != null) {
                                                  final snackBar = SnackBar(
                                                      content: Text(value));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                              });
                                            },
                                            child: const Text(
                                              'Chủ Đề',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.green.shade600,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                        ));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Có Lỗi Xảy Ra'),
                    );
                  }
                  return CircularProgressIndicator();
                }),
          ),
        ],
      ),
    );
  }
}
