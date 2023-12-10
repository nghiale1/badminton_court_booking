// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      aboutMe: json['avatar_url'] as String?,
      distance: json['distance'] as int?,
      ageRangeFrom: json['age_range_from'] as int?,
      ageRangeTo: json['age_range_to'] as int?,
      keyword: json['keyword'] as String?,
      showMe: json['showMe'] as String?,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      image4: json['image4'] as String?,
      image5: json['image5'] as String?,
      image6: json['image6'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avatar_url', instance.aboutMe);
  writeNotNull('distance', instance.distance);
  writeNotNull('age_range_from', instance.ageRangeFrom);
  writeNotNull('age_range_to', instance.ageRangeTo);
  writeNotNull('keyword', instance.keyword);
  writeNotNull('showMe', instance.showMe);
  writeNotNull('image1', instance.image1);
  writeNotNull('image2', instance.image2);
  writeNotNull('image3', instance.image3);
  writeNotNull('image4', instance.image4);
  writeNotNull('image5', instance.image5);
  writeNotNull('image6', instance.image6);
  return val;
}
