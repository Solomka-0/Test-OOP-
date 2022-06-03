import 'dart:math';

import '../../index.dart';

abstract class Figure {
  bool isDefined = false;
  static String name = 'Абстрактная фигура';
  late double area;
  late double perimeter;

  String toString() {
    return '\nПлощадь: $area\nПериметр: $perimeter';
  }
}

class AngularInterface {
  void getPerimeter() {}
  void getArea() {}
}

class Rectangle extends Figure implements AngularInterface {
  static String name = 'Прямоугольник';
  late double a, b;

  @override
  void getArea() {
    area = a * b;
  }

  @override
  void getPerimeter() {
    perimeter = 2 * a + 2 * b;
  }

  void setPolygons(double a, double b) {
    this.a = a;
    this.b = b;

    getPerimeter();
    getArea();
  }

  @override
  String toString() {
    return '\na: $a\nb: $b${super.toString()}';
  }

}

class Triangle extends Figure implements AngularInterface {
  static String name = 'Треугольник';
  late double a, b, c;
  @override
  void getArea() {
    getPerimeter();
    double pp = perimeter / 2;
    area = sqrt(pp * (pp - a) * (pp - b) * (pp - c));
  }

  @override
  void getPerimeter() {
    perimeter = a + b + c;
  }

  void setPolygons(double a, double b, double c) {
    this.a = a;
    this.b = b;
    this.c = c;

    getPerimeter();
    getArea();

    if (area == 0 || area.isNaN) print('Такого треугольника не существует!');
  }

  @override
  String toString() {
    if (!area.isNaN && area == 0)
      return '\na: $a\nb: $b\nc: $c${super.toString()}';
    else
      return '\nНеправильно указаны стороны!';
  }
}

class Circle extends Figure {
  static String name = 'Круг';
  double radius;

  Circle(this.radius) {
    getPerimeter();
    getArea();
  }

  void getArea() {
    area = pi * pow(radius, 2);
  }

  void getPerimeter() {
    perimeter = 2 * pi * radius;
  }

  @override
  String toString() {
    return '\nРадиус круга: $radius ${super.toString()}';
  }
}

class Figures {
  List<Figure> figures = [];
  Figures(this.figures);

  String toString() {
    return figures.join('\n');
  }
}
