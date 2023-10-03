import 'package:app_walk_through_example/second_screen.dart';
import 'package:app_walk_through_example/walk_through_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WalkThroughScreen.routeName,
      routes: {
        WalkThroughScreen.routeName: (context) => const WalkThroughScreen(),
        SecondScreen.routeName:(context) => const SecondScreen()
      },
    );
  }
}

