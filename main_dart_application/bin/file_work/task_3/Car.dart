import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

import '../Logger.dart';

enum States {
  stop,
  go_forward,
  go_backward,
  to_left,
  to_right,
  acceleration,
  none
}

class Car {
  @JsonKey(unknownEnumValue: States.none)
  States lastState = States.none;
  @JsonKey(unknownEnumValue: States.none)
  States curState;
  BaseLogger logger = BaseLogger('Car');

  Car(this.curState);

  void changeState(States newState) {
    logger.logging(this);
    lastState = curState;
    curState = newState;
  }

  void setLogger(BaseLogger logger) {
    this.logger = logger;
  }

  Map<String, dynamic> toJson() {
    return {
      'lastState' : lastState.index.toString(),
      'curState' : curState.index.toString(),
    };
  }
}