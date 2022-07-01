import 'dart:convert';
import 'dart:io';

void main() async{
  Map<String, dynamic> message = {
    'number': null,
    'from': null,
    'to': null
  };

  // Connect to port 8081 of 127.0.0.1
  await Socket.connect('127.0.0.1', 8080).then((socket) {
    stdout.write('\nЧисло: ');
    message['number'] = stdin.readLineSync(encoding: utf8)!;
    stdout.write('Система счисления числа: ');
    message['from'] = int.parse(stdin.readLineSync(encoding: utf8)!);
    stdout.write('В какую систему переводим?: ');
    message['to'] = int.parse(stdin.readLineSync(encoding: utf8)!);

    var encoder = JsonEncoder.withIndent(' ');
    socket.write(encoder.convert(message));

    socket.cast<List<int>>().transform(utf8.decoder).listen((event) {
      print('Результат: $event');

      stdout.write('\nЧисло: ');
      message['number'] = stdin.readLineSync(encoding: utf8)!;
      stdout.write('Система счисления числа: ');
      message['from'] = int.parse(stdin.readLineSync(encoding: utf8)!);
      stdout.write('В какую систему переводим?: ');
      message['to'] = int.parse(stdin.readLineSync(encoding: utf8)!);

      socket.write(encoder.convert(message));
    });
  });
}
