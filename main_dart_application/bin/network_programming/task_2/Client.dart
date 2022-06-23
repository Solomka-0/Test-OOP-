import 'dart:convert';
import 'dart:io';

void main() async{
  // Connect to port 8081 of 127.0.0.1
  await Socket.connect('127.0.0.1', 8081).then((socket) {
    socket.cast<List<int>>().transform(utf8.decoder).listen((event) {
      socket.write("Client: ${stdin.readLineSync(encoding: utf8)}");
      print(event);
    });
  });
}
