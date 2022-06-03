import 'dart:math';

import 'package:complex/complex.dart';

class Solver {
  late double a, b, c;

  Complex? x1, x2;

  Solver(this.a, this.b, this.c);

  void solve() {
    Complex D;
    double tmp;
    D = Complex(b * b - 4 * a * c);

    D = D.sqrt();

    x1 = (Complex(-b) - D)/Complex(2 * a);
    x2 = (Complex(-b) + D)/Complex(2 * a);

    print('x1 = $x1\nx2 = $x2');
  }
}