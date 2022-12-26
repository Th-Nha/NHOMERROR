import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:giaodiengame/choidoikhang/choidoikhang.dart';

import 'package:giaodiengame/trangchu/trangchu.dart';

class danhsach extends StatefulWidget {
  int nextquestion;
  int point;
  int sumquestion;
  danhsach({
    super.key,
    required this.nextquestion,
    required this.point,
    required this.sumquestion,
  });

  @override
  State<danhsach> createState() => _danhsach();
}

class _danhsach extends State<danhsach> {
  final _auth = FirebaseAuth.instance;

  String default_img = 'images/amthah.png';
  @override
  void initState() {
    super.initState();
  }

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
    int p = widget.point;
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
            Text(
              'Danh Sách Phòng Chơi',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.fromLTRB(35, 20, 10, 5),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .where('email', isNotEqualTo: loginuser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!.docs;
                List<String> lsuser = [];
                for (var row in data) {
                  final r = row.data() as Map<String, dynamic>;
                  lsuser.add(r['email']);
                }
                return ListView.builder(
                  itemCount: lsuser.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Card(
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            'Phòng Chơi',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChoiDoiKhang(
                                          point: 0,
                                          sumquestion: 0,
                                          emailfriend: lsuser[index],
                                        )));
                          },
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Có Lỗi Xảy Ra'),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        )
      ],
    ));
  }
}
