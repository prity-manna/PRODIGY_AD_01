import 'dart:async';

class ButtonFunctions {

  static Future<bool> isDecimal(String val) async => val == ".";

  static Future<bool> isOperator(String val) async {
    return val == "/" || val == "x" || val == "+" || val == "-";
  }

  static Future<bool> _isNumeric(String? str) async {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  static Future<int> _getPrecedence(String op) async {
    switch (op) {
      case '+':
      case '-':
        return 1;
      case 'x':
      case '/':
        return 2;
      default:
        return 0;
    }
  }

  static Future<bool> _hasHigherPrecedence(String op1, String op2) async {
    int precedence1 = await _getPrecedence(op1);
    int precedence2 = await _getPrecedence(op2);
    return precedence1 >= precedence2;
  }

  static Future<List<String>> _convertToPostfix(List<String> infixExpression) async {
    List<String> postfix = [];
    List<String> operatorStack = [];

    for (String token in infixExpression) {
      if (await _isNumeric(token)) {
        postfix.add(token);
      } else if (await isOperator(token)) {
        while (operatorStack.isNotEmpty && await _hasHigherPrecedence(operatorStack.last, token)) {
          postfix.add(operatorStack.removeLast());
        }
        operatorStack.add(token);
      }
    }
  
    while (operatorStack.isNotEmpty) {
      postfix.add(operatorStack.removeLast());
    }
  
    return postfix;
  }

  static Future<double> _performOperation(double operand1, double operand2, String operator) async {
    switch (operator) {
      case '/':
        return operand1 / operand2;
      case 'x':
        return operand1 * operand2;
      case '+':
        return operand1 + operand2;
      case '-':
        return operand1 - operand2;
      default:
        throw ArgumentError('Invalid operator: $operator');
    }
  }

  static Future<double> _evaluatePostfix(List<String> postfixExpression) async {
    List<double> stack = [];

    for (String token in postfixExpression) {
      if (await _isNumeric(token)) {
        stack.add(double.parse(token));
      } else if (await isOperator(token)) {
        double operand2 = stack.removeLast();
        double operand1 = stack.removeLast();
        double result = await _performOperation(operand1, operand2, token);
        stack.add(result);
      }
    }

    return stack.first;
  }

  static Future<Object?> onCalculation(String inputText) async {
    double? result;
    try {
      List<String> tokens = [];
      String currentNumber = "";

      for (int i = 0; i < inputText.length; i++) {
        String val = inputText[i];
        if (await isOperator(val)) {
          if (i == 0 || await isOperator(inputText[i - 1])) {
            currentNumber += val;
          } else {
            tokens.add(currentNumber);
            tokens.add(val);
            currentNumber = '';
          }
        } else {
          currentNumber += val;
          if (i == inputText.length - 1) {
            tokens.add(currentNumber);
          }
        }
      }

      List<String> postfixExpression = await _convertToPostfix(tokens);
      result = double.parse((await _evaluatePostfix(postfixExpression)).toStringAsFixed(10));
      int resultInt = result.toInt();
      if (resultInt == result) return resultInt;
    } catch (ex) {
      // Error
    }
    return result;
  }

}
