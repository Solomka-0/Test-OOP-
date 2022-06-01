import 'dart:convert';
import 'dart:io';

class Weight {
  late double weight;
  late double width;

  Weight(double this.weight, double this.width);

  Weight.console() {
    stdout.write('Вес блина > ');
    weight = double.parse(stdin.readLineSync(encoding: utf8)!);
    stdout.write('Толщина > ');
    width = double.parse(stdin.readLineSync(encoding: utf8)!);
  }

  Weight operator +(Weight weight) {
    weight.weight += this.weight;
    weight.width += this.width;
    return weight;
  }

  @override
  String toString() {
    return 'Вес: $weight, Толщина: $width';
}
}