

import '../model/request/auth_request.dart';
import '../model/user.dart';
import '../model/verify.dart';

abstract class AuthRepository {
  Stream<User> login(AuthRequest request);
  Stream<User> checkUser(AuthRequest request);
  Stream<dynamic> requestOTP(AuthRequest request);
  Stream<Verify> verifyOTP(AuthRequest request);
  Stream<dynamic> resetPassword(AuthRequest request);
}