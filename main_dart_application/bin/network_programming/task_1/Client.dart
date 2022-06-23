import 'dart:convert';
import 'dart:io';

import '../Student.dart';

void main() async{
  // Connect to port 8081 of 127.0.0.1
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