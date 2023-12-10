// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateDiaryRequest _$CreateDiaryRequestFromJson(Map<String, dynamic> json) =>
    _CreateDiaryRequest(
      user_iduser: json['user_iduser'] as int?,
      date: json['date'] as String?,
      status: json['status'] as int?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$CreateDiaryRequestToJson(_CreateDiaryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_iduser', instance.user_iduser);
  writeNotNull('date', instance.date);
  writeNotNull('status', instance.status);
  writeNotNull('content', instance.content);
  return val;
}

_GetDiaryRequest _$GetDiaryRequestFromJson(Map<String, dynamic> json) =>
    _GetDiaryRequest(
      user_iduser: json['user_iduser'] as int?,
      start: json['start'] as String?,
      end: json['end'] as String?,
    );

Map<String, dynamic> _$GetDiaryRequestToJson(_GetDiaryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_iduser', instance.user_iduser);
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}
