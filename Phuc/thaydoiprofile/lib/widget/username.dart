import 'package:flutter/material.dart';

class username extends StatelessWidget {
  username({super.key, required this.title, required this.temp});
  String title;
  String temp;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 5,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title + ': ',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )),
          Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 20,
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 5, color: Colors.black)),
                          labelText: temp,
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      )),
    );
  }
}
