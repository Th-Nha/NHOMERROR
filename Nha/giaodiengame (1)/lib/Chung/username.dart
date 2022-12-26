import 'package:flutter/material.dart';

class dataprofile extends StatelessWidget {
  dataprofile({super.key, required this.title, required this.temp});
  String title;
  String temp;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Container(
          child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Container(
                child: Row(
                  children: [
                    Text(
                      title + ': ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )),
          Container(
              child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 20,
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8),
                          ),
                        ),
                        labelText: temp,
                        labelStyle: MaterialStateTextStyle.resolveWith(
                            (Set<MaterialState> states) {
                          return TextStyle(
                              color: Colors.white, letterSpacing: 1.3);
                        }),
                      ),
                    ),
                  ))
            ],
          ))
        ],
      )),
    );
  }
}
