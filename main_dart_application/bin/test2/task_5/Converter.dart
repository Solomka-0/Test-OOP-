import 'dart:io';

import 'Money.dart';

class Converter {
  Map<Currency, num> currency = {
    Currency.ruble: 1,
    Currency.dollar: 65,
    Currency.euro: 75
  };

  Money convertTo(Money money, Currency type) {
    sleep(Duration(milliseconds: 1600));
    print('Хм, сколько же выйдет [$type]?');
    sleep(Duration(milliseconds: 1600));
    money.amount = (money.amount * currency[money.type]!) / currency[type]!;
    money.type = type;
    print('Итого ${money.amount} [${money.type}]');
    return money;
  }
}