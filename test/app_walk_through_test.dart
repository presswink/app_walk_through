import 'package:app_walk_through/app_walk_through.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Testing AppWalkThroughDataModel", () {
    final dataModel = AppWalkThroughDataModel(
      title: "Title",
      description: "Description",
      image: "Image",
    );
    expect(dataModel.title, "Title");
    expect(dataModel.description, "Description");
    expect(dataModel.image, "Image");
  });

  testWidgets("AppWalkThrough Testing", (tester) async {
    final List<AppWalkThroughDataModel> models = [
      AppWalkThroughDataModel(title: "title", description: "desc", image: "assets/images/img1.jpg"),
      AppWalkThroughDataModel(title: "title2", description: "desc2", image: "assets/images/img1.jpg")
    ];
    await tester.pumpWidget(MaterialApp(
      home: AppWalkThrough(
          models: models,
          onNextButtonPressed: () {},
          onSkipButtonPressed: () {}
      ),
    ));
    await tester.pump();
    expect(find.text("Skip"), findsOneWidget);
    expect(find.widgetWithIcon(IconButton, Icons.arrow_forward), findsOneWidget);
    expect(find.text("title"), findsOneWidget);
    expect(find.text("desc"), findsOneWidget);
  });
}
