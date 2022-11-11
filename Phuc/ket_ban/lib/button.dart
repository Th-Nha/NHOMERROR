import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.title});
  String title;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20),
      child: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 15,
          child: Container(
              child: TextButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thêm'),
                    content: Text('Bạn Tìm Thành Công '),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
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
                    MaterialStateProperty.all<Color>(Colors.orange),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.black)))),
          )),
        )
      ]),
    );
  }
}
