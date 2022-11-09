import 'package:flutter/material.dart';

class xephang extends StatelessWidget {
  xephang(
      {super.key,
      required this.thanhtich,
      required this.rank,
      required this.cap,
      required this.ten,
      required this.ttcd,
      required this.ttcn});
  String thanhtich, cap, ten, ttcn, ttcd;
  String rank;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double chia = 5;
    double chia2 = 9;
    int font = 25;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 50),
      child: Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: MediaQuery.of(context).size.width / chia2,
            child: Row(
              children: [
                Text(
                  thanhtich,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / font,
                      fontWeight: FontWeight.w600,
                      color: Colors.yellow),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 10,
            child: Row(
              children: [
                Image(
                  image: AssetImage(rank),
                  width: MediaQuery.of(context).size.width / 20,
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 20,
            child: Row(
              children: [
                Text(cap,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / font,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / chia,
            child: Row(
              children: [
                Text(ten,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / font,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 5,
            child: Row(
              children: [
                Text(ttcn,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / font,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow)),
                Image(
                    image: AssetImage('images/cup.png'),
                    width: MediaQuery.of(context).size.width / 20)
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 5,
            child: Row(
              children: [
                Text(ttcd,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / font,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow)),
                Image(
                    image: AssetImage('images/cup.png'),
                    width: MediaQuery.of(context).size.width / 20)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
