import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giaodiengame/choidon/choidon.dart';

class buttonmap extends StatelessWidget {
  buttonmap(
      {super.key,
      required this.content,
      required this.score,
      required this.nextmap,
      required this.defaultscore,
      required this.a,
      required this.b});
  int a;
  int b;
  int score;
  int nextmap;
  int defaultscore;
  int content;

  @override
  bool submit = false;
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: AssetImage('images/mapplay.png'), fit: BoxFit.cover)),
      child: TextButton(
        onPressed: () {
          if (score >= nextmap) {
            Navigator.popUntil(context, (route) => false);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => choidon(
                    nextquestion: 0,
                    point: defaultscore,
                    sumquestion: 0,
                    a: a,
                    b: b,
                  ),
                ));
          } else {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Thông Báo'),
                  content: Text('Không Đủ Điểm Để Tiếp Tục'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
            return null;
          }
        },
        child: Text(
          '$content',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.yellow, fontSize: 25),
        ),
      ),
    );
  }
}
