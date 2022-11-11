import 'package:flutter/material.dart';
// import 'package:dmo/chung/banbe.dart';
import 'package:nha_giaodien/chung/buttoncolum.dart';
import 'package:nha_giaodien/chung/buttonicon.dart';
import 'package:nha_giaodien/Chung/chonmanchoi.dart';
import 'package:nha_giaodien/chung/elevatedbutton.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/TG.jpg"),
            fit: BoxFit.cover,
          ),
        )),
        Container(
            child: Container(
          child: Container(
              padding: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height / 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Buttonicon(content: '50000', name: Icons.star)
                        ],
                      ),
                      Row(
                        children: [
                          Buttonicon(
                              content: '50000',
                              name: Icons.attach_money_outlined)
                        ],
                      ),
                      Row(
                        children: [
                          Buttonicon(
                              content: '50000', name: Icons.favorite_rounded)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                border: Border.all(
                                  color: Colors.amber,
                                  width: 5,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  'image/avtda.png',
                                  width:
                                      MediaQuery.of(context).size.height / 10,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 35),
                              child: Text(
                                'Sơn KUTE 1234456',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width / 1,
                          height: MediaQuery.of(context).size.height / 10,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChonManChoi(),
                                      ));
                                });
                              },
                              child: Text(
                                'Chơi',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 15,
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ))))),
                    ],
                  ),
                  Container(
                    child: Container(
                        child: Column(
                      children: [
                        DefaultTabController(
                            length: 3,
                            child: Column(children: <Widget>[
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  //height of TabBarView

                                  child: TabBarView(children: <Widget>[
                                    Container(
                                        child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            elevated(
                                              path: 'image/chiendau.png',
                                              name: 'Giao Đấu',
                                              mau: Colors.grey,
                                            ),
                                            elevated(
                                              path: 'image/vs.png',
                                              name: 'Thi Đấu',
                                              mau: Color.fromARGB(
                                                  255, 105, 174, 230),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            elevated(
                                              path: 'image/phanthuong.png',
                                              name: 'Thưởng Hàng Ngày',
                                              mau: Colors.pink,
                                            ),
                                            elevated(
                                              path: 'image/minigame.png',
                                              name: 'MiniGame ',
                                              mau: Colors.amber,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            elevated(
                                              path: 'image/cup.png',
                                              name: 'Xếp Hạng',
                                              mau: Colors.pink,
                                            ),
                                             elevated(
                                              path: 'image/napxu.png',
                                              name: 'Nạp xu',
                                              mau: Colors.amber,
                                              
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                  ])),
                            ])),
                      ],
                    )),
                  ),
                  Container(
                    color: Color.fromARGB(255, 59, 15, 66),
                    height: MediaQuery.of(context).size.height / 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttoncolum(
                          content: 'Hồ Sơ',
                          name: Icons.account_box,
                        ),
                        buttoncolum(
                          content: 'Lịch Sử',
                          name: Icons.access_time_filled_outlined,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1,
                          width: MediaQuery.of(context).size.height / 10,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 148, 148, 148),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.width / 8,
                                  ),
                                )
                              ]),
                        ),
                        buttoncolum(
                          content: 'Cửa Hàng',
                          name: Icons.shopping_cart,
                        ),
                        buttoncolum(
                          content: 'Cài Đặt ',
                          name: Icons.settings,
                        ),
                      ],
                    ),
                  ),
                ],
                
              )),
        )),
      ], // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
