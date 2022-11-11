import 'package:flutter/material.dart';

class header extends StatelessWidget {
  header({super.key, required this.title, required String content});
  String title;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: MediaQuery.of(context).size.width / 10),
      ),
    );
  }
}
