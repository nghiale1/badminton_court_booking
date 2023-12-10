import 'package:json_annotation/json_annotation.dart';

part 'friend_request.g.dart';

abstract class FriendRequest {
  const FriendRequest._();

  // factory FriendRequest.createDiaryRequest({int? user_iduser, String? date, int? status, String? content}) = _CreateDiaryRequest;
  factory FriendRequest.createMatching({int user_id, required int judged_person, required int matching}) = _CreateMatchingRequest;
  factory FriendRequest.getFriendList({int user_id}) = _GetFriendListRequest;
  factory FriendRequest.getRecommendFriendList({required int user_id, int limit}) = _GetRecommendFriendListRequest;
}

@JsonSerializable(includeIfNull: false)
class _CreateMatchingRequest extends FriendRequest {
  final int? user_id;
  final int judged_person;
  final int matching;
  _CreateMatchingRequest({this.user_id, required this.judged_person, required this.matching}) : super._();

  factory _CreateMatchingRequest.fromJson(Map<String, dynamic> json) => _$CreateMatchingRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateMatchingRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class _GetFriendListRequest extends FriendRequest {
  final int? user_id;
  _GetFriendListRequest({this.user_id}) : super._();

  factory _GetFriendListRequest.fromJson(Map<String, dynamic> json) => _$GetFriendListRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetFriendListRequestToJson(this);
}


@JsonSerializable(includeIfNull: false)
class _GetRecommendFriendListRequest extends FriendRequest {
  final int user_id;
  final int limit;
  _GetRecommendFriendListRequest({required this.user_id, this.limit = 5}) : super._();

  factory _GetRecommendFriendListRequest.fromJson(Map<String, dynamic> json) => _$GetRecommendFriendListRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetRecommendFriendListRequestToJson(this);
}


