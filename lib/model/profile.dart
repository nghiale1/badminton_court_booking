
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(includeIfNull: false)
class Profile {
  @JsonKey(name: 'avatar_url')
  String? aboutMe;
  int? distance;
  @JsonKey(name: 'age_range_from')
  int? ageRangeFrom;
  @JsonKey(name: 'age_range_to')
  int? ageRangeTo;
  String? keyword;
  String? showMe;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? image6;

  Profile({
    this.aboutMe,
    this.distance,
    this.ageRangeFrom,
    this.ageRangeTo,
    this.keyword,
    this.showMe,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.image6,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}