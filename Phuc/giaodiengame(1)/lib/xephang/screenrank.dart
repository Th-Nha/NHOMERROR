import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giaodiengame/Chung/header.dart';
import 'package:giaodiengame/trangchu/trangchu.dart';
import 'package:giaodiengame/xephang/detail.dart';

class rank extends StatefulWidget {
  const rank({super.key});

  @override
  State<rank> createState() => _rank();
}

class _rank extends State<rank> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final loginuser = _auth.currentUser;
    double chia = 8;
    double chia2 = 10;
    int font = 40;
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        )),
        SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    child: Row(
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
                          iconSize: MediaQuery.of(context).size.width / 8,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/cauhoi.png"),
                      ),
                    ),
                    child: header(title: 'Bảng Xếp Hạng'),
                  ),
                  Container(
                    child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("highscore")
                                .orderBy('createdate')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final emailLogon = _auth.currentUser!.email;
                                final data = snapshot.data!.docs.reversed;
                                List<rankdetail> lsscore = [];
                                for (var m in data) {
                                  var sender = m['email'];

                                  final mess = rankdetail(
                                      sender, m['score'], sender == emailLogon);
                                  lsscore.add(mess);
                                }
                                return Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: ListView.builder(
                                    itemCount: lsscore.length,
                                    itemBuilder: (context, index) => Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child: lsscore[index]),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Có Lỗi Xảy Ra'),
                                );
                              }
                              return CircularProgressIndicator();
                            })),
                  ),
                ],
              )),
        ),
      ],
    ));
  }
}
