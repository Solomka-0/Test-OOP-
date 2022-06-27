import 'dart:convert';
import 'dart:io';

String toJson(Map<String, dynamic> message) => JsonEncoder.withIndent(' ').convert(message);

void main() async{
  int counter = 1;
  List<Map<String, dynamic>> messages = [];
  List<Map<String, dynamic>> active_users = [];
  //Bind port 8081 of the local localhost (ie binding: 127.0.0.1)
  ServerSocket.bind(InternetAddress.loopbackIPv4, 8081)
      .then((serverSocket) {
    serverSocket.listen((socket) async {
      socket.cast<List<int>>().transform(utf8.decoder).listen((message_tmp) {
        // Перевод ответа в стандартный формат (Map / JSON)
        var message = jsonDecode(message_tmp);

        // Проверка кода сообщения
        if (message['code'] == 200) {
          active_users.add(message['user']);
          socket.write(toJson({
            'code': 200,
            'history': messages
          }));
        } else {
          message['id'] = counter;
          counter++;
          messages.add(message);

          for (Map<String, dynamic> user in active_users) {
            if (user['address'] != message['author']['address'] ||
                user['port'] != message['author']['port']) {
              Socket.connect(user['address'], user['port'])
                  .then((clientSocket) {
                clientSocket.write(toJson(
                    {'code': 200, 'history': messages[messages.length]}));
              });
            }
          }

          socket.write(toJson({'code': 200}));
          print(messages);
        }
      });

    });
  });
}