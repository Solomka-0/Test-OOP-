import 'dart:convert';
import 'dart:io';

int getNumber() => int.parse(stdin.readLineSync(encoding: utf8)!);

void ex1() {
  Map<String, int> symbols = {};
  print('\nВведите строку:');
  var line = stdin.readLineSync(encoding: utf8);
  var symbol;

  for (var i = 0; i < line!.length; i++) {
    symbol = line[i];
    if (symbols.containsKey(line[i]))
      symbols[symbol] = symbols[symbol]! + 1;
    else
      symbols[symbol] = 1;
  }

  for (var symbol in symbols.keys)
    print('"$symbol": ${symbols[symbol]}');


}

void ex2() {
  int a = 23, b = 35, i;

  // Цикл for
  stdout.write('\nЦикл for: [');
  for (i = a; i <= b; i++)
    stdout.write('$i, ');

  print('\b\b]');

  // Цикл while
  i = a;
  stdout.write('Цикл while: [');
  while (i <= b) {
    stdout.write('$i, ');
    i++;
  }
  print('\b\b]');

  // Цикл do-while
  i = a;
  stdout.write('Цикл do-while: [');
  do {
    stdout.write('$i, ');
    i++;
  } while(i <= b);
  print('\b\b]');

}

void ex3() {
  // List<int> list = [0-99];
  List<int> list = [for (var i = 0; i < 100; i++) i];
  print('\nСписок 1: $list');
}

void ex4() {
  List<int> list = [0-99];
  List<int> list2 = [for (var i in list) if (i % 5 == 0) i];
  print('\nСписок 2: $list2');
}

void ex5() {
  int a = -35, b = -1, i;

  stdout.write('\nЦикл for (1): [');
  for (i = a; i <= -1; i++)
    stdout.write('$i, ');
  print('\b\b]');

  stdout.write('Цикл while (4): [');
  i = a;
  while(i <= b) {
    stdout.write('$i, ');
    i += 4;
  }
  print('\b\b]');

  stdout.write('Цикл do-while (7): [');
  i = a;
  do {
    stdout.write('$i, ');
    i += 7;
  } while (i <= b);
  print('\b\b]');
}

List<int?> ex6([dynamic a, dynamic b, dynamic c]) {
  if (a == null || b == null || c == null) {
    return [null, null];
  }

  int min, max;

  // Используя только if-else
  if (a >= b && a >= c) {
    max = a;
    if (b <= c)
      min = b;
    else
      min = c;
  }
  else if (b >= a && b >= c) {
    max = b;
    if (a <= c)
      min = a;
    else
      min = c;
  }
  else {
    max = c;
    if (a <= b)
      min = a;
    else
      min = b;
  }


  // print('Минимальный: $min');
  // print('Максимальный: $max');

  return [min, max];
}

void ex7(List<int> list) {
  print('\nДанный список: $list');
  stdout.write('В обратном порядке: [');
  for (int i = list.length - 1; i >= 0; i--)
    stdout.write('${list[i]}, ');
  print('\b\b]');

  /*
  list = list.reversed.toList();
  print(list);
  */
}

void ex8(List<int> list) {
  print('\nДанный список: $list');
  stdout.write('С исключенными 2 и 6: ');
  list = [for (var i in list)
    if (i != 2 && i != 6)
      i];

  print(list);
}

int ex9(List<int> list) {
  var sum = 0;
  print('\nДанный список: $list');
  for (var i in list)
    sum += i;
  print('Сумма элементов: $sum');
  return sum;
}

void ex10(List<int> list) {
  print('Среднеe арифметическое: ${ex9(list) / list.length}');
}

void ex11() {
  List<int> myList = [1, 3, 4, 1, 4, 5, 7, 3, 8, 5];
  print('\nДанный список: $myList');
  print('Список без повторений: ${myList.toSet().toList()}');
}

void ex12() {
  stdout.write('\nБуква > ');
  var char = stdin.readLineSync(encoding: utf8)![0];
  switch (char) {
    case 'а':
    case 'о':
    case 'э':
    case 'е':
    case 'и':
    case 'ы':
    case 'у':
    case 'ё':
    case 'ю':
    case 'я':
      print(' - это гласная!');
      break;
    default:
      print(' - это согласная! (или символ не из русского алфавита)');
      break;
  }
}

void ex13(List<int> list) {
  print('Данный массив: $list');

  stdout.write('Вывод с индексами: \n[');
  for (var i = 0; i < list.length; i++)
    stdout.write('($i)-${list[i]}, ');
  print('\b\b]');
}

void ex14() {
  stdout.write('\nЗначение (0-5) > ');
  var value = int.parse(stdin.readLineSync(encoding: utf8)!);
  switch (value) {
    case 0:
      print('Значение - 0');
      break;
    case 1:
      print('Значение - 1');
      break;
    case 2:
      print('Значение - 2');
      break;
    case 3:
      print('Значение - 3');
      break;
    case 4:
      print('Значение - 4');
      break;
    case 5:
      print('Значение - 5');
      break;
    default:
      print('Значение не соответствует выбранному диапазону!');
  }
}

int menu() {
  List<int> mainList = [4, 5, 6, 7, 2, 1, 2, 3, 4];
  try {
    print('\nВыбери задачу:');
    print('[1] Подсчет символа в строке');
    print('[2] Вывод чисел от 23 до 35 разными способами');
    print('[3] Формирование списка "гибким" методом');
    print('[4] Гибкая выборка чисел, кратных 5 из списка задания 3');
    print('[5] Вывод чисел с шагом 1, 4 и 7');
    print('[6] Поиск минимального и максимального среди a, b и c');
    print('[7] Вывод массива в обратном порядке');
    print('[8] С исключенными 2 и 6');
    print('[9] Сумма элементов массива');
    print('[10] Среднее арифметическое массива');
    print('[11] Удаление повторяющихся элементов');
    print('[12] Определение гласной/согласной');
    print('[13] Вывод с индексами');
    print('[14] Определение введенного значения');

    List<Function> exs =
    [ex1, ex2, ex3, ex4, ex5,
      ex6, ex7, ex8, ex9, ex10,
      ex11, ex12, ex13, ex14];

    var line = stdin.readLineSync(encoding: utf8);
    int choise = int.parse(line!);

    if ((choise >= 1 && choise <= 6)
        || choise == 11 || choise == 12 || choise == 14 )
      exs[choise - 1]();
    else if ((choise >= 7 && choise <= 10) || choise == 13)
      exs[choise - 1](mainList);
    else
      return 1;

    // Задержка для удобства
    sleep(Duration(seconds:3));
    menu();
  } catch (e) {
    print(e);
  }
  return 0;
}