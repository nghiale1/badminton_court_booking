
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/auth_request.dart';
import '../model/user.dart';
import '../model/verify.dart';
import 'api_url.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST(ApiURL.kLogin)
  Stream<User> login(@Body() AuthRequest request);

  @POST(ApiURL.kRefreshToken)
  Future<User> refreshToken(@Body() AuthRequest request);

  @POST(ApiURL.kCheckUser)
  Stream<User> checkUser(@Body() AuthRequest request);

  @POST(ApiURL.kRequestOTP)
  Stream<dynamic> requestOTP(@Body() AuthRequest request);

  @POST(ApiURL.kVerifyOTP)
  Stream<Verify> verifyOTP(@Body() AuthRequest request);

  @POST(ApiURL.kResetPassword)
  Stream<dynamic> resetPassword(@Body() AuthRequest request);
}
