import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:giaodiengame/choidoikhang/choidoikhang.dart';

class buttontimedoikhang extends StatefulWidget {
  int nextquestion;
  int point;
  int sumquestion;
  String emailfriend;

  buttontimedoikhang({
    super.key,
    required this.point,
    required this.nextquestion,
    required this.sumquestion,
    required this.emailfriend,
  });

  @override
  State<buttontimedoikhang> createState() => _buttontimedoikhang();
}

class _buttontimedoikhang extends State<buttontimedoikhang> {
  int nextquestion() {
    int t = widget.nextquestion;
    return t;
  }

  int point() {
    int p = widget.point;
    return p;
  }

  int Squestion() {
    int squestion = widget.sumquestion;
    return squestion;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TimeCircularCountdown(
        diameter: 50,
        unit: CountdownUnit.second,
        countdownTotal: 15,
        countdownCurrentColor: Colors.black,
        onUpdated: (unit, remainingTime) => print("$CountdownUnit.second"),
        onFinished: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChoiDoiKhang(
                  emailfriend: widget.emailfriend,
                  sumquestion: Squestion(),
                  point: point(),
                ),
              ));
        },
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        isClockwise: true,
      ),
    );
  }
}
