import 'dart:convert';
import 'dart:io';

Future<String?> getData() async {
  sleep(Duration(seconds: 6));
  print('i dont know how');
  return 'text';
}

void main() async{
  String? text = await getData().timeout(Duration(seconds: 5), onTimeout: () {
    print('nice');
    return null;
  });
  print(text);
}