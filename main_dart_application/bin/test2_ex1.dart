import 'dart:convert';
import 'dart:io';

// Задание 1

enum CarType{
  A, B, C, D, BE, CE, DE,
  A1, B1, C1, D1, C1E, D1E
}

class Car {
  late final String number;
  late final CarType type;
  late String color;

  Car(this.number, this.type, this.color);

  void info() {
    print('\nНомер авто: $number'
        '\nТип: $type'
        '\nЦвет: $color');
  }
}

class Zhiguli extends Car {
  Zhiguli(super.number, super.type, super.color);

  @override
  void info() {
    stdout.write('\nЭто легендарное Жигули!');
    super.info();

  }

}


class Oka extends Car {
  Oka(super.number, super.type, super.color);

  @override
  void info() {
    stdout.write('\nОка!');
    super.info();
  }
}

// Задание 2

class Cup {
  int volume = 100;

  void show() => print('[Емкость кружки $volume у.е.]');
}

class Person {
  void drink(int value, Cup cup) {
    int time;
    print('- Хм, а выпьем? * Человек начинает пить.. *');
    if (cup.volume >= value) {
      time = value * 100;
      cup.volume -= value;
    }
    else {
      time = cup.volume * 100;
      cup.volume = 0;
    }

    sleep(Duration(milliseconds: 2000));
    print('- Не плохо..');
    sleep(Duration(milliseconds: 2000));
    print('- Ум)..');
    sleep(Duration(milliseconds: time));
    print('* Человек перестал пить *');
  }
}

// Задание 3

const String succes = 'y';

enum LocationType {
  hanger,
  shelf,
  box
}

class Storage {
  late final int curSize;
  late final int maxSize;

  Map<String, int> things = {};

  Storage(maxSize, Map<String, int> things) {
    if (things.length > 0 && getVSize(things) <= maxSize) {
      this.things = things;
      curSize = getVSize(things);
    } else if (things.length == 0) {
      curSize = 0;
    } else {
      print('- Предложенные вещи не помещаются');
    }
    this.maxSize = maxSize;
  }

  Storage.valueLength(maxSize, Map<String, int> things) {
    if (things.length > 0 && things.length <= maxSize) {
      this.things = things;
      this.maxSize = maxSize;
      curSize = getVSize(things);
    } else if (things.length == 0) {
      curSize = 0;
    } else {
      print('- Предложенные вещи не помещаются');
      this.maxSize = maxSize;
    }
  }

  int getVSize(Map<String, int> things) => things.values.reduce((value, element) => value + element);

  void addThing(String name, int size) {
    if (curSize + size <= maxSize) {
      print('- Место есть, отлично!');
      // Не берется во внимание, что есть несколько вещей с одним названием
      things[name] = size;
    } else {
      print('- Эта штуковина не влезает!');
    }
  }

  int? getThing(String name) {
    print('Где же оно было..');
    sleep(Duration(milliseconds: 2000));
    int? value = things[name];
    things.remove(name);
    if (value != null)
      print('- Ага, нашел!');
    else print('- Ладно, наверное, в другом месте..');
    return value;
  }
}

class HangerLocation extends Storage {
  HangerLocation(maxSize, things) : super.valueLength(maxSize, things);

  @override
  void addThing(name, size) {
    print('\nИщем место..');
    sleep(Duration(milliseconds: 2000));
    if (things.length <= maxSize) {
      print('- А вот и подходящая вешалка..!');
      // Не берется во внимание, что есть несколько вещей с одним названием
      things[name] = size;
    } else {
      print('- Для этого нет места, вешалок не хватает!');
    }
  }
}

class ShelfLocation extends Storage {
  ShelfLocation(super.maxSize, super.things);

  @override
  void addThing(name, size) {
    print('- Хм, посмотрим, найдется ли место на полке..');
    sleep(Duration(milliseconds: 2000));
    super.addThing(name, size);
  }

  @override
  int? getThing(name) {
    if (curSize * 3 <= maxSize)
      print('- Полка почти пуста..');
    else print('- А места на полке почти не осталось, по-любому это где-то тут');

    sleep(Duration(milliseconds: 2000));
    super.getThing(name);
  }
}


class BoxLocation extends Storage {
  BoxLocation(super.maxSize, super.things);

  @override
  void addThing(name, size) {
    print('- Хм, посмотрим, найдется ли место в ящике..');
    sleep(Duration(milliseconds: 2000));
    super.addThing(name, size);
  }

  @override
  int? getThing(name) {
    if (curSize * 3 <= maxSize)
      print('- Ящик почти пуст..');
    else print('- А места в ящике почти не осталось, по-любому это где-то тут');

    sleep(Duration(milliseconds: 2000));
    super.getThing(name);
  }
}


class Wardrobe {
  late HangerLocation hangerLocation;
  late ShelfLocation shelfLocation;
  late BoxLocation boxLocation;

  Wardrobe() {
    Map <String, int> tmpThings = {};
    String nameTmp;
    int size;
    print('Что же было у него в шкафу? На сколько он большой?');
    stdout.write('Начнем с вешалки. Какой у нее максимальный размер > ');
    int tmpMaxSize = int.parse(getString()!);
    stdout.write('Хорошо, есть ли там вещи? (y/n) > ');
    if (getString()! == succes) {
      hangerLocation = HangerLocation(tmpMaxSize, getThings());
    } else {
      hangerLocation = HangerLocation(tmpMaxSize, Map<String, int>());
      print('Ладно, продолжим');
    }

    stdout.write('Полка - какой у нее максимальный размер > ');
    tmpMaxSize = int.parse(getString()!);
    stdout.write('Хорошо, есть ли там вещи? (y/n) > ');
    if (getString()! == succes) {
      shelfLocation = ShelfLocation(tmpMaxSize, getThings());
    } else {
      shelfLocation = ShelfLocation(tmpMaxSize, Map<String, int>());
      print('Ладно, продолжим..');
    }

    stdout.write('Ящик - какой у него максимальный размер > ');
    tmpMaxSize = int.parse(getString()!);
    stdout.write('Хорошо, есть ли там вещи? (y/n) > ');
    if (getString()! == succes) {
      shelfLocation = ShelfLocation(tmpMaxSize, getThings());
    } else {
      shelfLocation = ShelfLocation(tmpMaxSize, Map<String, int>());
      print('Ладно, продолжим..');
    }
  }

  String? getString() => stdin.readLineSync(encoding: utf8);

  Map<String, int> getThings() {
    String nameTmp;
    int size;
    Map<String, int> tmpThings = {};


    stdout.write('Сколько вещей?');
    int tmpSize = int.parse(getString()!);
    for (int i = 0; i < tmpSize; i++) {
      stdout.write('[$i] Как наз-ся? > ');
      nameTmp = getString()!;
      stdout.write('Размер > ');
      size = int.parse(getString()!);
      tmpThings[nameTmp] = size;
    }
    return tmpThings;
  }
}


