import 'package:calci/widgets/calc_button.dart';
import 'package:flutter/material.dart';

class CalcKeyboardLayout extends StatelessWidget {
  const CalcKeyboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return CalcButton(onTap: () {});
      },
    );
  }
}
