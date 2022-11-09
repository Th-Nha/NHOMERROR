import 'package:flutter/material.dart';
import 'package:random/Chung/header.dart';
import 'package:random/setting/setting.dart';

class ngonngu extends StatefulWidget {
  const ngonngu({super.key});

  @override
  State<ngonngu> createState() => _ngonngu();
}

class _ngonngu extends State<ngonngu> {
  String _value = "Việt Nam";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/TG.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [
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
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => setting(),
                        ));
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
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Chọn Ngôn Ngữ: ',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          color: Colors.yellow)),
                ],
              ),
              Column(
                children: [
                  DropdownButton<String>(
                      dropdownColor: Colors.black,
                      value: _value,
                      items: <String>[
                        'Việt Nam',
                        'English',
                      ].map((String _value) {
                        return DropdownMenuItem(
                            value: _value,
                            child: Text(
                              _value,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 15,
                                  color: Colors.yellow),
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        _value = value!;
                      })
                ],
              )
            ],
          ),
        )
      ]),
    )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
