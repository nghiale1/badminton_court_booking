import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badminton_court_booking/di/get_it.dart';
import 'package:badminton_court_booking/model/request/auth_request.dart';
import 'package:badminton_court_booking/model/user.dart';
import 'package:badminton_court_booking/repository/auth_repository.dart';

import '../../../common/helper/pref_helper.dart';
import '../../resource_state.dart';

final loginProvider = StateNotifierProvider<LoginStateNotifier, ResourceState<User>>((ref) {
  return LoginStateNotifier(getItInstance.get<AuthRepository>());
});

class LoginStateNotifier extends StateNotifier<ResourceState<User>> {
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  LoginStateNotifier(this._authRepository) : super(ResourceInit<User>());

  Future<void> login(String userName, String password) async {
    try {
      AuthRequest request = AuthRequest.loginRequest(userName: userName, password: password);
      state = const Loading();
      _userSubscription = _authRepository.login(request).listen((user) {
        PrefHelper().setUser(user);
        state = Success(user);
      }, onError: (e) {
        state = Error(null, "${e.code.toString()}: ${e.errorMessage.toString()}");
      });
    } catch (e) {
      state = Error(null, e.toString());
    }
  }

  void resetState() {
    state = ResourceInit<User>();
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }
}