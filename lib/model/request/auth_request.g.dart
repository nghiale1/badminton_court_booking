// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      userName: json['userName'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userName', instance.userName);
  writeNotNull('password', instance.password);
  return val;
}

_CheckUserRequest _$CheckUserRequestFromJson(Map<String, dynamic> json) =>
    _CheckUserRequest(
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$CheckUserRequestToJson(_CheckUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userName', instance.userName);
  return val;
}

_OTPRequest _$OTPRequestFromJson(Map<String, dynamic> json) => _OTPRequest(
      phoneNumber: json['phoneNumber'] as String?,
      gmail: json['gmail'] as String?,
    );

Map<String, dynamic> _$OTPRequestToJson(_OTPRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('gmail', instance.gmail);
  return val;
}

_VerifyOTPRequest _$VerifyOTPRequestFromJson(Map<String, dynamic> json) =>
    _VerifyOTPRequest(
      phoneNumber: json['phoneNumber'] as String?,
      otp: json['otp'] as String?,
      gmail: json['gmail'] as String?,
    );

Map<String, dynamic> _$VerifyOTPRequestToJson(_VerifyOTPRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('otp', instance.otp);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('gmail', instance.gmail);
  return val;
}

_ResetPasswordRequest _$ResetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    _ResetPasswordRequest(
      newPassword: json['newPassword'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      otp: json['otp'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ResetPasswordRequestToJson(
    _ResetPasswordRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('otp', instance.otp);
  writeNotNull('newPassword', instance.newPassword);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('email', instance.email);
  return val;
}

_RefreshTokenRequest _$RefreshTokenRequestFromJson(Map<String, dynamic> json) =>
    _RefreshTokenRequest(
      json['refreshToken'] as String?,
    );

Map<String, dynamic> _$RefreshTokenRequestToJson(
    _RefreshTokenRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('refreshToken', instance.refreshToken);
  return val;
}
