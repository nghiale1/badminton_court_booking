
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:badminton_court_booking/model/profile.dart';
import 'package:badminton_court_booking/model/role.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
class User {
  int id;
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  String? username;
  String? email;
  String? password;
  String? birth;
  String? hobby;
  String? bio;
  String? photo;
  String? job;
  String? sex;
  String? goal;
  String? story;
  String? pain;
  String? need;
  int point;
  String? address;
  String? config;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? weight;
  String? height;
  String? relationship;
  String? phone;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  bool? existed;
  Profile? profile;

  List<Role>? roles;

  User({
    this.id = 0,
    this.accessToken,
    this.refreshToken,
    this.username,
    this.email,
    this.password,
    this.birth,
    this.hobby,
    this.bio,
    this.photo,
    this.job,
    this.sex,
    this.goal,
    this.story,
    this.pain,
    this.need,
    this.point = 0,
    this.address,
    this.config,
    this.firstName,
    this.lastName,
    this.weight,
    this.height,
    this.relationship,
    this.phone,
    this.avatarUrl,
    this.existed,
    this.profile,
  });

  int getAge() {
    if (birth == null || birth!.isEmpty) {
      return 0; // Hoặc giá trị mặc định khác tùy ý
    }

    List<String> parts = birth!.split('-'); // Giả sử ngày sinh có định dạng yyyy-MM-dd
    if (parts.length < 3) {
      return 0; // Hoặc giá trị mặc định khác tùy ý
    }

    int birthYear = int.tryParse(parts[0]) ?? 0;
    int birthMonth = int.tryParse(parts[1]) ?? 0;
    int birthDay = int.tryParse(parts[2]) ?? 0;

    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthYear;
    if (currentDate.month < birthMonth ||
        (currentDate.month == birthMonth && currentDate.day < birthDay)) {
      age--;
    }
    return age;
  }


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}
