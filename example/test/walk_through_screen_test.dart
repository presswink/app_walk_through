import 'package:app_walk_through/app_walk_through.dart';
import 'package:app_walk_through_example/walk_through_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'my_widget_tester.dart';

void main(){
  testWidgets("should have AppWalkThrough widget", (widgetTester) async {
    await widgetTester.pumpWidget(const MyWidgetTester(screen: WalkThroughScreen()));
    final appWalkThroughFinder = find.byType(AppWalkThrough);
    expect(appWalkThroughFinder, findsOneWidget);
  });
}