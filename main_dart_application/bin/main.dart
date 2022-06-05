import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:complex/complex.dart';
import 'package:test/test.dart';

import 'index.dart';
import 'test1.dart';
import 'test2/task_11/Translator.dart';
import 'test2/task_13/Solver.dart';
import 'test2/task_5/Converter.dart';
import 'test2/task_5/Money.dart';


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

void ex4() {
  late Weight weightTmp;
  print('\n- У тебя есть гриф, задай ему характеристики:');
  stdout.write('\nМаксимальный вес (на одну сторону) > ');
  double maxWeight = double.parse(stdin.readLineSync(encoding: utf8)!);
  stdout.write('Максимальная ширина одной стороны > ');
  double maxWidth = double.parse(stdin.readLineSync(encoding: utf8)!);
  Bar bar = Bar(maxWeight, maxWidth);
  sleep(Duration(milliseconds: 1000));
  print('\n- Хм, отлично!');
  sleep(Duration(milliseconds: 800));
  print('- А теперь давай навесим на него побольше блинов!');
  sleep(Duration(milliseconds: 800));

  print('- Начнем с левой стороны грифа. Сколько блинов туда поместим?');
  int size = int.parse(stdin.readLineSync(encoding: utf8)!);
  for (int i = 0; i < size; i++) {
    weightTmp = Weight.console();
    bar.addWeight(weightTmp, Direction.left);
  }
  print('\n- Ладно, теперь правая часть. Сколько блинов туда поместим?');
  size = int.parse(stdin.readLineSync(encoding: utf8)!);
  for (int i = 0; i < size; i++) {
    weightTmp = Weight.console();
    bar.addWeight(weightTmp, Direction.right);
  }

  print('$bar');
}

void ex5() {
  Money money = Money(Currency.ruble, 1200);
  print(money);

  Converter converter = Converter();

  money = converter.convertTo(money, Currency.dollar);
  money = converter.convertTo(money, Currency.euro);
}

void ex7() {
  List<Bicycle> bicycles = [
    Bicycle(),
    Bicycle(),
    Bicycle(),
    Bicycle(),
    Bicycle()
  ];

  Garage<Car1, Bicycle>(bicycles);
}

void ex8() {
  Atom a = Atom('a');
  Atom b = Atom('b');
  Atom c = Atom('c');
  Atom d = Atom('d');

  print(d / (a + b * c));
}

void ex9() {
  Car2 car = Car2([Operation.go, Operation.turn, Operation.stop]);

  car.perform();
}

void ex10() {
  Rectangle rect = Rectangle()
    ..setPolygons(10, 20);

  Triangle triangle = Triangle()
    ..setPolygons(10, 10, 10);

  Circle circle = Circle(10);

  List<Figure> listFigures = [
    rect,
    triangle,
    circle
  ];

  Figures figures = Figures(listFigures);

  print(figures);
}
void ex11() {
  Translator translator = Translator('59', 10);
  translator.translateTo(2);
  translator.translateTo(4);
  translator.translateTo(6);
  translator.translateTo(8);
  translator.translateTo(16);
}

void ex13() {
  Solver solver = Solver(1, -2, 17);

  solver.solve();
}

void ex14() {
  print(GCDFinder.findGCD(64, 48));
  print(GCDFinder.findGCD(15, 5));
  print(GCDFinder.findGCD(3, 9));
  print(GCDFinder.findGCD(9, 9));
}

void ex15() {
  Table table = Table();
  Fork fork = Fork('моя');
  Spoon spoon = Spoon('серебрянная');
  Knife knife = Knife('обычный');

  table.setList([fork, spoon, knife]);
  print(table);
}

void main() {
  ex15();
}
