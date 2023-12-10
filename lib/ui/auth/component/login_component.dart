import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badminton_court_booking/ui/auth/component/title_component.dart';
import '../../../common/helper/pref_helper.dart';
import '../../../riverpod/auth/login/login_riverpod.dart';
import '../../../riverpod/resource_state.dart';
import '../../../router/route_constant.dart';
import '../../../widget/button/positive_button_widget.dart';
import '../../../widget/button/radio_group_button_widget1.dart';
import '../../../widget/dialog/show_bottom_sheet_error.dart';
import '../../../widget/text/content_text_widget.dart';
import '../../../widget/textform/input_textform_widget2.dart';
import '../../../widget/textform/password_textform_widget.dart';
import '../../../widget/textform/phone_textform_widget2.dart';

class LoginComponent extends StatelessWidget {
  const LoginComponent({Key? key}) : super(key: key);

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
            TitleComponent(title: "hi".translate(), content: "login_working_day".translate()),
            const SizedBox(
              height: 22,
            ),
            const _FormLogin()
          ],
        ),
      ),
    );
  }
}

class _FormLogin extends StatefulWidget {
  const _FormLogin({Key? key}) : super(key: key);

  @override
  State<_FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<_FormLogin> {
  late TextEditingController mEmailTxtEditController;
  late TextEditingController mPhoneTxtEditController;
  late TextEditingController mPassTxtEditController;

  int _parentSelectedIndex = 0;

  String? regionCode = "";
  bool _isFormValid = false;
  bool _isPhoneValid = false;
  bool _isEmailValid = false;

  List<String> mailSuggest = [];
  List<String> phoneSuggest = [];

  @override
  void initState() {
    super.initState();
    _loadSuggest();
    mEmailTxtEditController = TextEditingController();
    mPhoneTxtEditController = TextEditingController();
    mPassTxtEditController = TextEditingController();
  }

  @override
  void dispose() {
    mEmailTxtEditController.dispose();
    mPhoneTxtEditController.dispose();
    mPassTxtEditController.dispose();
    super.dispose();
  }

  Future<void> _loadSuggest() async {
    mailSuggest = await PrefHelper().getMailSuggest();
    phoneSuggest = await PrefHelper().getPhoneSuggest();
  }

  void _formValid() {
    setState(() {
      _isFormValid = (_isEmailValid || _isPhoneValid) && mPassTxtEditController.text.length >= 8;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var loginNotifier = ref.read(loginProvider.notifier);
        var loginState = ref.watch(loginProvider);

        if (loginState is Success) {
          Future.delayed(Duration.zero, () {
            loginNotifier.resetState();
            if(loginState.data?.roles?.length == 1) {
              Navigator.of(context).pushNamed(RouteList.chooseDepartment);
            }
            else {
              //Todo navigate
            }
          });
        }
        if (loginState is Error) {
          Future.delayed(Duration.zero, () {
            showError(context, loginState.error);
          });
        }

        return Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                RadioGroupButtonWidget1(
                  txtNegative: "by_email".translate(),
                  txtPositive: "by_phone_number".translate(),
                  onIndexChanged: (newIndex) {
                    loginNotifier.resetState();
                    setState(() {
                      _parentSelectedIndex = newIndex;
                      _isEmailValid = false;
                      _isPhoneValid = false;
                      _formValid();
                    });
                  },
                ),
                const SizedBox(
                  height: 22,
                ),
                _parentSelectedIndex == 0
                    ? InputTextFormWidget2(
                        labelText: "email".translate(),
                        onChangeController: (controller) {
                          mEmailTxtEditController = controller;
                        },
                        suggestions: mailSuggest,
                        validator: (email) {
                          _isEmailValid = !ValidatorUtil.emailValidate(email ?? "");
                          _formValid();
                          return _isEmailValid ? null : "invalid_email".translate();
                        },
                      )
                    : PhoneTextFormWidget2(
                        labelText: "phone".translate(),
                        onChangeController: (controller) {
                          mPhoneTxtEditController = controller;
                        },
                        suggestions: phoneSuggest,
                        errorText: "invalid_phone_number".translate(),
                        validator: (isValid, region) {
                          regionCode = region;
                          _isPhoneValid = isValid ?? false;
                          _formValid();
                        },
                      ),
                const SizedBox(
                  height: 16,
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteList.forgetPassword);
                  },
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: ContentTextWidget1.lightBlue("forgot_password".translate()),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                PositiveButtonWidget(
                  text: "login".translate(),
                  isEnable: _isFormValid,
                  onPressed: () async {
                    if (_isFormValid) {
                      String pass = mPassTxtEditController.text.trim();
                      if (_parentSelectedIndex == 0) {
                        String mail = mEmailTxtEditController.text.trim();

                        //set suggest mail
                        mailSuggest.add(mail);
                        List<String> mails = mailSuggest;
                        PrefHelper().setMailSuggest(mails);

                        //call api login
                        loginNotifier.login(
                          mail,
                          pass,
                        );
                      } else {
                        final phone = mPhoneTxtEditController.text.trim();
                        final phoneWithoutLeadingZero = phone.startsWith('0') ? phone.substring(1) : phone;

                        //set suggest phone
                        phoneSuggest.add(phone);
                        List<String> phones = phoneSuggest;
                        PrefHelper().setPhoneSuggest(phones);

                        //call api login
                        loginNotifier.login(
                          '$regionCode$phoneWithoutLeadingZero',
                          pass,
                        );
                      }
                      _loadSuggest();
                    }
                  },
                ),
              ],
            ),
            if (loginState is Loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );

  }
}
