import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:giaodiengame/loaddatajson/question_obj.dart';
import 'package:path/path.dart';

class questionprovider {
  static Future<List<dynamic>> readJsondata() async {
    var jsontext = await rootBundle.loadString('data/dataquestion.json');
    var data = json.decode(jsontext);
    return data['question'];
  }

  static Future<List<questionobject>> getallquesrtion() async {
    List<questionobject> lsresult = [];
    List<dynamic> data = await readJsondata();
    lsresult = data.map((e) => questionobject.fromJson(e)).toList();
    return lsresult;
  }

  static Future<List<questionobject>> searchquestion(int id) async {
    List<questionobject> lsresult = [];
    List<dynamic> data = await readJsondata();
    data.forEach((element) {
      questionobject question = questionobject.fromJson(element);
      if (question.id == id) {
        lsresult.add(question);
      }
    });
    return lsresult;
  }
}
