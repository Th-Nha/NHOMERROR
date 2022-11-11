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
                        fontSize: MediaQuery.of(context).size.width / 30,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 30,
                    padding: EdgeInsets.only(top: 30),
                    child: Container(child: Text(temp)),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
