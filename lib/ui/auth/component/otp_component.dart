import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';
import 'package:badminton_court_booking/ui/auth/component/title_component.dart';
import 'package:badminton_court_booking/widget/button/positive_button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../riverpod/auth/login/forget_password_riverpod.dart';
import '../../../riverpod/resource_state.dart';
import '../../../router/route_constant.dart';
import '../../../widget/dialog/show_bottom_sheet_error.dart';
import '../../../widget/text/content_text_widget.dart';
import '../../../widget/text/sub_title_text_widget.dart';
import '../reset_password.dart';

class OtpComponent extends StatelessWidget {
  final String? phoneNumber;
  final String? mail;
  const OtpComponent({Key? key, this.phoneNumber, this.mail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery
            .of(context)
            .size
            .height * 0.8,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.horizontal),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleComponent(title: "input_otp".translate(), content: "otp_code_has_been_sent_to".translate()),
            const SizedBox(
              height: 22,
            ),
            _FormOtp(phoneNumber: phoneNumber, mail: mail,),
          ],
        ),
      ),
    );
  }
}

class _FormOtp extends ConsumerStatefulWidget {
  final String? phoneNumber;
  final String? mail;

  const _FormOtp({Key? key, this.phoneNumber, this.mail}) : super(key: key);

  @override
  ConsumerState<_FormOtp> createState() => _FormOtpState();
}

class _FormOtpState extends ConsumerState<_FormOtp> {

  String mCode = "";

  final int _countdownTime = 90;
  late Timer _timer;
  late Duration _duration;
  late String _formattedTime;

  @override
  void initState() {
    super.initState();
    _duration = Duration(seconds: _countdownTime);
    _formattedTime = _formatCountdownTime(_duration);
    _startCountDownTime();
  }

  void _startCountDownTime() {
    // Start the timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration = _duration - const Duration(seconds: 1);
        if (_duration <= Duration.zero) {
          _timer.cancel();
        }
        _formattedTime = _formatCountdownTime(_duration);
      });
    });
  }

  String _formatCountdownTime(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery
        .of(context)
        .viewInsets
        .bottom;

    var forgetPasswordNotifier = ref.read(forgetPasswordProvider.notifier);
    var forgetPasswordState = ref.watch(forgetPasswordProvider);

    if (forgetPasswordState.otpVerification is Success) {
      if (forgetPasswordState.otpVerification?.data?.isValid == true) {
        Future.delayed(Duration.zero, () {
          forgetPasswordNotifier.resetState();
          Navigator.of(context).pushNamed(RouteList.resetPassword, arguments: {
            ResetPasswordPage.keyOTP: mCode,
            ResetPasswordPage.keyPhoneNumber: widget.phoneNumber,
            ResetPasswordPage.keyMail: widget.mail
          });
        });
      }
      else {
        Future.delayed(Duration.zero, () {
          showError(context, "invalid_code".translate());
          forgetPasswordNotifier.resetState();
        });
      }
    }

     return Stack(
       children: [
         Column(
           children: [
             SizedBox(
               height: 70 + keyboardHeight,
               child: _OtpTextField(
                 numberOfFields: 6,
                 fieldWidth: MediaQuery
                     .of(context)
                     .size
                     .width * 0.14,
                 fieldStyle: Theme
                     .of(context)
                     .textTheme
                     .titleLarge,
                 onCodeChanged: (String code) {
                   mCode = code;
                 },
               ),
             ),
             const SizedBox(height: 14,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ContentTextWidget1("didn't_receive_otp".translate()),
                 const SizedBox(width: 2,),
                 GestureDetector(
                   onTap: () {
                      if (_duration.inSeconds == 0) {
                        if (widget.mail.isNullOrEmpty) {
                          forgetPasswordNotifier.requestOTP(phoneNumber: widget.phoneNumber);
                        }
                        else {
                          forgetPasswordNotifier.requestOTP(gmail: widget.mail);
                        }

                        if (forgetPasswordState.otpRequest is Success) {
                          setState(() {
                            _duration = Duration(seconds: _countdownTime);
                          });
                        }
                      }
                   },
                   child: _duration.inSeconds == 0
                       ? SubTitleTextWidget2.darkBlue("resend_otp".translate())
                       : SubTitleTextWidget2.darkBlue(_formattedTime)
                 )
               ],
             ),
             const SizedBox(height: 40,),
             PositiveButtonWidget(
               text: "verify_otp".translate(),
               isEnable: mCode.length == 6,
               onPressed: () async {
                   if (mCode.length == 6) {
                       if (widget.mail.isNullOrEmpty) {
                         forgetPasswordNotifier.verifyOTP(otp: mCode, phoneNumber: widget.phoneNumber);
                       }
                       else {
                         forgetPasswordNotifier.verifyOTP(otp: mCode, mail: widget.mail);
                       }
                    }
                },
             ),
           ],
         ),
         if (forgetPasswordState is Loading)
           const Center(
             child: CircularProgressIndicator(),
           ),
       ],
     );
   }
}

class _OtpTextField extends StatefulWidget {
  final int numberOfFields;
  final double fieldWidth;
  final TextStyle? fieldStyle;
  final Function(String) onCodeChanged;

  const _OtpTextField({Key? key, required this.numberOfFields, required this.fieldWidth, required this.fieldStyle, required this.onCodeChanged}) : super(key: key);

  @override
  State<_OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<_OtpTextField> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    6,
        (index) => TextEditingController(),
  );

  void _moveFocus(int index, bool next) {
    if (next && index < widget.numberOfFields - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (!next && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.numberOfFields, (index) {
          return SizedBox(
              height: 60,
              width: widget.fieldWidth,
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                onChanged: (value) {
                  if (value.length == 1 && index < widget.numberOfFields - 1) {
                    _moveFocus(index, true);
                  }
                  if (value.isEmpty) {
                    _moveFocus(index, false);
                  }
                  String code = _controllers
                      .map((controller) => controller.text)
                      .join("");
                  widget.onCodeChanged(code);
                },
                style: widget.fieldStyle,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorPalette.kPaleYellow,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      width: 1,
                      color: ColorPalette.kPaleYellow,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                        width: 1,
                        color: ColorPalette.kPaleYellow),
                  ),
                  focusColor: ColorPalette.kPaleYellow,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ));
        }));
  }
}

