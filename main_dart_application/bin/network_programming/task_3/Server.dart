import 'dart:convert';
import 'dart:io';
import 'dart:math';

String toJson(Map<String, dynamic> message) => JsonEncoder.withIndent(' ').convert(message);

void main() async{
  int counter = 1;
  List<Map<String, dynamic>> messages = [];
  List<Map<String, dynamic>> active_users = [];
  List<Map<String, dynamic>> active_messages = [];
  //Bind port 8081 of the local localhost (ie binding: 127.0.0.1)
  ServerSocket.bind(InternetAddress.loopbackIPv4, 8080)
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
          List<Map<String, dynamic>> history = [];

          message['id'] = counter;
          counter++;

          for (Map<String, dynamic> user in active_users) {
            if (user['address'] != message['author']['address'] ||
                user['port'] != message['author']['port']) {
              message['recipients'].add(user);
            }
          }

          for (Map<String, dynamic> incoming_message in active_messages) {
            List<dynamic> reciepnent = incoming_message['recipients'].where((elem) => elem['port'] == message['author']['port']).toList();

            if (reciepnent.length > 0) {
              history.add(incoming_message);
              incoming_message['recipients'].remove(reciepnent[0]);
            }
          }

          if (message['recipients'].length > 0)
            active_messages.add(message);
          messages.add(message);

          history.add(message);
          socket.write(toJson({'code': 200, 'history': history}));
          print(messages);
        }
      });
    });
  });
}