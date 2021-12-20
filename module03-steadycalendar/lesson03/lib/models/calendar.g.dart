// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calendar _$CalendarFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['color', 'background_slug'],
  );
  return Calendar(
    id: json['id'] as int?,
    userID: json['user_id'] as String?,
    name: json['name'] as String,
    colorHex: json['color'] as String,
    backgroundSlug: json['background_slug'] as String,
    dates: const CalendarDatesConverter()
        .fromJson(json['calendar_dates'] as List?),
  );
}

Map<String, dynamic> _$CalendarToJson(Calendar instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['user_id'] = instance.userID;
  val['name'] = instance.name;
  val['color'] = instance.colorHex;
  val['background_slug'] = instance.backgroundSlug;
  writeNotNull(
      'calendar_dates', const CalendarDatesConverter().toJson(instance.dates));
  return val;
}
