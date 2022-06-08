import 'dart:convert';
import 'dart:io';
import 'index.dart';

void task_1() {
  var myFile = File('wardrobe.json');
  Thing thing1 = Thing('Рубашка', 150, 1);
  Thing thing2 = Thing('Кеды', 300, 1);
  Thing thing3 = Thing('Пустая коробка', 50, 2);

  var wardrobe = ([thing1, thing2, thing3]);

  var encoder = JsonEncoder.withIndent(' ');
  myFile.writeAsStringSync(encoder.convert(wardrobe));

  print(myFile.readAsStringSync());
}

void main() async{
  task_1();
}