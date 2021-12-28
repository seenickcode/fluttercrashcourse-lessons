import 'package:json_annotation/json_annotation.dart';
import 'calendar_date.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime value) {
    return calendarDateToString(value);
  }
}
