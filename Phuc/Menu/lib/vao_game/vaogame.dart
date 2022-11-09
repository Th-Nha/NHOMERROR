import 'package:flutter/material.dart';
import 'package:random/Chung/button.dart';
import 'package:random/Chung/countdowntime.dart';
import 'package:random/Chung/header.dart';
import 'package:random/xephang/screenrank.dart';

class vaogame extends StatefulWidget {
  vaogame({super.key});
  @override
  State<vaogame> createState() => _vaogame();
}

class _vaogame extends State<vaogame> {
  double sizeicon = 65;
  double chia = 5;
  double chia2 = 9;
  int font = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/TG.jpg'), fit: BoxFit.cover)),
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.height / 10,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.red, width: 3),
                            ),
                            child: SizedBox(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  size: MediaQuery.of(context).size.height / 20,
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          'Point: 0',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Money: 0',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  )),
              buttontime(),
              Container(
                child: Column(children: [
                  Container(
                    child: Column(children: [
                      Text(
                        'Câu Hỏi: Đây là đâu ?',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                      ),
                    ]),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      button(
                        content: "Dap An 1",
                      ),
                      button(content: "Dap An 2"),
                      button(content: "Dap An 3"),
                      button(content: "Dap An 4")
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 5,
                    color: Colors.black,
                    child: Row(),
                  ),
                ]),
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(
                            Icons.lightbulb_circle,
                            color: Colors.yellow,
                            size: sizeicon,
                          ),
                          Text(
                            'Gợi Ý',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(
                            Icons.store,
                            color: Colors.black,
                            size: sizeicon,
                          ),
                          Text(
                            'Cửa Hàng',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(
                              Icons.skip_next_sharp,
                              color: Colors.blue,
                              size: sizeicon,
                            ),
                            Text(
                              'Bỏ Qua',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                  ])),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Quay Lại',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => rank(),
                                ));
                          },
                          child: Text(
                            'Đầu Hàng',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w800),
                          )),
                    )
                  ],
                ),
              )
            ]),
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
