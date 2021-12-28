import 'package:json_annotation/json_annotation.dart';
import 'package:lesson03/config/constants.dart';
import 'calendar_color.dart';
import 'calendar_date.dart';
import 'calendar_dates_converter.dart';
import 'date_time_converter.dart';

part 'calendar.g.dart';

@JsonSerializable()
@CalendarDatesConverter()
@DateTimeConverter()
class Calendar {
  @JsonKey(includeIfNull: false)
  int? id;

  @JsonKey(name: 'user_id')
  String? userID;

  String name;

  @JsonKey(name: 'color', required: true)
  String colorHex;

  @JsonKey(name: 'background_slug', required: true)
  String backgroundSlug;

  @JsonKey(name: 'calendar_dates', required: false, includeIfNull: false)
  CalendarDates? dates;

  CalendarColor get color => colors.firstWhere((e) => colorHex == e.hex);

  Calendar(
      {this.id,
      this.userID,
      required this.name,
      required this.colorHex,
      required this.backgroundSlug,
      this.dates});

  factory Calendar.blank() {
    return Calendar(
        name: 'Untitled',
        colorHex: colors.first.hex,
        backgroundSlug: 'darts@3x.png');
  }

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarToJson(this);
}
