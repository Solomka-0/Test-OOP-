import 'dart:html';

enum Object {
  car,
  bicycle,
  bike,
  babyStroller
}

class ObjectTransport {
  static late int size;
}

class Car implements ObjectTransport {
  @override
  static int size = 8;
}

class Bicycle implements ObjectTransport {
  @override
  static int size = 2;
}

class Bike implements ObjectTransport {
  @override
  static int size = 4;
}

class BabyStroller implements ObjectTransport {
  @override
  static int size = 1;
}

class Garage<T extends ObjectTransport> {
  late int size;
  late List<T> objects;

  Garage(List<T> objects) {
    objects.runtimeType;
    switch(T) {
      case Car:
        size = Car.size;
        break;
      case Bicycle:
        size = Bicycle.size;
        break;
      case Bike:
        size = Bike.size;
        break;
      case BabyStroller:
        size = BabyStroller.size;
        break;
    }

    for (T element in objects) {
      if (objects.length < size + element.size)
    }
  }

  int getTSize(Type type) {
    Map<ObjectTransport, int> sizes = {
      Car: Car.size,
    };

    switch(type) {
      case Car:
        size = Car.size;
        break;
      case Bicycle:
        size = Bicycle.size;
        break;
      case Bike:
        size = Bike.size;
        break;
      case BabyStroller:
        size = BabyStroller.size;
        break;
    }
    return 0;
  }
}