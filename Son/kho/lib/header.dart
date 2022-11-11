import 'package:flutter/material.dart';

class header extends StatelessWidget {
  header({super.key, required this.title});
  String title;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.width / 20),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          color: Colors.black,
          height: 0.5,
        )
      ],
    ));
  }
}
