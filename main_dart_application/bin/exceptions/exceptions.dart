import 'dart:math';

import 'index.dart';
import 'task_1/WordFinder.dart';
import 'task_2/Overload.dart';
import 'task_5/MySuperException.dart';

void task_1() {
  WordFinder wordFinder = WordFinder('My string');

  bool? a, b;

  try {
    a = wordFinder.findWord('str');

    b = wordFinder.findWord('str ');
  } catch (e){
    print(a);
    print(b);

    print('\nПолучено исключение: $e');
  }
}

void task_2() {
  Overload a = Overload(4);
  Overload b = Overload(2);
  Overload c = Overload(0);


  try {
    print(a * b);
    print(a * c);
  } catch (e) {
    print(e);
  }

  try {
    print(a / b);
    print(a / c);
  } catch (e) {
    print(e);
  }
}

void task_3() {
  Overload a = Overload(4);
  Overload b = Overload(0);


  try {
    print(a * b);
  } on MultiplicationByZeroException {
    print(a * Overload(2));
  }
}

void task_4() {
  List<int> list = [1, 2, 3, 4];

  try {
    for (int i = 0; i <= 5; i++) {
      print(list[i]);
    }
  } on RangeError {
    print('Попытка обратиться к несуществующему элементу!');
  }
}



void task_5() {
  List<int> list_1 = [0, 1, 2];
  List<int> list_2 = [3, 4, 5];

  try {
    MySuperException.findException(list_1);
    print('list_1');
    MySuperException.findException(list_2);
    print('list_2');
  } on MySuperException {
    print(MySuperException());
  }

}

void main() {
  task_5();
}