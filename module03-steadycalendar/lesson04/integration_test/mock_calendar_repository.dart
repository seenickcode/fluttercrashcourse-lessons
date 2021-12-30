import 'package:lesson04/config/constants.dart';
import 'package:lesson04/repositories/cal_repo_interface.dart';
import 'package:lesson04/models/calendar.dart';

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

  @override
  saveCalendar(Calendar cal) async {
    return;
  }

  @override
  deleteCalendar(Calendar cal) async {
    return;
  }

  @override
  saveDate(Calendar cal, DateTime date) async {
    return;
  }

  @override
  deleteDate(Calendar cal, DateTime date) async {
    return;
  }
}
