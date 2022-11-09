import 'package:flutter/material.dart';

class Buttonicon extends StatelessWidget {
  Buttonicon({super.key, required this.content, required this.name});
  String content;
  IconData name;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: TextButton(
          onPressed: () {},
          child: Container(
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 85, 197, 248),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(
                                name,
                                size: MediaQuery.of(context).size.width / 25,
                                color: Colors.yellow,
                              ),
                            ),
                            Text(
                              content,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 35,
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ))),
    );
  }
}
