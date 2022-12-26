import 'dart:async';

import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';

class buttontime extends StatefulWidget {
  const buttontime({super.key});

  @override
  State<buttontime> createState() => _buttontime();
}

class _buttontime extends State<buttontime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TimeCircularCountdown(
        diameter: 75,
        unit: CountdownUnit.second,
        countdownTotal: 30,
        countdownCurrentColor: Colors.black,
        onUpdated: (unit, remainingTime) => print("$CountdownUnit.second"),
        onFinished: () => print("$CountdownUnit.second"),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        isClockwise: true,
      ),
    );
  }
}
