import 'dart:convert';
import 'dart:io';

void main() async{
  // Connect to port 8081 of 127.0.0.1
  await Socket.connect('127.0.0.1', 8080).then((socket) {
    print("Client: ${socket.address.address} ${socket.port}");
    socket.write('1');

    socket.cast<List<int>>().transform(utf8.decoder).listen((event) {
      print(event);
    });
  });
}
