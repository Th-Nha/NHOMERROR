import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.title, required this.pathscreen});
  String title;
  Widget pathscreen;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 15,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isActive);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pathscreen,
                    ));
              },
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.width / 30),
              ),
            ))
      ]),
    );
  }
}
