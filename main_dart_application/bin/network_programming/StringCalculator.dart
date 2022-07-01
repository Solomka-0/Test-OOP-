class StringCalculator {
  static String _expression = "2+2*(2+(2+2))";
  static bool _isSolved = false;
  static late double _result;

  static void setStr(String expression) {
    expression = expression.replaceAll(' ', '');
    _expression = expression;
    _isSolved = false;
  }

  static String _computation(String expression) {
    int leftBorder, rightBorder;
    double tmp;
    String substr;

    leftBorder = expression.lastIndexOf('(');
    rightBorder = expression.indexOf(')');

    while (leftBorder != -1 && rightBorder != -1) {
      substr = expression.substring(leftBorder, rightBorder + 1);
      expression = expression.replaceAll(substr, _computation(substr.substring(1, substr.length - 1)));

      leftBorder = expression.lastIndexOf('(');
      rightBorder = expression.indexOf(')');
    }

    // RegExp numberReg = RegExp(r'([0-9]+.?([0-9]+)?)');


    RegExp firstPrReg = RegExp(r'([+-]?[0-9]+\.?([0-9]+)?)([*/])([+-]?[0-9]+\.?([0-9]+)?)');
    RegExp secondPrReg = RegExp(r'([+-]?[0-9]+\.?([0-9]+)?)([+-])([+-]?[0-9]+\.?([0-9]+)?)');

    while (expression.indexOf(firstPrReg) != -1) {
      Iterable<Match> matches = firstPrReg.allMatches(expression);

      if (matches.first.group(3).toString() == '*') {
        tmp = double.parse(matches.first.group(1).toString()) *
            double.parse(matches.first.group(4).toString());
      } else {
        tmp = double.parse(matches.first.group(1).toString()) /
            double.parse(matches.first.group(4).toString());
      }
      substr = "${tmp > 0? "+": ""}$tmp";

      expression = expression.replaceFirst(firstPrReg, substr);
    }

    while (expression.indexOf(secondPrReg) != -1) {
      Iterable<Match> matches = secondPrReg.allMatches(expression);

      if (matches.first.group(3).toString() == '+') {
        tmp = double.parse(matches.first.group(1).toString()) +
            double.parse(matches.first.group(4).toString());
      } else {
        tmp = double.parse(matches.first.group(1).toString()) -
            double.parse(matches.first.group(4).toString());
      }
      substr = "${tmp > 0? "+": ""}$tmp";

      expression = expression.replaceFirst(secondPrReg, substr);
    }

    return expression;
  }

  static double getResult() {
    if (!_isSolved) {
      var result = _computation(_expression);
      _result = double.parse(result);
      _isSolved = true;
    }

    return _result;
  }
}