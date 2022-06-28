import 'dart:convert';
import 'dart:io';


void main() async{
  //Bind port 8081 of the local localhost (ie binding: 127.0.0.1)
  ServerSocket.bind(InternetAddress.loopbackIPv4, 8080)
      .then((serverSocket) {
    serverSocket.listen((socket) async {

      socket.cast<List<int>>().transform(utf8.decoder).listen((event) {
        print('address: ');
        String? my_address = stdin.readLineSync(encoding: utf8);
        print('port: ');
        int? my_port = int.parse(stdin.readLineSync(encoding: utf8)!);
        print(event);
      });
    });
  });
}