
import 'package:badminton_court_booking/model/request/friend_request.dart';
import 'package:badminton_court_booking/model/user.dart';
import 'package:badminton_court_booking/remote/friend_service.dart';
import 'package:badminton_court_booking/repository/friend_repository.dart';

class FriendRepositoryImpl implements FriendRepository {
  final FriendService friendService;

  FriendRepositoryImpl(this.friendService);

  @override
  Stream<dynamic> createMatching(FriendRequest request) => friendService.createMatching(request);

  @override
  Stream<List<User>> getFriendList(FriendRequest request) => friendService.getFriendList(request);

  @override
  Stream<List<User>> getRecommendFriendList(FriendRequest request) => friendService.getRecommendFriendList(request);

}
