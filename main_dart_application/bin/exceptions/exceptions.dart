import 'dart:math';

import 'index.dart';
import 'task_1/WordFinder.dart';
import 'task_2/Overload.dart';

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

void main() {
  task_2();
}