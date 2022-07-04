// @Skip('Часть функционала не реализована')

import 'package:test/test.dart';
import 'my_functions.dart';

void main() {
  group('Арифметические функции', () {
    late int a;
    late int b;

    setUp(() {
      a = 3;
      b = 7;
    });

    test('Проверка сложения', () {
      expect(add(a, b), equals(a + b));
    }, onPlatform: {'windows': Skip('windows')},
        tags: ['windows']);

    test('Проверка умножения', () {
      expect(mult(a, b), equals(a * b));
    }, onPlatform:  {'linux': Skip('linux')});

    test('Удаление окружающих пробелов', () {
      var line = ' oO';
      expect(deleteSurroundingSpaces(line), equals('oO'));
    });
  });

  group('Функции для работы со строками', () {
    test('Удаление окружающих пробелов', () {
      var line = ' oO';
      expect(deleteSurroundingSpaces(line), equals('oO'));
    });

    test('Перевод в нижний регистр', () {
      var line = 'ПроВерка';
      expect(stringToLowerCase(line), equals('проверка'));
    }, skip: "Еще в разработке");
  });
}