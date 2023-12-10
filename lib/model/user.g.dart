// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int? ?? 0,
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      birth: json['birth'] as String?,
      hobby: json['hobby'] as String?,
      bio: json['bio'] as String?,
      photo: json['photo'] as String?,
      job: json['job'] as String?,
      sex: json['sex'] as String?,
      goal: json['goal'] as String?,
      story: json['story'] as String?,
      pain: json['pain'] as String?,
      need: json['need'] as String?,
      point: json['point'] as int? ?? 0,
      address: json['address'] as String?,
      config: json['config'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      weight: json['weight'] as String?,
      height: json['height'] as String?,
      relationship: json['relationship'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      existed: json['existed'] as bool?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    )..roles = (json['roles'] as List<dynamic>?)
        ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('access_token', instance.accessToken);
  writeNotNull('refresh_token', instance.refreshToken);
  writeNotNull('username', instance.username);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('birth', instance.birth);
  writeNotNull('hobby', instance.hobby);
  writeNotNull('bio', instance.bio);
  writeNotNull('photo', instance.photo);
  writeNotNull('job', instance.job);
  writeNotNull('sex', instance.sex);
  writeNotNull('goal', instance.goal);
  writeNotNull('story', instance.story);
  writeNotNull('pain', instance.pain);
  writeNotNull('need', instance.need);
  val['point'] = instance.point;
  writeNotNull('address', instance.address);
  writeNotNull('config', instance.config);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('weight', instance.weight);
  writeNotNull('height', instance.height);
  writeNotNull('relationship', instance.relationship);
  writeNotNull('phone', instance.phone);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('existed', instance.existed);
  writeNotNull('profile', instance.profile);
  writeNotNull('roles', instance.roles);
  return val;
}
