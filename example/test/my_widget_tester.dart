
import 'package:flutter/material.dart';

class MyWidgetTester extends StatelessWidget {
  final Widget screen;
  const MyWidgetTester({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: screen,
    );
  }
}

