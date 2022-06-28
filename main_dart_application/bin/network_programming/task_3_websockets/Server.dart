import 'dart:io' show HttpServer, HttpRequest, WebSocket, WebSocketTransformer;
import 'dart:convert' show json, jsonDecode;
import 'dart:async' show Timer;

main() {
  List<WebSocket> connections = [];
  List<Map<String, dynamic>> messageHistory = [];
  HttpServer.bind('localhost', 8000).then((HttpServer server) {
    print('Канал прослушивания: ws://localhost:8000/');
    server.listen((HttpRequest request) {
      WebSocketTransformer.upgrade(request).then((WebSocket ws) {
        connections.add(ws);
        ws.listen((message) {
          var request = jsonDecode(message);

          int code = request['code'];
          if (code == 0) {
            for (var message_tmp in messageHistory) {
              ws.add(json.encode(message_tmp));
            }
          } else if (code == 200){
              print('Новое сообщение: ${request['text']}');
              messageHistory.add(request);

              for (WebSocket user in connections) {
                if (user.readyState == WebSocket.open && user != ws) {
                  user.add(json.encode(request));
                }
              }
            }
          },
          onDone: () => print('Клиент не доступен'),
          onError: (err) => print('! Ошибка !\n${err.toString()}'),
          cancelOnError: true,
        );
      }, onError: (err) => print('! Ошибка !\n${err.toString()}'));
    }, onError: (err) => print('! Ошибка !\n${err.toString()}'));
  }, onError: (err) => print('! Ошибка !\n${err.toString()}'));
}