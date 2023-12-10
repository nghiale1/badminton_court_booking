import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';
import 'package:badminton_court_booking/ui/auth/component/title_component.dart';
import 'package:badminton_court_booking/widget/button/positive_button_widget.dart';
import 'package:badminton_court_booking/widget/textform/input_textform_widget.dart';
import 'package:badminton_court_booking/widget/textform/phone_textform_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../riverpod/auth/login/forget_password_riverpod.dart';
import '../../../riverpod/resource_state.dart';
import '../../../router/route_constant.dart';
import '../../../widget/button/radio_group_button_widget1.dart';
import '../../../widget/dialog/main_dialog.dart';
import '../../../widget/dialog/show_bottom_sheet_error.dart';
import '../otp.dart';

class ForgetPasswordComponent extends StatelessWidget {
  const ForgetPasswordComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.horizontal),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleComponent(title: "forgot_password".translate(), content: "verify_user".translate()),
            const SizedBox(
              height: 22,
            ),
            const _FormForgetPassword()
          ],
        ),
      ),
    );
  }
}

class _FormForgetPassword extends ConsumerStatefulWidget{
  const _FormForgetPassword({Key? key}) : super(key: key);

  @override
  ConsumerState<_FormForgetPassword> createState() => _FormForgetPasswordState();
}

class _FormForgetPasswordState extends ConsumerState<_FormForgetPassword> {

  late TextEditingController mEmailTxtEditController;
  late TextEditingController mPhoneTxtEditController;

  late int _parentSelectedIndex;

  String? mRegionCode = "";
  bool _isFormValid = false;
  bool _isPhoneValid = false;
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
    _parentSelectedIndex = 0;
    mEmailTxtEditController = TextEditingController();
    mPhoneTxtEditController = TextEditingController();
  }

  @override
  void dispose() {
    mEmailTxtEditController.dispose();
    mPhoneTxtEditController.dispose();
    super.dispose();
  }

  void _formValid() {
    setState(() {
      _isFormValid = (_isEmailValid || _isPhoneValid);
    });
  }

  @override
  Widget build(BuildContext context) {

    var forgetPasswordState = ref.watch(forgetPasswordProvider);
    var forgetPasswordNotifier = ref.read(forgetPasswordProvider.notifier);

    final phone = mPhoneTxtEditController.text.trim();
    final phoneWithoutLeadingZero = phone.startsWith('0') ? phone.substring(1) : phone;

    void requestOTP() {
      if (mEmailTxtEditController.text.isNullOrEmpty) {
        forgetPasswordNotifier.requestOTP(phoneNumber: '$mRegionCode$phoneWithoutLeadingZero');
      }
      else {
        forgetPasswordNotifier.requestOTP(gmail: mEmailTxtEditController.text);
      }
    }

    if (forgetPasswordState.otpRequest is Success) {
      Future.delayed(Duration.zero, () {
        forgetPasswordNotifier.resetState();
        Navigator.of(context).pushNamed(RouteList.otp, arguments: {
          OTPPage.keyPhoneNumber: '$mRegionCode$phoneWithoutLeadingZero',
          OTPPage.keyMail: mEmailTxtEditController.text
        });
      });
    }

    if (forgetPasswordState.checkUser is Success) {
      final userData = forgetPasswordState.checkUser?.data;
      if (userData?.existed == true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          requestOTP();
        });
      }
      else {
        Future.delayed(Duration.zero, () {
          showError(context, "confirm_mail_phone".translate());
          forgetPasswordNotifier.resetState();
        });
      }
    }
    else if (forgetPasswordState.checkUser is Error) {
      Future.delayed(Duration.zero, () {
        showError(context, forgetPasswordState.checkUser?.error);
        forgetPasswordNotifier.resetState();
      });
    }

    return Stack(
      children: [
        Column(
          children: [
            RadioGroupButtonWidget1(
              txtNegative: "by_email".translate(),
              txtPositive: "by_phone_number".translate(),
              onIndexChanged: (newIndex) {
                forgetPasswordNotifier.resetState();
                setState(() {
                  _parentSelectedIndex = newIndex;
                  _isPhoneValid = false;
                  _isEmailValid = false;
                  _formValid();
                });
              },
            ),
            const SizedBox(
              height: 22,
            ),
            _parentSelectedIndex == 0
                ? InputTextFormWidget(
              labelText: "email".translate(),
              textEditingController: mEmailTxtEditController,
              validator: (email) {
                _isEmailValid = !ValidatorUtil.emailValidate(email ?? "");
                _formValid();
                return _isEmailValid ? null : "invalid_email".translate();
              },
            )
                : PhoneTextFormWidget(
              labelText: "phone".translate(),
              textEditingController: mPhoneTxtEditController,
              errorText: "invalid_phone_number".translate(),
              validator: (isValid, region) {
                mRegionCode = region;
                _isPhoneValid = isValid ?? false;
                _formValid();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            PositiveButtonWidget(
              text: "next".translate(),
              isEnable: _isFormValid,
              onPressed: () async {
                if (_isFormValid) {
                  final phone = mPhoneTxtEditController.text.trim();
                  final phoneWithoutLeadingZero = phone.startsWith('0') ? phone.substring(1) : phone;
                  showDialog(context: context, builder: (BuildContext context) {
                    return MainDialog(
                      title: "confirm".translate(),
                      content: "confirm_phone_number_desc".translate(),
                      positiveText: "next".translate(),
                      negativeText: "cancel".translate(),
                      positiveOnPressed: () {
                        forgetPasswordNotifier.checkUser(
                            _parentSelectedIndex == 0
                                ? mEmailTxtEditController.text.trim()
                                : ("$mRegionCode$phoneWithoutLeadingZero")
                        );
                        Navigator.pop(context);
                      },
                      negativeOnPressed: ()  {
                        Navigator.pop(context);
                      },
                    );
                  });
                }
              },
            ),
          ],
        ),
        if (forgetPasswordState.checkUser is Loading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
