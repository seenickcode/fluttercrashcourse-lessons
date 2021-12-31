import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lesson04/app.dart';
import 'package:lesson04/screens/cal_edit/cal_edit.dart';
import 'package:lesson04/screens/cal_pager/cal_pager.dart';
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

      expect(find.byType(GestureDetector), findsWidgets);

      await splashState.login();
      await tester.pumpAndSettle();

      // ensure first cal appears with name at the top
      expect(find.text(calRepo.cals.first.name), findsWidgets);
      await tester.pumpAndSettle();

      // navigate to cal list screen
      await tester.tap(find.byKey(const ValueKey(CalPager.calListIconKey)));
      await tester.pumpAndSettle();

      // navigate to cal edit screen
      await tester.tap(find.byKey(ValueKey("cal-${calRepo.cals.first.id}")));
      await tester.pumpAndSettle();

      // fill out form fields
      const newName = 'updated';

      // update name field
      await tester.tap(find.byKey(const ValueKey(CalEdit.nameKey)));
      await tester.pumpAndSettle();

      // NOTE enterText assumes that the form field is already focused
      await tester.enterText(find.byKey(const ValueKey(CalEdit.nameKey)), newName);
      await tester.pumpAndSettle();

      // choose a different background
      await tester.tap(find.byKey(const ValueKey(CalEdit.bgTileKey)));
      await tester.pumpAndSettle();

      const newBg = 'adventures-begin-mug@3x.png';
      await tester.tap(find.byKey(const ValueKey(newBg), skipOffstage: false));
      await tester.pumpAndSettle();

      // choose a different color
      await tester.tap(find.byKey(const ValueKey(CalEdit.colorTileKey)));
      await tester.pumpAndSettle();

      const newColor = '469781';
      await tester.tap(find.byKey(const ValueKey(newColor), skipOffstage: false));
      await tester.pumpAndSettle();

      await tester
          .tap(find.byKey(const ValueKey(CalEdit.saveKey), skipOffstage: false), warnIfMissed: false);
      await tester.pumpAndSettle();
    });
  });
}
