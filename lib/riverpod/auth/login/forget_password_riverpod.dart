import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di/get_it.dart';
import '../../../model/request/auth_request.dart';
import '../../../model/verify.dart';
import '../../../repository/auth_repository.dart';
import '../../resource_state.dart';

final forgetPasswordProvider = StateNotifierProvider<ForgetPasswordStateNotifier, _ForgetPasswordState>((ref) {
  return ForgetPasswordStateNotifier(getItInstance.get<AuthRepository>());
});

class ForgetPasswordStateNotifier extends StateNotifier<_ForgetPasswordState> {
  final AuthRepository _authRepository;

  ForgetPasswordStateNotifier(this._authRepository)
      : super(const _ForgetPasswordState._());

  Future<void> checkUser(String userName) async {
    try {
      state = state.copyWith(checkUser: const Loading());
      final request = AuthRequest.checkUserRequest(userName: userName);
      _authRepository.checkUser(request).listen((user) {
          state = state.copyWith(checkUser: Success(user));
        },
        onError: (e) {
          state = state.copyWith(
              checkUser: Error(null, "${e.code}: ${e.errorMessage}"));
        },
      );
    } catch (e) {
      state = state.copyWith(checkUser: Error(null, e.toString()));
    }
  }

  Future<void> requestOTP({String? phoneNumber, String? gmail}) async {
    try {
      state = state.copyWith(checkUser: const Loading());
      final AuthRequest request = AuthRequest.otpRequest(phoneNumber: phoneNumber, gmail: gmail);
      _authRepository.requestOTP(request).listen((_) {
        state = state.copyWith(otpRequest: Success(_));
      },
        onError: (e) {
          state = state.copyWith(
              otpRequest: Error(null, "${e.code}: ${e.errorMessage}"));
        },
      );
    } catch (e) {
      state = state.copyWith(checkUser: Error(null, e.toString()));
    }
  }

  Future<void> verifyOTP({String? otp, String? phoneNumber, String? mail}) async {
    try {
      state = state.copyWith(otpVerification: const Loading());
      final AuthRequest request = AuthRequest.verifyOTPRequest(otp: otp, phoneNumber: phoneNumber, gmail: mail);
      _authRepository.verifyOTP(request).listen((_) {
        state = state.copyWith(otpVerification: Success<Verify>(_));
      },
        onError: (e) {
          state = state.copyWith(
              otpVerification: Error(null, "${e.code}: ${e.errorMessage}"));
        },
      );
    } catch (e) {
      state = state.copyWith(otpVerification: Error(null, e.toString()));
    }
  }

  Future<void> resetPassword({String? otp, String? password, String? phoneNumber, String? mail}) async {
    try {
      state = state.copyWith(changePassword: const Loading());
      final AuthRequest request = AuthRequest.resetPasswordRequest(otp: otp, newPassword: password, phoneNumber: phoneNumber, email: mail);
      _authRepository.resetPassword(request).listen((_) {
        state = state.copyWith(changePassword: Success(_));
      },
        onError: (e) {
          state = state.copyWith(
              changePassword: Error(null, "${e.code}: ${e.errorMessage}"));
        },
      );
    } catch (e) {
      state = state.copyWith(changePassword: Error(null, e.toString()));
    }
  }

  void resetState() {
    state = state.copyWith(
        checkUser: ResourceInit<dynamic>(),
        otpRequest:  ResourceInit<dynamic>(),
        otpVerification:  ResourceInit<Verify>(),
        changePassword:  ResourceInit<dynamic>()
    );
  }
}

class _ForgetPasswordState {
  final ResourceState<dynamic>? checkUser;
  final ResourceState<dynamic>? otpRequest;
  final ResourceState<Verify>? otpVerification;
  final ResourceState<dynamic>? changePassword;

  const _ForgetPasswordState._({
    this.checkUser,
    this.otpRequest,
    this.otpVerification,
    this.changePassword,
  });

  _ForgetPasswordState copyWith({
    ResourceState<dynamic>? checkUser,
    ResourceState<dynamic>? otpRequest,
    ResourceState<Verify>? otpVerification,
    ResourceState<dynamic>? changePassword,
  }) {
    return _ForgetPasswordState._(
      checkUser: checkUser ?? this.checkUser,
      otpRequest: otpRequest ?? this.otpRequest,
      otpVerification: otpVerification ?? this.otpVerification,
      changePassword: changePassword ?? this.changePassword,
    );
  }
}
