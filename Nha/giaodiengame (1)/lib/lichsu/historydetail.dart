import 'package:flutter/material.dart';

class historydetail extends StatelessWidget {
  String sender;
  String text;
  bool isMe;
  historydetail(this.sender, this.text, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (!isMe)
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Trận Đấu',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  Text(
                    sender,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          else
            Text(
              'Bạn',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
            color: isMe ? Colors.red : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                softWrap: true,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
