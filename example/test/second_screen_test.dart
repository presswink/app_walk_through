import 'package:app_walk_through_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'my_widget_tester.dart';

void main() {
  testWidgets("should have AppWalkThrough widget", (widgetTester) async {
    await widgetTester.pumpWidget(const MyWidgetTester(screen: SecondScreen()));
    final textFinder = find.text("second Screen");
    expect(textFinder, findsOneWidget);
  });
}
