import 'package:app_walk_through/app_walk_through.dart';
import 'package:flutter/material.dart';

import 'image_resource.dart';

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
        SecondScreen.routeName: (context) => const SecondScreen()
      },
    );
  }
}

// WalkThrough screen initialization

class WalkThroughScreen extends StatelessWidget {
  const WalkThroughScreen({super.key});
  static const routeName = "/walk_through";

  void openSecondScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SecondScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: AppWalkThrough(
            models: [
              AppWalkThroughDataModel(
                  title: "Sit and Relax",
                  description: "have a sit and relax for your future Goals.",
                  image: ImageResouce.android2),
              AppWalkThroughDataModel(
                  title: "LeaderBoard",
                  description:
                      "Leaderboard is the way to know your client behaviour.",
                  image: ImageResouce.android3),
              AppWalkThroughDataModel(
                  title: "Build your own blocks",
                  description: "Build you own block or path to success.",
                  image: ImageResouce.android4)
            ],
            onNextButtonPressed: () {
              openSecondScreen(context);
            },
            onSkipButtonPressed: () {
              openSecondScreen(context);
            }),
      ),
    );
  }
}

// second screen initialization
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  static const routeName = "/secondScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text("second Screen"),
      ),
    );
  }
}
