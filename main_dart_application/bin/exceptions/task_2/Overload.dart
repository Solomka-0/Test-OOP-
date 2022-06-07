class Overload {
  double value;

  Overload(this.value);

  Overload operator * (Overload obj) {
    Overload mult;
    (obj.value != 0)? (mult = Overload(value * obj.value)) : throw MultiplicationByZeroException();
    return mult;
  }

  Overload operator / (Overload obj) {
    Overload div;
    (obj.value != 0)? (div = Overload(value / obj.value)) : throw DivisionByZeroException();
    return div;
  }

  String toString() => '$value';
}

class DivisionByZeroException implements Exception {
  String toString() => 'DivisionByZeroException';
}

class MultiplicationByZeroException implements Exception {
  String toString() => 'MultiplicationByZeroException';
}