import 'package:flutter/material.dart';

class elevated extends StatelessWidget {
  elevated({
    super.key,
    required this.path,
    required this.name,
    required this.mau,
    required this.screen,
  });
  String path;
  String name;
  Color mau;
  Widget screen;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 10 + 2,
            padding: EdgeInsets.all(5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 5,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screen,
                        ));
                  },
                  child: Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            path,
                            width: MediaQuery.of(context).size.width / 12,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(mau))),
            )),
      ],
    );
  }
}
