import 'package:app_walk_through/app_walk_through.dart';
import 'package:app_walk_through_example/image_resource.dart';
import 'package:app_walk_through_example/second_screen.dart';
import 'package:flutter/material.dart';

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
