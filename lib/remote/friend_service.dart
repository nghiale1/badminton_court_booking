
import 'package:dio/dio.dart';
import 'package:badminton_court_booking/model/diary.dart';
import 'package:badminton_court_booking/model/request/diary_request.dart';
import 'package:badminton_court_booking/model/request/friend_request.dart';
import 'package:badminton_court_booking/model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'api_url.dart';

part 'friend_service.g.dart';

@RestApi()
abstract class FriendService {
  factory FriendService(Dio dio) = _FriendService;

  @POST(ApiURL.kGetFriendList)
  Stream<List<User>> getFriendList(@Body() FriendRequest request);

  @POST(ApiURL.kGetRecommendFriendList)
  Stream<List<User>> getRecommendFriendList(@Body() FriendRequest request);

  @POST(ApiURL.kCreateMatching)
  Stream<dynamic> createMatching(@Body() FriendRequest request);
}
