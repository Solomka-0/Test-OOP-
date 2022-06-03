import 'Atom.dart';

class Plus {

  String operator;
  dynamic leftElement;
  dynamic rightElement;

  Plus(this.leftElement, this.rightElement, this.operator);

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

  String toString() => '(${leftElement} $operator ${rightElement})';
}