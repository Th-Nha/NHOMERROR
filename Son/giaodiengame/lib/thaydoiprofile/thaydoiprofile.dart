import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodiengame/Chung/username.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtbirthday = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtgmail = TextEditingController();
  double profile = 15;
  @override
  Widget build(BuildContext context) {
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
              },
              icon: Image.asset('images/back.png'),
              iconSize: MediaQuery.of(context).size.width / 8,
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.fromLTRB(35, 20, 10, 5),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("profile")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) => SingleChildScrollView(
                              child: Container(
                                child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(150),
                                                border: Border.all(
                                                  color: Colors.yellow,
                                                  width: 3,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(150),
                                                clipBehavior: Clip.antiAlias,
                                                child: Image.asset(
                                                  'images/avtda.png',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 35),
                                          child: Text(
                                            'Thông Tin Người Chơi',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    30,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              10, 20, 10, 5),
                                          color: Colors.black,
                                          height: 5,
                                        ),
                                        //GIoi tinh
                                        Row(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    profile,
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Giới Tính: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                20),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Container(
                                                child: Column(
                                              children: [
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            20,
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    child: Container(
                                                        child: Row(
                                                      children: [
                                                        Container(
                                                            child: Row(
                                                          children: [
                                                            Radio(
                                                                activeColor:
                                                                    Colors
                                                                        .white,
                                                                value: 1,
                                                                groupValue: snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                    ['gender'],
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'profile')
                                                                        .doc(
                                                                            "idprofile")
                                                                        .update({
                                                                      "gender":
                                                                          value
                                                                    });
                                                                  });
                                                                }),
                                                            Text(
                                                              'Nữ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )
                                                          ],
                                                        )),
                                                        Container(
                                                            child: Row(
                                                          children: [
                                                            Radio(
                                                                activeColor:
                                                                    Colors
                                                                        .white,
                                                                value: 2,
                                                                groupValue: snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                    ['gender'],
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'profile')
                                                                        .doc(
                                                                            "idprofile")
                                                                        .update({
                                                                      "gender":
                                                                          value
                                                                    });
                                                                  });
                                                                }),
                                                            Text(
                                                              'Nam',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )
                                                          ],
                                                        )),
                                                      ],
                                                    )))
                                              ],
                                            ))
                                          ],
                                        ),
                                        //ho ten
                                        Row(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    profile,
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Họ Tên: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Container(
                                                child: Column(
                                              children: [
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            20,
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    child: Container(
                                                      child: TextField(
                                                        controller: txtname,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              const Radius
                                                                  .circular(8),
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              const OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.2),
                                                          ),
                                                          labelText: snapshot
                                                                  .data!
                                                                  .docs[index]
                                                              ['name'],
                                                          labelStyle:
                                                              MaterialStateTextStyle
                                                                  .resolveWith(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                            return TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    1.3);
                                                          }),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ))
                                          ],
                                        ),
// ngay sinh
                                        Row(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    profile,
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Ngày Sinh: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Container(
                                                child: Column(
                                              children: [
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            20,
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    child: Container(
                                                      child: TextField(
                                                        controller: txtbirthday,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              const Radius
                                                                  .circular(8),
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              const OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.2),
                                                          ),
                                                          labelText: snapshot
                                                                  .data!
                                                                  .docs[index]
                                                              ['birthday'],
                                                          labelStyle:
                                                              MaterialStateTextStyle
                                                                  .resolveWith(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                            return TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    1.3);
                                                          }),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ))
                                          ],
                                        ),
