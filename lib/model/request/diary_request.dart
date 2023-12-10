import 'package:json_annotation/json_annotation.dart';

part 'diary_request.g.dart';

abstract class DiaryRequest {
  const DiaryRequest._();

  factory DiaryRequest.createDiaryRequest({int? user_iduser, String? date, int? status, String? content}) = _CreateDiaryRequest;
  factory DiaryRequest.getDiaryRequest({String? start, String? end, int? user_iduser}) = _GetDiaryRequest;
}

@JsonSerializable(includeIfNull: false)
class _CreateDiaryRequest extends DiaryRequest {
  final int? user_iduser;
  final String? date;
  final int? status;
  final String? content;
  _CreateDiaryRequest({this.user_iduser, this.date, this.status, this.content}) : super._();

  factory _CreateDiaryRequest.fromJson(Map<String, dynamic> json) => _$CreateDiaryRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateDiaryRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class _GetDiaryRequest extends DiaryRequest {
  final int? user_iduser;
  final String? start;
  final String? end;
  _GetDiaryRequest({this.user_iduser, this.start, this.end}) : super._();

  factory _GetDiaryRequest.fromJson(Map<String, dynamic> json) => _$GetDiaryRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetDiaryRequestToJson(this);
}

