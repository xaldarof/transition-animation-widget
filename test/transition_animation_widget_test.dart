// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterexample/main.dart';

void main() {
  testWidgets('Check toggle visibility of widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(Duration(seconds: 1));

    expect(find.text('Hello !'), findsOneWidget);
    expect(find.text('Flutter'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    // await tester.pump(Duration(seconds: 1));
    expect(find.text('Hello !'), findsNothing);
    expect(find.text('Flutter'), findsNothing);
  });
}
