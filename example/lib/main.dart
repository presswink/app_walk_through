import 'package:flutter/material.dart';
import 'package:app_walk_through/app_walk_through.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Walk Through Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppWalkThrough(
        models: [
          AppWalkThroughDataModel(
            title: "Welcome to App Walk Through",
            description: "This is a simple example of how to use the app_walk_through package to showcase features.",
            image: "assets/img_1.jpg",
          ),
          AppWalkThroughDataModel(
            title: "Easy to Use",
            description: "Just define your models and pass them to the widget. It handles the rest!",
            image: "assets/img_2.jpg",
          ),
          AppWalkThroughDataModel(
            title: "Highly Customizable",
            description: "Customize colors, text styles, and button behaviors easily.",
            image: "assets/img_3.jpg",
          ),
        ],
        onNextButtonPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Walkthrough Finished!")),
          );
        },
        onSkipButtonPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Walkthrough Skipped!")),
          );
        },
      ),
    );
  }
}
