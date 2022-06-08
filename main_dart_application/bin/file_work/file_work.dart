import 'dart:convert';
import 'dart:io';
import '../exceptions/exceptions.dart';
import 'Logger.dart';
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

void task_4() {
  Car car = Car(States.stop);

  car.setLogger(TXTLogger('car'));
  car.changeState(States.acceleration);
  car.setLogger(JSONLogger('car'));
  car.changeState(States.go_forward);

  car.changeState(States.to_right);
  car.changeState(States.stop);
}

void task_5() {
  var studentsGroup = Group.emptyGroup(groupName: '1-МД-66',
      course: 1);
  var firstStudent = Student.withOutDescription(name: 'Alex',
      age: 19, course: 1, single: false);
  var descriptions = ['Мечтатель', 'Ленив', 'Студент'];
  firstStudent.addAllDescriptions(descriptions);
  firstStudent.addDescription('Постоянно жалуется на жизнь');
  var secondStudent = Student('Maxim',22, 1,true, descriptions);
  secondStudent.addDescription('Девиз: всё нормально!');
  studentsGroup.addAllStudents(<Student>[firstStudent,
    secondStudent]);

  // сериализуем группу в json
  var encoder = JsonEncoder.withIndent(' ');
  var test = encoder.convert(studentsGroup);

  var myFile = File('data/group.json');
  myFile.createSync(recursive: true);
  myFile.writeAsStringSync(test); // записываем в файл

  // десериализуем данные и выводим в терминал
  var newStudentsGroup = Group.fromJson(jsonDecode(test));
  print(newStudentsGroup);
}

void main() async{
  task_5();
}