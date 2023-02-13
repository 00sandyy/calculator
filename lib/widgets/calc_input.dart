import 'package:calci/providers/calc_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalcInput extends StatelessWidget {
  const CalcInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final calcProvider = Provider.of<CalcProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: calcProvider.calcController,
        enabled: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
