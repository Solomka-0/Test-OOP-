import 'dart:io';

enum Operation {
  stop,
  go,
  turn
}

class Car2 {
  Map<Operation, String> operationPerformed = {
    Operation.stop: "Автомобиль остановился..",
    Operation.go: "Автомобиль поехал..",
    Operation.turn: "Автомобиль повернул.."
  };

  List<Operation> actialOperations;

  Car2(this.actialOperations);

  void perform() {
    for (Operation operation in actialOperations) {
      sleep(Duration(milliseconds: 1500));
      print(operationPerformed[operation]);
    }
  }

}