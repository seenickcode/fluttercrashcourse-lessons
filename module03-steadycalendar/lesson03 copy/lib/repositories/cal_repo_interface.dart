import '/models/calendar.dart';

abstract class CalRepoInterface {
  Future<List<Calendar>> refreshCalendars();
}