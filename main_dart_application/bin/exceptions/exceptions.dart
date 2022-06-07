import 'dart:math';

import 'index.dart';
import 'task_1/WordFinder.dart';

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

void main() {
  task_1();
}