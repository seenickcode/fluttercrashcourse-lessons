import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lesson03/app.dart';
import 'mock_calendar_repository.dart';
import 'mock_splash_state.dart';

const testEnvFile = '.env.test';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('happy path tests', () {
    testWidgets('login and edit calendars', (WidgetTester tester) async {
      final calRepo = MockCalendarRepository();
      final splashState = MockSplashState();
      
      await runAppWithOptions(
          envFileName: testEnvFile, calendarRepository: calRepo, splashState: splashState);
      await tester.pumpAndSettle();

      final getStarted = find.widgetWithText(ElevatedButton, 'Get Started');
      await tester.tap(getStarted);
      await tester.pumpAndSettle();

            // find our login button

      expect(find.byType(GestureDetector), findsWidgets);

      await splashState.login();
      await tester.pumpAndSettle();
    });
  });
}
