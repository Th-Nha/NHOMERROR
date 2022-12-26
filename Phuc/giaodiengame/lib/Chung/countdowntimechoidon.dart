import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:giaodiengame/choidon/choidon.dart';

class buttontime extends StatefulWidget {
  int i = 0;
  int point = 0;
  buttontime(
      {super.key,
      required this.i,
      required this.point,
      required this.a,
      required this.b});

  @override
  State<buttontime> createState() => _buttontime();
  int a;
  int b;
}

class _buttontime extends State<buttontime> {
  @override
  Widget build(BuildContext context) {
    int nextquestion() {
      int t = widget.i;
      return t;
    }

    int point() {
      int p = widget.point;
      return p;
    }

    return Container(
      child: TimeCircularCountdown(
        diameter: 60,
        unit: CountdownUnit.second,
        countdownTotal: 15,
        countdownCurrentColor: Colors.black,
        onUpdated: (unit, remainingTime) => print("$CountdownUnit.second"),
        onFinished: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => choidon(
                  nextquestion: nextquestion(),
                  point: point(),
                  sumquestion: 0,
                  a: nextquestion(),
                  b: nextquestion(),
                ),
              ));
        },
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        isClockwise: true,
      ),
    );
  }
}
