import 'dart:io';

import 'Weight.dart';

enum Direction {
  up,
  left,
  right,
  down
}

class Bar {
  late double maxWeight;
  late double maxWidth;
  List<Weight> leftWeights = [];
  List<Weight> rightWeights = [];

  Bar (double this.maxWeight, double this.maxWidth);

  void addWeight(Weight weight, Direction direction) {
    Weight tmpWeight = getCurWeight(direction);

    if (tmpWeight.weight + weight.weight <= maxWeight && tmpWeight.width + weight.width <= maxWidth) {
      print('Насаживаем блин на гриф..');

      if (direction == Direction.left)
        leftWeights.add(weight);
      else
        rightWeights.add(weight);

      sleep(Duration(milliseconds: 2000));
      print('Готово!');
    } else {
      print('Ну-ка, попробуем..');
      sleep(Duration(milliseconds: 2000));
      print('К сожалению, на грифе не хватает места :с');
    }
  }

  Weight getCurWeight(Direction direction) {
    try {
      if (direction == Direction.left) {
        return leftWeights.reduce((a, b) => a + b);
      } else if (direction == Direction.right) {
        return rightWeights.reduce((a, b) => a + b);
      }
    } catch(e){}
    return Weight(0, 0);
  }

  @override
  String toString() {
    String str = '';
    str += 'Блины на левой части:\n';
    for (Weight weight in leftWeights)
      str += '$weight\n';

    str += 'Блины на правой части:\n';
    for (Weight weight in rightWeights)
      str += '$weight\n';

    Weight curWeight = getCurWeight(Direction.left);
    str += '\nВес в левой части ${curWeight.weight}, толщина ${curWeight.width}';

    curWeight = getCurWeight(Direction.right);
    str += '\nВес в правой части ${curWeight.weight}, толщина ${curWeight.width}';
    return str;
  }
}