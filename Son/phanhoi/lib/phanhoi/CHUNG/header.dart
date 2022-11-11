import 'package:flutter/material.dart';

class header extends StatelessWidget {
  header({super.key, required this.title, required this.content});
  String title;
  String content;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Row(children: [
        Container(
          child: ClipRRect(
            child: Container(
                child: Container(
              child: Icon(
                Icons.settings,
                size: 20,
              ),
            )),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 50),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 8, 23, 92)),
                )
              ],
            ))
      ]),
      Row(
        children: [
          Text(
            content,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
      Container(
        margin: EdgeInsets.all(10),
        color: Colors.black,
        height: 1,
        child: Row(),
      ),
    ]));
  }
}
