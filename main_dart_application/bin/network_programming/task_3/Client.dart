import 'dart:convert';
import 'dart:io';

String toJson(Map<String, dynamic> message) => JsonEncoder.withIndent(' ').convert(message);

void main() async{
  int last_message = 0;
  await Socket.connect('127.0.0.1', 8080).then((socket) {
    // Шаблон сообщения о пользователе
    Map<String, dynamic> user_pattern = {
      'code': 200,
      'user': {
        'username': 'Пользователь ${socket.port}',
        'address': socket.address.address,
        'port': socket.port},
    };

    // Шаблон текстового сообщения
    Map<String, dynamic> message_pattern = {
      'code': 0,
      'author': user_pattern['user'],
      'message_text':  'null',
      'id': null,
      'recipients': []
    };

    // Отправка сведений о пользователе (дает понять, что пользователь подключился)
    socket.write(toJson(user_pattern));

    socket.cast<List<int>>().transform(utf8.decoder).listen((event) {
      // Перевод ответа в стандартный формат (Map / JSON)
      var response = jsonDecode(event);

      // Вывод истории беседы
      if (response['history'] != [] && response['history'] != null && response['history'].length > 0)
        for (Map<String, dynamic> message in response['history']) {
          print('${message['author']['username']}:: ${message['message_text']}\n');
        }

      // Предоставление ввода
      var message_text = "${stdin.readLineSync(encoding: utf8)}";
      message_pattern['message_text'] = message_text;
      socket.write(toJson(message_pattern));
    });
  });
}