// so dien thoai
                                        Row(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    profile,
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'SĐT: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Container(
                                                child: Column(
                                              children: [
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            20,
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    child: Container(
                                                      child: TextField(
                                                        controller: txtphone,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              const Radius
                                                                  .circular(8),
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              const OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.2),
                                                          ),
                                                          labelText: snapshot
                                                                  .data!
                                                                  .docs[index]
                                                              ['phone'],
                                                          labelStyle:
                                                              MaterialStateTextStyle
                                                                  .resolveWith(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                            return TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    1.3);
                                                          }),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ))
                                          ],
                                        ),
                                        //gmail
                                        Row(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    profile,
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Gmail: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Container(
                                                child: Column(
                                              children: [
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            20,
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    child: Container(
                                                      child: TextField(
                                                        controller: txtgmail,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              const Radius
                                                                  .circular(8),
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              const OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.2),
                                                          ),
                                                          labelText: snapshot
                                                                  .data!
                                                                  .docs[index]
                                                              ['gmail'],
                                                          labelStyle:
                                                              MaterialStateTextStyle
                                                                  .resolveWith(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                            return TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    1.3);
                                                          }),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ))
                                          ],
                                        ),

                                        //xu ly su kien
                                        Container(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 30, left: 20),
                                                  child: Column(children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              20,
                                                      child: Container(
                                                          child: TextButton(
                                                        onPressed: () {
                                                          txtname.clear();
                                                          txtbirthday.clear();
                                                          txtphone.clear();
                                                          txtgmail.clear();
                                                        },
                                                        child: Text(
                                                          'Hủy',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  30),
                                                        ),
                                                        style: ButtonStyle(
                                                            foregroundColor:
                                                                MaterialStateProperty.all<Color>(
                                                                    Colors
                                                                        .black),
                                                            backgroundColor:
                                                                MaterialStateProperty.all<Color>(
                                                                    Colors
                                                                        .orangeAccent),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(15),
                                                                    side: BorderSide(color: Colors.black)))),
                                                      )),
                                                    )
                                                  ]),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 30, left: 20),
                                                  child: Column(children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              20,
                                                      child: Container(
                                                          child: TextButton(
                                                        onPressed: () {
                                                          if (txtname.text ==
                                                              "") {
                                                            showDialog<void>(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Thông Báo'),
                                                                  content: Text(
                                                                      'Bạn Cần Nhập Đủ Thông Tin Trước Khi Lưu'),
                                                                  actions: <
                                                                      Widget>[
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'profile')
                                                                .doc(
                                                                    "idprofile")
                                                                .update({
                                                              "name":
                                                                  txtname.text,
                                                            });
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'profile')
                                                                .doc(
                                                                    "idprofile")
                                                                .update({
                                                              "birthday":
                                                                  txtbirthday
                                                                      .text,
                                                            });
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'profile')
                                                                .doc(
                                                                    "idprofile")
                                                                .update({
                                                              "phone":
                                                                  txtphone.text,
                                                            });
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'profile')
                                                                .doc(
                                                                    "idprofile")
                                                                .update({
                                                              "gmail":
                                                                  txtgmail.text,
                                                            });
                                                            showDialog<void>(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Thông Báo'),
                                                                  content: Text(
                                                                      'Bạn Đã Lưu'),
                                                                  actions: <
                                                                      Widget>[
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child: Text(
                                                          'Lưu',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  30),
                                                        ),
                                                        style: ButtonStyle(
                                                            foregroundColor:
                                                                MaterialStateProperty.all<Color>(
                                                                    Colors
                                                                        .black),
                                                            backgroundColor:
                                                                MaterialStateProperty.all<Color>(
                                                                    Colors
                                                                        .orangeAccent),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(15),
                                                                    side: BorderSide(color: Colors.black)))),
                                                      )),
                                                    )
                                                  ]),
                                                ),
                                              ]),
                                        )
                                      ],
                                    )),
                              ),
                            ));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Có Lỗi Xảy Ra'),
                    );
                  }
                  return CircularProgressIndicator();
                })),
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

// Container(
//     margin: EdgeInsets.fromLTRB(35, 20, 10, 5),
//     child: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection("profile")
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) => username(
//                 title: 'Họ Tên',
//                 temp: snapshot.data!.docs[index]['name'],
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Có Lỗi Xảy Ra'),
//             );
//           }
//           return CircularProgressIndicator();
//         })),
