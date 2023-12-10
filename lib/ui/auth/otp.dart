import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/header_auth.dart';
import 'component/otp_component.dart';

class OTPPage extends StatelessWidget {

  static const String keyPhoneNumber = "KEY_PHONE_NUMBER";
  static const String keyMail = "KEY_MAIL";

  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final mPhoneNumber = args[keyPhoneNumber] as String?;
    final mMail = args[keyMail] as String?;

    return Scaffold(
      body: _OtpBody(phoneNumber: mPhoneNumber, mail: mMail),
    );
  }
}

class _OtpBody extends StatelessWidget {

  final String? phoneNumber;
  final String? mail;

  const _OtpBody({Key? key, this.phoneNumber, this.mail}) : super(key: key);

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
                OtpComponent(phoneNumber: phoneNumber, mail: mail,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

