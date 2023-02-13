import 'package:calci/models/history_models.dart';
import 'package:calci/widgets/calc_input.dart';
import 'package:flutter/material.dart';

class CalcProvider extends ChangeNotifier {
  List<String> inputDatas = [];
  List<String> resultDatas = [];
  String inputData = '';
  int? result;
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
    int num1 = int.parse(inputData.split(RegExp(r'[+,-,*,/]'))[0]);

    String op = inputData.split(RegExp(r'[0-9]'))[1];
    int num2 = int.parse(inputData.split(RegExp(r'[+,-,*,/]'))[1]);
    /*  List<String> elements = inputData.split(new RegExp(r"([+,-,*,/])"));
    double num1 = double.parse(elements[0].trim());
    double num2 = double.parse(elements[2].trim());
    String op = elements[1].trim();
*/
    switch (op) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      default:
        result = 0;
    }
    inputDatas.add(_calcController.text);
    resultDatas.add(result.toString());
    print(inputDatas);
    print(resultDatas);
    HistoryList(input: _calcController.text, result: result.toString());
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
