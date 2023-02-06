import 'dart:async';
import 'dart:js';

import 'package:calci/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void splash(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      ),
    );
  }
}
