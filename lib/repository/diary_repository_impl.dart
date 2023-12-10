
import 'package:badminton_court_booking/model/diary.dart';
import 'package:badminton_court_booking/model/request/diary_request.dart';
import 'package:badminton_court_booking/remote/diary_service.dart';
import 'package:badminton_court_booking/repository/diary_repository.dart';

class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryService diaryService;

  DiaryRepositoryImpl(this.diaryService);

  @override
  Stream<Diary> createDiary(DiaryRequest request) => diaryService.createDiary(request);
  Stream<List<Diary>> getDiary(DiaryRequest request) => diaryService.getDiary(request);

}
