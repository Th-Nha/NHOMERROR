import 'package:flutter/material.dart';
import 'package:random/Chung/header.dart';
import 'package:random/setting/setting.dart';

class thongbao extends StatefulWidget {
  const thongbao({super.key});

  @override
  State<thongbao> createState() => _thongbao();
}

Color? getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused
  };
}

class _thongbao extends State<thongbao> {
  Color? color = Colors.blue[50];
  bool thongbaotong = true;
  bool thongbaosukien = true;
  bool? khuyenmai = true;
  bool? giaidau = true;
  bool? hoatdong = true;
  bool? quatang = true;

  bool thongbaoclan = true;
  bool? thongbaohoatdong = true;
  bool? thongbaochaomung = true;
  bool? thongbaonhanthuong = true;
  bool? thongbaoloimoi = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/TG.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.height / 10,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.red, width: 3),
                ),
                child: SizedBox(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => setting(),
                          ));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: MediaQuery.of(context).size.height / 20,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ],
          ),
          header(
            title: 'Thông Báo',
          ),
          Row(
            children: [
              Text(
                'Thông Báo Tổng',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Switch(
                  value: thongbaotong,
                  activeColor: Colors.black,
                  onChanged: (bool value) {
                    setState(() {
                      if (value == false) {
                        khuyenmai = hoatdong = giaidau = quatang =
                            thongbaosukien = thongbaohoatdong =
                                thongbaochaomung = thongbaonhanthuong =
                                    thongbaoloimoi = thongbaoclan = false;
                      } else {
                        khuyenmai = hoatdong = giaidau = quatang =
                            thongbaosukien = thongbaohoatdong =
                                thongbaochaomung = thongbaonhanthuong =
                                    thongbaoloimoi = thongbaoclan = true;
                      }
                      thongbaotong = value;
                    });
                  })
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Thông Báo Sự Kiện',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Switch(
                      value: thongbaosukien,
                      activeColor: Colors.black,
                      onChanged: (bool value) {
                        setState(() {
                          if (value == false) {
                            khuyenmai = hoatdong = giaidau = quatang = false;
                          } else {
                            khuyenmai = hoatdong = giaidau = quatang = true;
                          }

                          thongbaosukien = value;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: khuyenmai,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          khuyenmai = value;
                        });
                      }),
                  Text(
                    'Khuyến Mãi',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: giaidau,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          giaidau = value;
                        });
                      }),
                  Text(
                    'Giải Đấu',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: hoatdong,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          hoatdong = value;
                        });
                      }),
                  Text(
                    'Hoạt Động',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: quatang,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          quatang = value;
                        });
                      }),
                  Text(
                    'Quà Tặng',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Thông Báo Clan',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Switch(
                      value: thongbaoclan,
                      activeColor: Colors.black,
                      onChanged: (bool value) {
                        setState(() {
                          if (value == false) {
                            thongbaohoatdong = thongbaochaomung =
                                thongbaonhanthuong = thongbaoloimoi = false;
                          } else {
                            thongbaohoatdong = thongbaochaomung =
                                thongbaonhanthuong = thongbaoloimoi = true;
                          }

                          thongbaoclan = value;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: thongbaohoatdong,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          thongbaohoatdong = value;
                        });
                      }),
                  Text(
                    'Thông Báo Hoạt Động',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: thongbaochaomung,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          thongbaochaomung = value;
                        });
                      }),
                  Text(
                    'Thông Báo Chào Mừng',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: thongbaonhanthuong,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          thongbaonhanthuong = value;
                        });
                      }),
                  Text(
                    'Thông Báo Nhận Thưởng',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: thongbaoloimoi,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          thongbaoloimoi = value;
                        });
                      }),
                  Text(
                    'Thông Báo Lời Mời',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
