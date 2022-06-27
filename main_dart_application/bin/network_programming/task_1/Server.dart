import 'dart:convert';
import 'dart:io';

import '../Student.dart';


void main() async{
  //Bind port 8081 of the local localhost (ie binding: 127.0.0.1)
  ServerSocket.bind(InternetAddress.loopbackIPv4, 8081)
      .then((serverSocket) {
    serverSocket.listen((socket) async {
      List<Student> students = [
        Student('Игорь', 18, 1),
        Student('Владимир', 19, 2),
        Student('Алексей', 18, 2),
      ];

      var encoder = JsonEncoder.withIndent(' ');
      socket.write(encoder.convert(students));

      socket.cast<List<int>>().transform(utf8.decoder).listen((event) {
        print(event);
      });
    });
  });
}