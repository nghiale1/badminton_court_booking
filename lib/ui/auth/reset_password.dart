import 'package:badminton_court_booking/ui/auth/component/reset_password_component.dart';
import 'package:flutter/material.dart';
import 'component/header_auth.dart';

class ResetPasswordPage extends StatelessWidget {

  static const String keyOTP = "KEY_OTP";
  static const String keyPhoneNumber = "KEY_PHONE_NUMBER";
  static const String keyMail = "KEY_MAIL";

  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final mOTP = args[keyOTP] as String;
    final mPhoneNumber = args[keyPhoneNumber] as String?;
    final mMail = args[keyMail] as String?;

    return Scaffold(
      body: _ResetPasswordBody(otp: mOTP, phoneNumber: mPhoneNumber, mail: mMail,),
    );
  }
}

class _ResetPasswordBody extends StatelessWidget {

  final String otp;
  final String? phoneNumber;
  final String? mail;

  const _ResetPasswordBody({required this.otp, this.phoneNumber, this.mail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/image/background.png'),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeaderAuth(),
                ResetPasswordComponent(otp: otp, phoneNumber: phoneNumber, mail: mail,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}