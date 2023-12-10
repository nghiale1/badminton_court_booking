import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

abstract class AuthRequest {
  const AuthRequest._();

  factory AuthRequest.loginRequest({String? userName, String? password}) = _LoginRequest;
  factory AuthRequest.checkUserRequest({String? userName}) = _CheckUserRequest;
  factory AuthRequest.otpRequest({String? phoneNumber, String? gmail}) = _OTPRequest;
  factory AuthRequest.verifyOTPRequest({String? otp, String? phoneNumber, String? gmail}) = _VerifyOTPRequest;
  factory AuthRequest.resetPasswordRequest({String? newPassword, String? phoneNumber, String? otp, String? email}) = _ResetPasswordRequest;
  factory AuthRequest.refreshTokenRequest(String? refreshToken) = _RefreshTokenRequest;
}

@JsonSerializable(includeIfNull: false)
class _LoginRequest extends AuthRequest {
  final String? userName;
  final String? password;

  _LoginRequest({this.userName, this.password}) : super._();

  factory _LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class _CheckUserRequest extends AuthRequest {
  final String? userName;

  _CheckUserRequest({this.userName}) : super._();

  factory _CheckUserRequest.fromJson(Map<String, dynamic> json) => _$CheckUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CheckUserRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class _OTPRequest extends AuthRequest {
  final String? phoneNumber;
  final String? gmail;

  _OTPRequest({this.phoneNumber, this.gmail}) : super._();

  factory _OTPRequest.fromJson(Map<String, dynamic> json) => _$OTPRequestFromJson(json);
  Map<String, dynamic> toJson() => _$OTPRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class _VerifyOTPRequest extends AuthRequest {
  final String? otp;
  final String? phoneNumber;
  final String? gmail;

  _VerifyOTPRequest({this.phoneNumber, this.otp, this.gmail}) : super._();

  factory _VerifyOTPRequest.fromJson(Map<String, dynamic> json) => _$VerifyOTPRequestFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOTPRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class _ResetPasswordRequest extends AuthRequest {
  final String? otp;
  final String? newPassword;
  final String? phoneNumber;
  final String? email;

  _ResetPasswordRequest({this.newPassword, this.phoneNumber, this.otp, this.email}) : super._();

  factory _ResetPasswordRequest.fromJson(Map<String, dynamic> json) => _$ResetPasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class _RefreshTokenRequest extends AuthRequest  {
  String? refreshToken;

  _RefreshTokenRequest(this.refreshToken) : super._();

  factory _RefreshTokenRequest.fromJson(Map<String, dynamic> json) => _$RefreshTokenRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}
