import 'package:flutter/material.dart';

class username extends StatelessWidget {
  username({super.key, required this.title, required this.temp});
  String title;
  String temp;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title + ': ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 25,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    temp,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 25,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
