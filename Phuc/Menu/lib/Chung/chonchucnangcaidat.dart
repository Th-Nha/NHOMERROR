import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.title, required this.screen});
  String title;
  Widget screen;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 15,
          child: Container(
              child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => screen,
                  ));
            },
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width / 30),
            ),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.greenAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.black)))),
          )),
        )
      ]),
    );
  }
}
