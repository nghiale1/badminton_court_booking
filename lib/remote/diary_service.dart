
import 'package:dio/dio.dart';
import 'package:badminton_court_booking/model/diary.dart';
import 'package:badminton_court_booking/model/request/diary_request.dart';
import 'package:retrofit/retrofit.dart';
import 'api_url.dart';

part 'diary_service.g.dart';

@RestApi()
abstract class DiaryService {
  factory DiaryService(Dio dio) = _DiaryService;

  @POST(ApiURL.kCreateDiary)
  Stream<Diary> createDiary(@Body() DiaryRequest request);

  @POST(ApiURL.kGetDiary)
  Stream<List<Diary>> getDiary(@Body() DiaryRequest request);
}
