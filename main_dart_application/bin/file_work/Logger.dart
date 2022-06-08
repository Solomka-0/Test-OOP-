import 'dart:convert';
import 'dart:io';

import 'index.dart';

class BaseLogger {
  static String ending = '.log';
  String name;
  BaseLogger(this.name);

  void logging(Car object) {
    File myFile = File('$name$ending');

    myFile.writeAsStringSync('${DateTime.now()}\n${object.lastState}\n${object.curState}\n\n', mode: FileMode.append);
  }
}

class TXTLogger implements BaseLogger {
  static String ending = '.txt';
  @override
  String name;

  TXTLogger(this.name);

  @override
  void logging(Car object) {
    File myFile = File('$name$ending');

    myFile.writeAsStringSync('${DateTime.now()}\n${object.lastState}\n${object.curState}\n\n', mode: FileMode.append);
  }
}

class JSONLogger implements BaseLogger {
  static String ending = '.json';
  @override
  String name;

  JSONLogger(this.name);

  @override
  void logging(Car object) {
    File myFile = File('$name$ending');

    var encoder = JsonEncoder.withIndent(' ');
    myFile.writeAsStringSync(encoder.convert(object));
  }
}