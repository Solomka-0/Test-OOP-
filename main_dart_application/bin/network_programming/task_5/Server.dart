
import 'dart:io';

import '../StringCalculator.dart';

void main() {
  HttpServer.bind(InternetAddress.loopbackIPv4, 8000).then((HttpServer server) {
    print('Канал прослушивания: http://127.0.0.1:8000');
    server.listen((HttpRequest request) {
      if (request.uri.path.startsWith('')) {
        request.uri.queryParameters.forEach((key, value) {
          if (key == 'expression') {
            try {
              StringCalculator.setStr(value);
              request.response.write(StringCalculator.getResult());
              request.response.close();
            } catch (e) {
              print(e);
            }
          }
        });
      }
    });
  });
}
