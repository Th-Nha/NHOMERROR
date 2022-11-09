import 'package:flutter/material.dart';
import 'package:random/Chung/header.dart';
import 'package:random/setting/setting.dart';

class amthanh extends StatefulWidget {
  const amthanh({super.key});

  @override
  State<amthanh> createState() => _amthanh();
}

Color? getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused
  };
}

class _amthanh extends State<amthanh> {
  double amthanhtong = 0;
  double nhac = 0;
  double sfc = 0;
  bool light = true;
  bool light2 = true;
  bool? nhactrongsanh = true;
  bool? nhacdangnhap = true;
  bool? nhactimtran = true;
  bool? nhacnen = true;
  bool? amthanhkhicham = true;
  bool? rungkhitimtran = true;
  Color? color = Colors.blue[50];
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
          child: Column(
            children: [
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
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
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
                title: 'Âm Thanh',
              ),
              Column(
                children: [
                  Text(
                    'Âm Thanh Tổng',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Slider(
                    thumbColor: Color.fromARGB(255, 9, 97, 212),
                    activeColor: Color.fromARGB(255, 9, 97, 212),
                    min: 0,
                    max: 10,
                    value: amthanhtong,
                    label: '$amthanhtong',
                    onChanged: (newValue) => setState(
                      () {
                        amthanhtong = newValue;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nhạc',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Switch(
                          value: light,
                          activeColor: Colors.black,
                          onChanged: (bool value) {
                            setState(() {
                              if (value == false) {
                                nhac = 0;
                                nhactrongsanh = false;
                                nhacdangnhap = false;
                                nhactimtran = false;
                              } else {
                                nhac = 5;
                                nhactrongsanh = true;
                                nhacdangnhap = true;
                                nhactimtran = true;
                              }
                              light = value;
                            });
                          }),
                    ],
                  ),
                  Slider(
                    thumbColor: Color.fromARGB(255, 9, 97, 212),
                    activeColor: Color.fromARGB(255, 9, 97, 212),
                    min: 0,
                    max: 10,
                    value: nhac,
                    label: '$nhac',
                    onChanged: (newValue) => setState(
                      () {
                        if (nhac == 0) {
                          light = false;
                        } else {
                          light = true;
                        }
                        nhac = newValue;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: nhactrongsanh,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          onChanged: (bool? value) {
                            setState(() {
                              nhactrongsanh = value;
                            });
                          }),
                      Text(
                        'Nhạc Chở Trong Sảnh',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: nhacdangnhap,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          onChanged: (bool? value) {
                            setState(() {
                              nhacdangnhap = value;
                            });
                          }),
                      Text(
                        'Nhạc Khi Đăng Nhập',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: nhactimtran,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          onChanged: (bool? value) {
                            setState(() {
                              nhactimtran = value;
                            });
                          }),
                      Text(
                        'Âm Thanh Khi Tìm Trận',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SFC',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Switch(
                              value: light2,
                              activeColor: Colors.black,
                              onChanged: (bool value) {
                                setState(() {
                                  if (value == false) {
                                    sfc = 0;
                                    nhacnen = false;
                                    amthanhkhicham = false;
                                    rungkhitimtran = false;
                                  } else {
                                    sfc = 5;
                                    nhacnen = true;
                                    amthanhkhicham = true;
                                    rungkhitimtran = true;
                                  }
                                  light2 = value;
                                });
                              }),
                        ],
                      ),
                      Slider(
                        thumbColor: Color.fromARGB(255, 9, 97, 212),
                        activeColor: Color.fromARGB(255, 9, 97, 212),
                        min: 0,
                        max: 10,
                        value: sfc,
                        label: '$sfc',
                        onChanged: (newValue) => setState(
                          () {
                            if (newValue == 0) {
                              light2 = false;
                            } else {
                              light2 = true;
                            }
                            sfc = newValue;
                          },
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                  value: nhacnen,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      nhacnen = value;
                                    });
                                  }),
                              Text(
                                'Âm Thanh Nền',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                  value: amthanhkhicham,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      amthanhkhicham = value;
                                    });
                                  }),
                              Text(
                                'Âm Thanh Khi Cham',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                  value: rungkhitimtran,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rungkhitimtran = value;
                                    });
                                  }),
                              Text(
                                'Rung Khi Tìm Trận',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          )),
    )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
