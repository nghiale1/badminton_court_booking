// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateMatchingRequest _$CreateMatchingRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateMatchingRequest(
      user_id: json['user_id'] as int?,
      judged_person: json['judged_person'] as int,
      matching: json['matching'] as int,
    );

Map<String, dynamic> _$CreateMatchingRequestToJson(
    _CreateMatchingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.user_id);
  val['judged_person'] = instance.judged_person;
  val['matching'] = instance.matching;
  return val;
}

_GetFriendListRequest _$GetFriendListRequestFromJson(
        Map<String, dynamic> json) =>
    _GetFriendListRequest(
      user_id: json['user_id'] as int?,
    );

Map<String, dynamic> _$GetFriendListRequestToJson(
    _GetFriendListRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.user_id);
  return val;
}

_GetRecommendFriendListRequest _$GetRecommendFriendListRequestFromJson(
        Map<String, dynamic> json) =>
    _GetRecommendFriendListRequest(
      user_id: json['user_id'] as int,
      limit: json['limit'] as int? ?? 5,
    );

Map<String, dynamic> _$GetRecommendFriendListRequestToJson(
        _GetRecommendFriendListRequest instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'limit': instance.limit,
    };
