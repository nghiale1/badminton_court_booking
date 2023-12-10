import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badminton_court_booking/common/helper/pref_helper.dart';
import 'package:badminton_court_booking/di/get_it.dart';
import 'package:badminton_court_booking/model/request/friend_request.dart';
import 'package:badminton_court_booking/model/user.dart';
import 'package:badminton_court_booking/repository/friend_repository.dart';
import 'package:badminton_court_booking/riverpod/resource_state.dart';

final friendProvider =
    StateNotifierProvider<FriendStateNotifier, _FriendState>((ref) {
  return FriendStateNotifier(getItInstance.get<FriendRepository>());
});

class FriendStateNotifier extends StateNotifier<_FriendState> {
  final FriendRepository _friendRepository;
  StreamSubscription<dynamic>? _friendSubscription;

  FriendStateNotifier(this._friendRepository) : super(_FriendState._());

  Future<void> createMatching(int judged_person, int? matching) async {
    try {
      var pref = getItInstance.get<PrefHelper>();
      var user = await pref.getUser();

      if (user.id == 0) {
        state = state.copyWith(
            createMatching: Error(null, "User data is missing or invalid"));
      }

      FriendRequest request = FriendRequest.createMatching(
          user_id: user.id,
          judged_person: judged_person,
          matching: matching ?? 0);
      state = state.copyWith(createMatching: const Loading());
      _friendRepository.createMatching(request).listen((matching) {
        state = state.copyWith(createMatching: Success(matching));
      }, onError: (e) {
        state = state.copyWith(
            createMatching: Error(null, "${e.code}: ${e.errorMessage}"));
      });
    } catch (e) {
      state = state.copyWith(createMatching: Error(null, e.toString()));
    }
  }

  Future<void> getFriendList() async {
    try {
      var pref = getItInstance.get<PrefHelper>();
      var user = await pref.getUser();

      if (user.id == 0) {
        state = state.copyWith(
            getFriendList: Error(null, "User data is missing or invalid"));
      }
      FriendRequest request = FriendRequest.getFriendList(user_id: user.id);
      state = state.copyWith(getFriendList: const Loading());
      _friendRepository.getFriendList(request).listen((friendList) {
        state = state.copyWith(getFriendList: Success(friendList));
      });
    } catch (e) {
      state = state.copyWith(getFriendList: Error(null, e.toString()));
    }
  }

  Future<void> getRecommendFriendList(int? limit) async {
    try {
      var pref = getItInstance.get<PrefHelper>();
      var user = await pref.getUser();

      if (user.id == 0) {
        state = state.copyWith(
            getRecommendFriendList:
                Error(null, "User data is missing or invalid"));
      }
      FriendRequest request = FriendRequest.getRecommendFriendList(
          user_id: user.id, limit: limit ?? 5);

      state = state.copyWith(getRecommendFriendList: const Loading());
      _friendRepository.getRecommendFriendList(request).listen(
        (friendList) {
          state = state.copyWith(getRecommendFriendList: Success(friendList));
        },
        onError: (error) {
          state = state.copyWith(
              getRecommendFriendList: Error(null, error.toString()));
        },
      );
    } catch (e) {
      state = state.copyWith(getRecommendFriendList: Error(null, e.toString()));
    }
  }

  void resetState() {
    state = state.copyWith(
      createMatching: ResourceInit<dynamic>(),
      getFriendList: ResourceInit<List<User>>(),
      getRecommendFriendList: ResourceInit<List<User>>(),
    );
  }

  @override
  void dispose() {
    _friendSubscription?.cancel();
    super.dispose();
  }
}

class _FriendState {
  final ResourceState<dynamic>? createMatching;
  final ResourceState<List<User>>? getFriendList;
  final ResourceState<List<User>>? getRecommendFriendList;

  const _FriendState._({
    this.createMatching,
    this.getFriendList,
    this.getRecommendFriendList,
  });

  _FriendState copyWith({
    ResourceState<dynamic>? createMatching,
    ResourceState<List<User>>? getFriendList,
    ResourceState<List<User>>? getRecommendFriendList,
  }) {
    return _FriendState._(
      createMatching: createMatching ?? this.createMatching,
      getFriendList: getFriendList ?? this.getFriendList,
      getRecommendFriendList:
          getRecommendFriendList ?? this.getRecommendFriendList,
    );
  }
}
