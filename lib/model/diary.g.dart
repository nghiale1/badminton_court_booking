// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diary _$DiaryFromJson(Map<String, dynamic> json) => Diary(
      id: json['id'] as int? ?? 0,
      date: json['date'] as String?,
      status: json['status'] as int? ?? 0,
      encounter: json['encounter'] as int?,
      content: json['content'] as String?,
      plan_tomorrow: json['plan_tomorrow'] as String?,
      meals: json['meals'] as String?,
      hydration: json['hydration'] as String?,
    );

Map<String, dynamic> _$DiaryToJson(Diary instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date);
  val['status'] = instance.status;
  writeNotNull('encounter', instance.encounter);
  writeNotNull('content', instance.content);
  writeNotNull('plan_tomorrow', instance.plan_tomorrow);
  writeNotNull('meals', instance.meals);
  writeNotNull('hydration', instance.hydration);
  return val;
}
