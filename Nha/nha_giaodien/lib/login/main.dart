import 'package:flutter/material.dart';
import 'package:nha_giaodien/login/login.dart';
import 'package:nha_giaodien/login/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}
