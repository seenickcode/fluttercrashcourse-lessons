import '/models/calendar.dart';

abstract class CalRepoInterface {
  Future<List<Calendar>> refreshCalendars();
  Future<void> saveCalendar(Calendar cal);
  Future<void> deleteCalendar(Calendar cal);
  Future<void> saveDate(Calendar cal, DateTime date);
  Future<void> deleteDate(Calendar cal, DateTime date);
}
