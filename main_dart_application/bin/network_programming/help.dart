import 'dart:async';
import 'dart:convert';
import 'dart:io';


void main() async {
  StreamController<List<int>> consumer = StreamController<List<int>>();

  StreamController<StreamController<dynamic>> controller = StreamController();

  consumer.stream.cast<List<int>>().transform(utf8.decoder).listen((event) {
    controller.add(consumer);
  });

  controller.stream.listen((event) {
    print(event);
  });

  var a = await stdin.pipe(consumer);

  print(a);
}