import 'package:calci/widgets/calc_input.dart';
import 'package:flutter/material.dart';

class CalcProvider extends ChangeNotifier {
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

  void showResult(final String buttonText) {}

  void resetValue(final String buttonText) {
    _calcController.text = "";
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
}
