import 'package:calci/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CalcKeyboardLayout extends StatelessWidget {
  const CalcKeyboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> buttonText = [
      'C',
      '%',
      'AC',
      '/',
      '7',
      '8',
      '9',
      '*',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '00',
      '0',
      '.',
      '='
    ];
    return AnimationLimiter(
      child: GridView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        itemCount: buttonText.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: Duration(milliseconds: 900),
            columnCount: 4,
            child: ScaleAnimation(
              duration: Duration(milliseconds: 900),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                child: CalcButton(
                  fontSize: fontSize(buttonText[index]) ? 25 : 20,
                  onTap: () {},
                  bottonText: buttonText[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool fontSize(String x) {
    if (x == 'C' ||
        x == '%' ||
        x == 'AC' ||
        x == '/' ||
        x == '*' ||
        x == '+' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == '.') {
      return true;
    }
    return false;
  }
}
