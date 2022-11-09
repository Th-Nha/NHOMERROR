import 'package:flutter/material.dart';

class button extends StatelessWidget {
  button({super.key, required this.content});
  String content;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 10,
      padding: EdgeInsets.only(top: 10, left: 10),
      child: SizedBox(
        child: TextButton(
          onPressed: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Chưa Code Xong HEHE'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                });
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content,
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 253, 29), fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
