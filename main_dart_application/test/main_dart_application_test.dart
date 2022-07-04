import 'package:main_dart_application/main_dart_application.dart';
import 'package:test/test.dart';

import '../bin/test1.dart';

void main() {
  ex6();
  test('calculate', () {
    expect(calculate(), 42);
  });
}
