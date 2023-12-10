import 'package:badminton_court_booking/model/request/friend_request.dart';
import 'package:badminton_court_booking/model/user.dart';

abstract class FriendRepository {
  Stream<dynamic> createMatching(FriendRequest request);
  Stream<List<User>> getFriendList(FriendRequest request);
  Stream<List<User>> getRecommendFriendList(FriendRequest request);
}