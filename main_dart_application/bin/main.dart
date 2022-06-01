import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:test/test.dart';

import 'test2_ex1.dart';

void ex1() {
  Zhiguli zhiguli = Zhiguli("А123БВ-36", CarType.B, "Белый");
  Oka oka = Oka("В321БА-136", CarType.B, "Черный");
  zhiguli.info();
  oka.info();
}

void ex2() {
  Cup cup = Cup();
  cup.show();
  Person person = Person();
  print('* Человек думает отпить 40 у.е. из кружки *');
  person.drink(40, cup);
  cup.show();
}

void ex3() {
  Wardrobe wardrobe = Wardrobe();

  print('\nУнай размер вещи на вешалке. Как там она наз-ся?');
  String name = wardrobe.getString()!;
  wardrobe.shelfLocation.getThing(name);

  sleep(Duration(milliseconds: 2000));
  print('\nХорошо. Давай положим что-нибудь на полку');
  stdout.write('Как называется? >');
  name = wardrobe.getString()!;
  stdout.write('Размер > ');
  int size = int.parse(wardrobe.getString()!);
}

void main() {
  ex3();
}
