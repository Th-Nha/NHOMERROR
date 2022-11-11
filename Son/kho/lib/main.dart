import 'package:flutter/material.dart';
import 'package:kho/header.dart';
import 'shop_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Kho Vật Phẩm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    List<Imgframe> lstframe = new List<Imgframe>.filled(
        0,
        Imgframe(
          path: '',
          caption: '',
          price: '',
        ),
        growable: true);
    for (var i = 0; i < Imginfo.lstImgInfo.length; i++) {
      lstframe.add(Imgframe(
        path: Imginfo.lstImgInfo[i].path,
        caption: Imginfo.lstImgInfo[i].caption,
        price: Imginfo.lstImgInfo[i].price,
      ));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/TG.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kho Vật Phẩm",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: lstframe.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Imgframe(
                          path: lstframe[index].path,
                          caption: lstframe[index].caption,
                          price: lstframe[index].price,
                        )
                      ],
                    ));
              },
            )
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Imginfo {
  Imginfo({required this.path, required this.caption, required this.price});
  String path;
  String caption;
  String price;
  static List<Imginfo> lstImgInfo = [
    Imginfo(
        path:
            'https://www.digiseller.ru/preview/322612/p1_3433599_c5bff948.jpg',
        caption: 'Thẻ Đổi Tên',
        price: '1'),
    Imginfo(
        path:
            'https://www.digiseller.ru/preview/322612/p1_3433599_c5bff948.jpg',
        caption: 'Thẻ Mua Gợi Ý',
        price: '2'),
    Imginfo(
        path:
            'https://www.digiseller.ru/preview/322612/p1_3433599_c5bff948.jpg',
        caption: 'Thẻ Mua Đáp Án',
        price: '4'),
    Imginfo(
        path:
            'https://www.digiseller.ru/preview/322612/p1_3433599_c5bff948.jpg',
        caption: 'Thẻ....',
        price: '1'),
  ];
}
