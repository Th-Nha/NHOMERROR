import 'package:flutter/material.dart';
import 'package:random/main.dart';

class buttoncolum extends StatelessWidget {
  buttoncolum(
      {super.key,
      required this.content,
      required this.name,
      required this.screen});
  String content;
  Widget screen;
  IconData name;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width / 6,
        child: Container(
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screen,
                    ));
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          name,
                          size: MediaQuery.of(context).size.width / 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          content,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 42,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
