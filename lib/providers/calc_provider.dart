import 'package:flutter/material.dart';

class CalcProvider extends ChangeNotifier {
  List<String> inputDatas = [];
  List<String> resultDatas = [];
  String inputData = '';
  double? result;
  final TextEditingController _calcController = TextEditingController();

  TextEditingController get calcController => _calcController;

  void onPressedButton(final String buttonText) {
    switch (buttonText) {
      case "=":
        showResult(buttonText);
        break;
      case "AC":
        resetValue(buttonText);
        break;
      case "C":
        clearValue(buttonText);
        break;
      default:
        inputNumbers(buttonText);
    }
    notifyListeners();
  }

  void showResult(final String buttonText) {
    inputData = _calcController.text;
    final splitted = inputData.split(RegExp(r'[-,+,/,*,%]'));

    final num1 = double.parse(splitted.first);
    final num2 = double.parse(splitted.last);

    final op = inputData
        .split(RegExp(r'[0-9]'))
        .where((e) => e.isNotEmpty && !e.contains('.'))
        .toList()
        .first;
    print(splitted);
    print(num1);
    print(num2);
    print(op);

    switch (op) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        if (num1 == num2) {
          result = 0.0;
        } else {
          result = num1 - num2;
        }

        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      case '%':
        result = (num1 * num2) / 100;
        break;

      default:
        result = 0;
    }
    inputDatas.add(_calcController.text);
    resultDatas.add(result.toString());
  }

  void resetValue(final String buttonText) {
    _calcController.text = "";
    result = 0;
  }

  void clearValue(final String buttonText) {
    if (_calcController.text.isNotEmpty) {
      _calcController.text =
          _calcController.text.substring(0, _calcController.text.length - 1);
    }
  }

  void inputNumbers(final String buttonText) {
    _calcController.text += buttonText;
  }

  void resetHistoryDatas() {
    inputDatas = [];
    resultDatas = [];
  }
}
