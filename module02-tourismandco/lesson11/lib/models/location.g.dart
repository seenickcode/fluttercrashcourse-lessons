// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  final facts = json['facts'] as List<String>;
  return Location(
      name: json['name'] as String,
      url: json['url'] as String,
      facts: facts
          .map((e) => LocationFact.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'facts': instance.facts
    };
