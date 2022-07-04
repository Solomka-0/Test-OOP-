import 'package:test/test.dart';

import '../bin/test1.dart';

void main() {
  group('Нахождение минимума и максимума из трех', () {
    test('Все числа разные', () {
      expect(ex6(1, 2, 3), [1, 3]);
      expect(ex6(1, 3, 2), [1, 3]);
      expect(ex6(2, 1, 3), [1, 3]);
      expect(ex6(2, 3, 1), [1, 3]);
      expect(ex6(3, 1, 2), [1, 3]);
      expect(ex6(3, 2, 1), [1, 3]);
    });
    
    test('2 числа одинаковые', () {
      expect(ex6(1, 1, 3), [1, 3]);
      expect(ex6(3, 1, 1), [1, 3]);
      expect(ex6(1, 3, 1), [1, 3]);
      expect(ex6(3, 3, 1), [1, 3]);
      expect(ex6(1, 3, 3), [1, 3]);
      expect(ex6(3, 1, 3), [1, 3]);
    });

    test('Отрицательные числа', () {
      expect(ex6(-1, 0, 1), [-1, 1]);
      expect(ex6(1, 0, -1), [-1, 1]);
      expect(ex6(-1, 1, 0), [-1, 1]);
      expect(ex6(1, -1, 0), [-1, 1]);
      expect(ex6(0, 1, -1), [-1, 1]);
      expect(ex6(0, -1, 1), [-1, 1]);
    });

    test('Три одинаковых числа', () {
      expect(ex6(3, 3, 3), [3, 3]);
      expect(ex6(0, 0, 0), [0, 0]);
      expect(ex6(-1, -1, -1), [-1, -1]);
    });

    test('Нет чисел на входе', () {
      expect(ex6(), [null, null]);
    });

    test('На входе строка', () {
      expect(ex6("3", "4", "5"), [3, 5]);
    });
  });
}