
import '../model/request/auth_request.dart';
import '../model/user.dart';
import '../model/verify.dart';
import '../remote/auth_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
  Stream<User> login(AuthRequest request) => authService.login(request);

  @override
  Stream<User> checkUser(AuthRequest request) => authService.checkUser(request);

  @override
  Stream<dynamic> requestOTP(AuthRequest request) => authService.requestOTP(request);

  @override
  Stream<Verify> verifyOTP(AuthRequest request) => authService.verifyOTP(request);

  @override
  Stream<dynamic> resetPassword(AuthRequest request) => authService.resetPassword(request);
}
