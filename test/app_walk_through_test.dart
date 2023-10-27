import 'package:app_walk_through/app_walk_through.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'image_resource.dart';
import 'my_widget_tester.dart';

void main() {
  late List<AppWalkThroughDataModel> models;
  setUp(() {
    models = [
      AppWalkThroughDataModel(
          title: "Sit and Relax",
          description: "have a sit and relax for your future Goals.",
          image: ImageResouce.android2),
      AppWalkThroughDataModel(
          title: "LeaderBoard",
          description: "Leaderboard is the way to know your client behaviour.",
          image: ImageResouce.android3),
      AppWalkThroughDataModel(
          title: "Build your own blocks",
          description: "Buid you own block or path to success.",
          image: ImageResouce.android3)
    ];
  });

  testWidgets("should have forward IconButton", (widgetTester) async {
    await widgetTester.pumpWidget(MyWidgetTester(
        widget: AppWalkThrough(
            models: models,
            onNextButtonPressed: () {},
            onSkipButtonPressed: () {})));
    final buttonFinder = find.byType(IconButton);
    expect(buttonFinder, findsOneWidget);
    final iconFinder = find.byIcon(Icons.arrow_forward);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets("should have skip textButton", (widgetTester) async {
    await widgetTester.pumpWidget(MyWidgetTester(
        widget: AppWalkThrough(
            models: models,
            onNextButtonPressed: () {},
            onSkipButtonPressed: () {})));
    final buttonFinder = find.byType(TextButton);
    expect(buttonFinder, findsOneWidget);
    final textFinder = find.text("Skip");
    expect(textFinder, findsOneWidget);
  });

  testWidgets("should have pageView widget", (widgetTester) async {
    await widgetTester.pumpWidget(MyWidgetTester(
        widget: AppWalkThrough(
            models: models,
            onNextButtonPressed: () {},
            onSkipButtonPressed: () {})));
    final buttonFinder = find.byType(PageView);
    expect(buttonFinder, findsOneWidget);
  });
}
