import 'package:badminton_court_booking/model/diary.dart';
import 'package:badminton_court_booking/model/request/diary_request.dart';

abstract class DiaryRepository {
  Stream<Diary> createDiary(DiaryRequest request);
  Stream<List<Diary>> getDiary(DiaryRequest request);
}