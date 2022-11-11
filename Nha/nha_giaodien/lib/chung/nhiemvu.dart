import 'package:flutter/material.dart';
import 'package:nha_giaodien/Menu/menu.dart';
import 'package:nha_giaodien/main.dart';

class nhiemvu extends StatelessWidget {
  nhiemvu({super.key, required this.namennv, required this.checkicon});
  String namennv;
  Color checkicon;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: TextButton(
                onPressed: () {},
                child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        namennv,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: checkicon,
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
