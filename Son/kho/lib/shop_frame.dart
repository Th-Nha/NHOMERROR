import 'package:flutter/material.dart';
import 'package:kho/header.dart';

class Imgframe extends StatelessWidget {
  Imgframe(
      {super.key,
      required this.path,
      required this.caption,
      required this.price});
  String path;
  String caption;
  String price;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          width: (MediaQuery.of(context).size.width / 2),
          height: (MediaQuery.of(context).size.height / 2),
          child: Row(children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2)),
                  child: Image(
                    image: NetworkImage(path),
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: ((MediaQuery.of(context).size.width / 3) - 10) / 2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 1),
                  width: (MediaQuery.of(context).size.width / 2),
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        caption,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: (MediaQuery.of(context).size.height / 50),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          color: Color.fromARGB(255, 196, 69, 59),
                          fontSize: (MediaQuery.of(context).size.height / 40),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox.fromSize(
                          size: Size(
                            (MediaQuery.of(context).size.width / 5),
                            (MediaQuery.of(context).size.height / 20),
                          ),
                          child: ElevatedButton(
                            child: Text(
                              "Tặng",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50),
                            ),
                            onPressed: () {},
                          ))
                    ],
                  )),
                )
              ],
            )
          ]),
        ));
  }
}
