import 'dart:io';
import 'dart:math';

Map<int, String> letters = {
  0: '0',
  1: '1',
  2: '2',
  3: '3',
  4: '4',
  5: '5',
  6: '6',
  7: '7',
  8: '8',
  9: '9',

  10: 'A',
  11: 'B',
  12: 'C',
  13: 'D',
  14: 'E',
  15: 'F'
};

class Translator {
  String number;
  int curNS;

  Translator(this.number, this.curNS);

  String translateTo(int NS) {
    String strTmp = number;

    stdout.write('\n${this.toString()} -> ');

    List<String>? symbols = strTmp.split('');

    int tmp = 0;
    for (int i = 0; i < symbols.length; i++) {
      tmp += int.parse(symbols[i]) * pow(curNS, symbols.length - i - 1).toInt();
    }


    strTmp = '';
    symbols.clear();
    symbols.add('${letters[tmp % NS]}');
    while(tmp ~/ NS > 0) {
      tmp ~/= NS;
      symbols.add('${letters[tmp % NS]}');
    }

    symbols = symbols.reversed.toList();

    strTmp = '';
    for (String symbol in symbols) {
      strTmp += symbol.toString();
    }

    number = strTmp;
    curNS = NS;

    stdout.write('${this.toString()}\n');

    return number;
  }

  String toString() => '$number-$curNS';
}