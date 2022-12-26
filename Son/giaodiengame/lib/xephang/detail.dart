import 'package:flutter/material.dart';

class rankdetail extends StatelessWidget {
  String sender;
  String text;
  bool isMe;
  rankdetail(this.sender, this.text, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (!isMe)
            Container(
                child: Row(
              children: [
                Text(
                  'Tên: ' + sender,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        border: Border.all(width: 3, color: Colors.black)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Điểm: ' + text,
                        softWrap: true,
                        style: TextStyle(color: Colors.black, fontSize: 10),
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
                    fontSize: 12,
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
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 20,
                        child: Row(
                          children: [
                            Text(
                              'Điểm: ' + text,
                              softWrap: true,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                        )))
              ],
            ))
        ],
      ),
    );
  }
}
