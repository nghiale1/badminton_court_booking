
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';
import 'package:badminton_court_booking/ui/auth/component/title_component.dart';
import 'package:badminton_court_booking/widget/button/positive_button_widget.dart';
import 'package:badminton_court_booking/widget/textform/password_textform_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../riverpod/auth/login/forget_password_riverpod.dart';
import '../../../riverpod/resource_state.dart';
import '../../../router/route_constant.dart';

class ResetPasswordComponent extends StatelessWidget {
  final String otp;
  final String? phoneNumber;
  final String? mail;

  const ResetPasswordComponent({Key? key, required this.otp, this.phoneNumber, this.mail}) : super(key: key);

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
            TitleComponent(title: "change_password".translate(), content: "require_password_desc".translate()),
            const SizedBox(
              height: 22,
            ),
            _FormResetPassword(otp: otp, phoneNumber: phoneNumber, mail: mail,)
          ],
        ),
      ),
    );
  }
}

class _FormResetPassword extends StatefulWidget {
  final String otp;
  final String? phoneNumber;
  final String? mail;

  const _FormResetPassword({Key? key, required this.otp, this.phoneNumber, this.mail}) : super(key: key);

  @override
  State<_FormResetPassword> createState() => _FormResetPasswordState();
}

class _FormResetPasswordState extends State<_FormResetPassword> {
  late TextEditingController mPassTxtEditController;
  late TextEditingController mConfirmPassTxtEditController;

  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    mConfirmPassTxtEditController = TextEditingController();
    mPassTxtEditController = TextEditingController();
  }

  @override
  void dispose() {
    mConfirmPassTxtEditController.dispose();
    mPassTxtEditController.dispose();
    super.dispose();
  }

  void _formValid() {
    setState(() {
      _isFormValid = mPassTxtEditController.text.length >= 8 && mConfirmPassTxtEditController.text == mPassTxtEditController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      var forgetPasswordNotifier = ref.read(forgetPasswordProvider.notifier);
      var forgetPasswordState = ref.watch(forgetPasswordProvider);

      if (forgetPasswordState.changePassword is Success) {
        Future.delayed(Duration.zero, () {
          forgetPasswordNotifier.resetState();
          Navigator.of(context).pushNamed(RouteList.completeResetPassword);
        });
      }

      return Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 22,
              ),
              PasswordTextFormWidget(
                labelText: "password".translate(),
                textEditingController: mPassTxtEditController,
                validator: (password) {
                  bool isValid = (password?.length ?? 0) >= 8;
                  _formValid();
                  return isValid ? null : "require_password_desc".translate();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordTextFormWidget(
                labelText: "reenter_password".translate(),
                textEditingController: mConfirmPassTxtEditController,
                validator: (password) {
                  bool isValid = password == mPassTxtEditController.text;
                  _formValid();
                  return isValid ? null : "passwords_do_not_match".translate();
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
                    if (widget.mail.isNullOrEmpty) {
                      forgetPasswordNotifier.resetPassword(otp: widget.otp,
                          password: mPassTxtEditController.text,
                          phoneNumber: widget.phoneNumber
                      );
                    }
                    else {
                      forgetPasswordNotifier.resetPassword(otp: widget.otp,
                          password: mPassTxtEditController.text,
                          mail: widget.mail
                      );
                    }
                  }
                },
              ),
            ],
          ),
          if (forgetPasswordState.changePassword is Loading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      );
    });
  }
}
