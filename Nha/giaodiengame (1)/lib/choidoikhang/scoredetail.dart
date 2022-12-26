import 'package:flutter/material.dart';

class MessagaBubble extends StatelessWidget {
  String sender;
  String text;
  bool isMe;
  MessagaBubble(this.sender, this.text, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            Container(
              child: Row(
                children: [
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
                    color: isMe ? Colors.blue : Colors.white,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        text,
                        softWrap: true,
                        style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Text(
                    ' Điểm Đối Thủ ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              child: Row(
                children: [
                  Text(
                    'Điểm Của Bạn ',
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
                    color: isMe ? Colors.blue : Colors.white,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        text,
                        softWrap: true,
                        style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
