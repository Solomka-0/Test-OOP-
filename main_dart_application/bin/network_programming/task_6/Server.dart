import 'dart:convert';
import 'dart:io';
import '../../test2/task_11/Translator.dart';

void main() async{
  Translator translator;
  //Bind port 8081 of the local localhost (ie binding: 127.0.0.1)
  ServerSocket.bind(InternetAddress.loopbackIPv4, 8080)
      .then((serverSocket) {
    serverSocket.listen((socket) {
      socket.cast<List<int>>().transform(utf8.decoder).listen((messageTmp) {
        var message = jsonDecode(messageTmp);
        translator = Translator(message['number'], message['from']);
        socket.write(translator.translateTo(message['to']));
      });
    });
  });
}