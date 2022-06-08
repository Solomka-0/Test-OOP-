import 'dart:convert';
import 'dart:io';
import 'index.dart';

void task_1_2() {
  var myFile = File('wardrobe.json');
  Thing thing1 = Thing('Рубашка', 150, 1);
  Thing thing2 = Thing('Кеды', 300, 1);
  Thing thing3 = Thing('Пустая коробка', 50, 2);

  var wardrobe = ([thing1, thing2, thing3]);

  var encoder = JsonEncoder.withIndent(' ');
  myFile.writeAsStringSync(encoder.convert(wardrobe));

  print(myFile.readAsStringSync());
}

void task_3() {
  Car car = Car(States.stop);

  car.changeState(States.acceleration);
  car.changeState(States.go_forward);
  car.changeState(States.to_right);
  car.changeState(States.stop);

  print(File('car.log').readAsStringSync());
}

void main() async{
  task_3();
}