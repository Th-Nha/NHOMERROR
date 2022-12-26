import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giaodiengame/choidoikhang/danhsach.dart';
import 'package:giaodiengame/chude/chude.dart';
import 'package:giaodiengame/lichsu/lichsu.dart';
import 'package:giaodiengame/thaydoiprofile/thaydoiprofile.dart';
import 'package:giaodiengame/trangchu/detail.dart';
import 'package:giaodiengame/welcome.dart';
import 'package:giaodiengame/xephang/screenrank.dart';
import 'package:audioplayers/audioplayers.dart';

class trangchu extends StatefulWidget {
  trangchu({super.key});
  @override
  State<trangchu> createState() => _trangchu();
}

class _trangchu extends State<trangchu> {
  @override
  void initState() {
    super.initState();
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String default_img = 'images/amthah.png';
  String audio = 'button.mp3';
  @override
  Widget build(BuildContext context) {
    final loginuser = _auth.currentUser;
    final player = AudioCache();
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 8,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("highscore")
                            .orderBy('createdate')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final emailLogon = _auth.currentUser!.email;
                            final data = snapshot.data!.docs.reversed;
                            List<highscoredetail> lsscore = [];
                            for (var m in data) {
                              var sender = m['email'];

                              final mess = highscoredetail(
                                  sender, m['score'], sender == emailLogon);
                              lsscore.add(mess);
                            }
                            return Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: ListView.builder(
                                itemCount: lsscore.length,
                                itemBuilder: (context, index) =>
                                    Container(child: lsscore[index]),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Có Lỗi Xảy Ra'),
                            );
                          }
                          return CircularProgressIndicator();
                        })),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 10,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/button.png'),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                player.play('$audio');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => chude(),
                                    ));
                              },
                              child: Text(
                                'Bắt Đầu',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 10,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/button.png'),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                player.play('$audio');
                                Navigator.popUntil(context, (route) => false);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => danhsach(
                                            nextquestion: 0,
                                            point: 0,
                                            sumquestion: 0)));
                              },
                              child: Text(
                                'Đấu Trường',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 10,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/button.png'),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                player.play('$audio');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => rank(),
                                    ));
                              },
                              child: Text(
                                'Xếp Hạng',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height / 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          player.play('$audio');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => profile(),
                              ));
                        },
                        icon: Image.asset('images/profile.png'),
                        iconSize: MediaQuery.of(context).size.width / 6,
                      ),
                      IconButton(
                        onPressed: () {
                          player.play('$audio');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => lichsu(),
                              ));
                        },
                        icon: Image.asset('images/lichsu.png'),
                        iconSize: MediaQuery.of(context).size.width / 5,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (default_img == 'images/huy.png') {
                              default_img = 'images/amthah.png';
                              audio = '';
                            } else {
                              default_img = 'images/huy.png';
                              audio = 'button.mp3';
                            }
                          });
                        },
                        icon: Image.asset(default_img),
                        iconSize: MediaQuery.of(context).size.width / 6,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('MESSAGER!'),
                                content: Text('Bạn Có Chắc Muốn Đăng Xuất!!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Text('Mời Bạn Tiếp Tục Trả Nghiệm Game!');
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Không'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.signOut();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  WelcomeScreen())));
                                    },
                                    child: const Text('Có'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Image.asset('images/exit.png'),
                        iconSize: MediaQuery.of(context).size.width / 6,
                      ),
                    ],
                  ),
                )
              ]),
            )));
  }
}
