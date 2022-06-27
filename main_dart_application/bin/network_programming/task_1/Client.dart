import 'dart:convert';
import 'dart:io';

import '../Student.dart';

void main() async{
  await Socket.connect('127.0.0.1', 8081).then((socket) {
    socket.cast<List<int>>().transform(utf8.decoder).listen((event) {
      print(event);
      List<Student> students = [];
      var tmp = jsonDecode(event);
      for (Map<String, dynamic> student in tmp)
        students.add(Student.fromJson(student));

      print(students);
    });
  });
}