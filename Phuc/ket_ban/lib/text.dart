import 'package:flutter/material.dart';
import 'package:tim_tran/button.dart';

class Text_content extends StatelessWidget {
  Text_content({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
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
                          title: const Text('Thêm '),
                          content: Text('Bạn Thêm Thành Công ' + title),
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
                    'Thêm',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width / 30),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.black)))),
                )),
              )
            ]),
          )
        ],
      ),
    );
  }
}
