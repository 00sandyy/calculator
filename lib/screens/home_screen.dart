import 'package:calci/screens/history_list.dart';
import 'package:calci/widgets/calc_input.dart';
import 'package:calci/widgets/calc_keyboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _calcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.grey.shade300);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade300,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SafeArea(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HistoryList();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.history),
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: CalcInput(
                  controller: _calcController,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: CalcKeyboardLayout(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
