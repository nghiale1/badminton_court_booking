// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verify _$VerifyFromJson(Map<String, dynamic> json) => Verify(
      isValid: json['isValid'] as bool?,
    );

Map<String, dynamic> _$VerifyToJson(Verify instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isValid', instance.isValid);
  return val;
}
