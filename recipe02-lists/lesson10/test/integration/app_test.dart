import 'dart:io' as io;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lesson10/mocks/mock_location.dart';
import 'package:lesson10/app.dart';
import '../test_utils.dart';

void main() {
  setUp(() {
    io.HttpOverrides.global = TestHttpOverrides();
  });
  testWidgets('test app startup', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    final mockLocation = MockLocation.fetchAny();

    expect(find.text(mockLocation.name), findsOneWidget);
    expect(find.text('${mockLocation.name}blah'), findsNothing);
  });
}
