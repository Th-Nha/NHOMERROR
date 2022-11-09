import 'package:flutter/material.dart';
import 'package:random/Chung/Flag.dart';
import 'package:random/Chung/header.dart';
import 'package:random/Chung/quaman2.dart';

class ChonManChoi extends StatefulWidget {
  ChonManChoi({super.key});

  @override
  State<ChonManChoi> createState() => _ChonManChoi();
}

class _ChonManChoi extends State<ChonManChoi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/TG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
              header(title: 'Màn 1'),
              Row(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flag(
                            path: 'images/USA.png',
                          ),
                        ],
                      )),
                  Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flag(
                            path: 'images/Cuba.png',
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height / 4,
                              child: Column(
                                children: [
                                  Flag(
                                    path: 'images/Portugal.png',
                                  ),
                                ],
                              ))
                        ],
                      )),
                  Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flag(
                            path: 'images/VN.png',
                          ),
                        ],
                      )),
                  Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flag(
                            path: 'images/Russia.png',
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height / 4,
                              child: Column(
                                children: [
                                  Flag(
                                    path: 'images/Argentina.png',
                                  ),
                                ],
                              )),
                        ],
                      )),
                  Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flag(
                            path: 'images/England.jpg',
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: SizedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChonManChoi()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              border: Border.all(
                                width: 2,
                              ),
                            ),
                            child: Container(
                                child: IconButton(
                                    tooltip: 'Quay Lại',
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                        PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              ChonManChoi(),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: RotationTransition(
                                                turns: Tween<double>(
                                                        begin: 0.5, end: 1.0)
                                                    .animate(
                                                  animation,
                                                ),
                                                child: child,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.navigate_before,
                                      color: Colors.yellow,
                                      size: MediaQuery.of(context).size.height /
                                          25,
                                    )))),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  border: Border.all(
                                    width: 2,
                                  ),
                                ),
                                child: Container(
                                    child: IconButton(
                                        tooltip: 'Qua Màn',
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              opaque: false,
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  ChonManChoi2(),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return FadeTransition(
                                                  opacity: animation,
                                                  child: RotationTransition(
                                                    turns: Tween<double>(
                                                            begin: 0.5,
                                                            end: 1.0)
                                                        .animate(
                                                      animation,
                                                    ),
                                                    child: child,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.navigate_next_rounded,
                                          color: Colors.yellow,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              25,
                                        )))),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
