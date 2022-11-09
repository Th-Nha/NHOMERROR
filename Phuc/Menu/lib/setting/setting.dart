import 'package:flutter/material.dart';
import 'package:random/Chung/chonchucnangcaidat.dart';
import 'package:random/Chung/header.dart';
import 'package:random/setting/amthanh.dart';
import 'package:random/setting/giaodien.dart';
import 'package:random/setting/thaydoingonngu.dart';
import 'package:random/setting/thongbao.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _setting();
}

class _setting extends State<setting> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [header(title: 'Cài Đặt')],
          ),
          Container(
            color: Colors.black,
            height: 0.5,
          ),
          Container(
              child: Column(
            children: [
              Button(
                title: 'Âm Thanh',
                screen: amthanh(),
              ),
              Button(
                title: 'Giao Diện',
                screen: giaodien(),
              ),
              Button(
                title: 'Thông Báo',
                screen: thongbao(),
              ),
              // Button(title: 'Độ Họa')
              Button(title: 'Thay Đổi Ngôn Ngữ', screen: ngonngu()),
            ],
          )),
        ]),
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
