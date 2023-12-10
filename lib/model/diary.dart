
import 'package:json_annotation/json_annotation.dart';

part 'diary.g.dart';

@JsonSerializable(includeIfNull: false)
class Diary {
  int id;
  String? date;
  int status;
  int? encounter;
  String? content;
  String? plan_tomorrow;
  String? meals;
  String? hydration;

  Diary({
    this.id = 0,
    this.date,
    this.status = 0,
    this.encounter,
    this.content,
    this.plan_tomorrow,
    this.meals,
    this.hydration,
  });

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);
  Map<String, dynamic> toJson() => _$DiaryToJson(this);
}
