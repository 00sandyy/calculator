import 'package:calci/widgets/calc_input.dart';
import 'package:calci/widgets/calc_keyboard_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _calcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CalcInput(
            controller: _calcController,
          ),
          const SizedBox(
            height: 500.0,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: CalcKeyboardLayout(),
            ),
          ),
        ],
      ),
    );
  }
}
