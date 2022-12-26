import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giaodiengame/lichsu/historydetail.dart';
import 'package:giaodiengame/trangchu/trangchu.dart';

class lichsu extends StatefulWidget {
  const lichsu({super.key});

  @override
  State<lichsu> createState() => _lichsu();
}

class _lichsu extends State<lichsu> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  int? role = 1;
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
          )),
        ),
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
              iconSize: MediaQuery.of(context).size.width / 8,
            ),
          ],
        ),
        Container(
          child: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.fromLTRB(35, 20, 10, 5),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 35),
                    child: Text(
                      'Kết Quả Các Trận Đấu Gần Đây',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    color: Colors.black,
                    height: 5,
                  ),
                ],
              )),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          margin: EdgeInsets.fromLTRB(35, 100, 10, 5),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('history')
                .where('result')
                .snapshots(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                final emailLogon = _auth.currentUser!.email;
                final data = snapshot.data!.docs.reversed;
                List<historydetail> lsMess = [];
                for (var m in data) {
                  var user1 = m['email'];
                  final result =
                      historydetail(user1, m['result'], user1 == emailLogon);
                  lsMess.add(result);
                }
                return GridView.builder(
                  reverse: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: lsMess.length,
                  itemBuilder: (context, index) => lsMess[index],
                );
                ;
              }
              return CircularProgressIndicator();
            }),
          ),
        ),
      ],
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
