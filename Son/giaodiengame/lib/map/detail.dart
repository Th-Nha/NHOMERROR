import 'package:flutter/material.dart';

class mapdetail extends StatelessWidget {
  String sender;
  String text;
  bool isMe;
  mapdetail(this.sender, this.text, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.center : CrossAxisAlignment.center,
        children: [
          if (!isMe)
            Container(
                child: Row(
              children: [
                Text(
                  'Tên: ' + sender,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        border: Border.all(width: 3, color: Colors.red)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Điểm: ' + text,
                        softWrap: true,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ))
              ],
            ))
          else
            Container(
                child: Row(
              children: [
                Text(
                  'Tên: ' + sender,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        border: Border.all(width: 3, color: Colors.red)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Điểm: ' + text,
                        softWrap: true,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ))
              ],
            ))
        ],
      ),
    );
  }
}
