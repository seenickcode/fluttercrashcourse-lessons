// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lesson09/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    // await tester.drag(find.byType(ListView), const Offset(0.0, -250.0));
    // await tester.pump();

    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
    // expect(find.text('2'), findsOneWidget);
    // expect(find.text('3'), findsOneWidget);
    // expect(find.text('4'), findsOneWidget);
    // expect(find.text('5'), findsNothing);
    // expect(find.text('6'), findsNothing);
  });
}
