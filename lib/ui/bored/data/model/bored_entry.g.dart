// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bored_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoredEntry _$BoredEntryFromJson(Map<String, dynamic> json) {
  return BoredEntry(
    activity: json['activity'] as String,
    type: json['type'] as String,
    participants: json['participants'] as int,
    price: BoredEntry._safeDouble(json['price']),
    link: json['link'] as String,
    key: json['key'] as String,
    accessibility: BoredEntry._safeDouble(json['accessibility']),
  );
}

Map<String, dynamic> _$BoredEntryToJson(BoredEntry instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'type': instance.type,
      'participants': instance.participants,
      'price': instance.price,
      'link': instance.link,
      'key': instance.key,
      'accessibility': instance.accessibility,
    };
