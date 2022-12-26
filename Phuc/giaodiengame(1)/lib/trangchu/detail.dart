import 'package:flutter/material.dart';

class highscoredetail extends StatelessWidget {
  String sender;
  String text;
  bool isMe;
  highscoredetail(this.sender, this.text, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (isMe)
            Container(
                child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        border: Border.all(width: 3, color: Colors.red)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height / 16,
                            child: Row(
                              children: [
                                Text(
                                  'HighScore: ' + text,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ))
                      ],
                    )))
        ],
      ),
    );
  }
}
