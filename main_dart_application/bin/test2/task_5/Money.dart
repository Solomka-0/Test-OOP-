enum Currency {
  ruble,
  dollar,
  euro
}

class Money {
  late Currency type;
  late double amount;
  Money(Currency this.type, double this.amount);

  String toString() => '\nВалюта: $type - Кол-во: $amount';
}