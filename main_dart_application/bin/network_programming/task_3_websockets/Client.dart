import 'dart:io' show WebSocket, sleep, stdin, stdout;
import 'dart:convert' show json, jsonDecode, utf8;
import 'dart:async' show StreamController, Timer;


var name = "Пользователь ${(DateTime.now().year * DateTime.now().day * DateTime.now().second * DateTime.now().microsecond / 10000).round()}";

write(WebSocket ws) {
  if (ws.readyState == WebSocket.open) {
    DateTime date = DateTime.now();
    String strDate = "${date.year}-${date.month}-${date.day} ${date.hour}}";
    ws.add(json
        .encode({
      "text": "${stdin.readLineSync(encoding: utf8)}",
      "name": "${name}",
      "date": "${strDate}"
    }));
  }
}

main() {
  StreamController<List<int>> consumer = StreamController<List<int>>();
  WebSocket.connect('ws://localhost:8000').then((WebSocket ws) async {
    // our websocket server runs on ws://localhost:8000
    if (ws.readyState == WebSocket.open) {

      consumer.stream.cast<List<int>>().transform(utf8.decoder).listen((event) {
        if (ws.readyState == WebSocket.open) {
          DateTime date = DateTime.now();
          String strDate = "${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}}";
          ws.add(json
              .encode({
            "code": 200,
            "text": "${event}",
            "name": "${name}",
            "date": "${strDate}"
          }));
        }
        print("");
      });

      ws.add(json.encode({
        "code": 0
      }));

      ws.listen((data) {
        var response = jsonDecode(data);
        print("${response['name']} (${response['date']})> ${response['text']}"); // listen for incoming data and show when it arrives

      },
        onDone: () => print('Сервер прервал соединение'),
        onError: (err) => print('! Ошибка ! ${err.toString()}'),
        cancelOnError: true,
      );
      await stdin.pipe(consumer);

    } else
      print('[!]Connection Denied');
    // in case, if serer is not running now
  }, onError: (err) => print('! Ошибка ! ${err.toString()}'));
}
