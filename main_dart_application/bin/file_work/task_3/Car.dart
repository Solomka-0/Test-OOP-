import 'dart:io';

enum States {
  stop,
  go_forward,
  go_backward,
  to_left,
  to_right,
  acceleration
}

class Car {
  States state;

  Car(this.state);

  void changeState(States newState) {
    logging(state, newState);
    state = newState;
  }

  void logging(States state, States newState) {
    File myFile = File('car.log');

    myFile.writeAsStringSync('${DateTime.now()}\n$state\n$newState\n\n', mode: FileMode.append);
  }
}