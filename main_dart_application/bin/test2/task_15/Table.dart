import '../../index.dart';
import 'Cutlery.dart';

class Table {
  List<Cutlery> cutlery = [];

  void setList(cutlery) {
    this.cutlery = cutlery;
  }

  String toString() => cutlery.join('\n');
}