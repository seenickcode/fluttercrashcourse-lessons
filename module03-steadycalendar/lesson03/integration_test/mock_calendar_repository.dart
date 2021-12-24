import 'package:lesson03/config/constants.dart';
import 'package:lesson03/repositories/cal_repo_interface.dart';
import 'package:lesson03/models/calendar.dart';

class MockCalendarRepository extends CalRepoInterface {
  List<Calendar> cals = [
    Calendar(
        id: 1,
        name: 'untitled1',
        colorHex: colors.first.hex,
        backgroundSlug: backgrounds.first),
    Calendar(
        id: 2,
        name: 'untitled2',
        colorHex: colors.last.hex,
        backgroundSlug: backgrounds.last),
  ];

  @override
  Future<List<Calendar>> refreshCalendars() async {
    return cals;
  }
}
