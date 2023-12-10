
import 'package:json_annotation/json_annotation.dart';

part 'verify.g.dart';

@JsonSerializable(includeIfNull: false)
class Verify {

  bool? isValid;

  Verify({this.isValid});

  factory Verify.fromJson(Map<String, dynamic> json) => _$VerifyFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyToJson(this);
}