import 'package:flutter/material.dart';

class CalcInput extends StatelessWidget {
  const CalcInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: controller,
        enabled: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
