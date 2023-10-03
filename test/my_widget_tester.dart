import 'package:flutter/material.dart';

class MyWidgetTester extends StatelessWidget {
  final Widget widget;
  const MyWidgetTester({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        persistentFooterAlignment: AlignmentDirectional.center,
        body: Container(
          alignment: Alignment.center,
          child: widget
        ),
      ),
    );
  }
}