import 'Plus.dart';

class Atom {
  late String name;
  Atom(this.name);

  Plus operator +(dynamic rightElement) {
    return Plus(this, rightElement, '+');
  }

  Plus operator -(dynamic rightElement) {
    return Plus(this, rightElement, '-');
  }

  Plus operator *(dynamic rightElement) {
    return Plus(this, rightElement, '*');
  }

  Plus operator /(dynamic rightElement) {
    return Plus(this, rightElement, '/');
  }

  String toString() => name;
}