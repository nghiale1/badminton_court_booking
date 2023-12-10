import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/helper/pref_helper.dart';
import 'package:badminton_court_booking/riverpod/auth/login/login_riverpod.dart';
import 'package:badminton_court_booking/riverpod/resource_state.dart';
import 'package:badminton_court_booking/router/route_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badminton_court_booking/widget/dialog/show_bottom_sheet_error.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;
  late TextEditingController mEmailTxtEditController;
  late TextEditingController mPhoneTxtEditController;
  late TextEditingController mPassTxtEditController;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    mEmailTxtEditController = TextEditingController(text: "verna51");
    mPhoneTxtEditController = TextEditingController();
    mPassTxtEditController = TextEditingController(text: "password");
  }

  @override
  void dispose() {
    mEmailTxtEditController.dispose();
    mPhoneTxtEditController.dispose();
    mPassTxtEditController.dispose();
    super.dispose();
  }

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  Future<void> _loadSuggest() async {
    mailSuggest = await PrefHelper().getMailSuggest();
    phoneSuggest = await PrefHelper().getPhoneSuggest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.kPrimaryColor,
        title: Text('login'),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          var loginNotifier = ref.read(loginProvider.notifier);
          var loginState = ref.watch(loginProvider);

          if (loginState is Success) {
            Future.delayed(Duration.zero, () {
              loginNotifier.resetState();
              Navigator.of(context).pushNamed(RouteList.supervisorHome);

            });
          }
          if (loginState is Error) {
            Future.delayed(Duration.zero, () {
              showError(context, loginState.error);
            });
          }

          return Container(
              padding: EdgeInsets.all(16),
              child:  Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        Constant.kLocalImagePath + 'logo_icon.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(height: 24),
                      Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          // Tạo danh sách các gợi ý dựa trên giá trị đang nhập
                          return mailSuggest
                              .where((suggestion) =>
                                  suggestion.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase(),
                                      ))
                              .toList();
                        },
                        onSelected: (String selectedEmail) {
                          // Xử lý khi người dùng chọn một gợi ý
                          mEmailTxtEditController.text = selectedEmail;
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          // Tạo trường TextFormField
                          return TextFormField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            onFieldSubmitted: (value) {
                              onFieldSubmitted();
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorPalette.kPrimaryColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorPalette.kPrimaryColor),
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: ColorPalette.kPrimaryColor,
                                // Các thuộc tính kiểu chữ khác, ví dụ: fontSize, fontWeight,...
                              ),
                              border: OutlineInputBorder(),
                            ),
                          );
                        },
                        displayStringForOption: (String option) => option,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: mPassTxtEditController,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorPalette.kPrimaryColor),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorPalette.kPrimaryColor),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: ColorPalette.kPrimaryColor,
                            // Các thuộc tính kiểu chữ khác, ví dụ: fontSize, fontWeight,...
                          ),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            color: ColorPalette.kPrimaryColor,
                            icon: Icon(_isObscured
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: _toggleObscure,
                          ),
                        ),
                        obscureText: _isObscured,
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorPalette.kPrimaryColor,
                          onPrimary: Colors.white,
                          shadowColor: ColorPalette.kPrimaryColor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(100, 40), //////// HERE
                        ),
                        onPressed: () async {
                          // if (_isFormValid) {
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
                            final phoneWithoutLeadingZero =
                                phone.startsWith('0')
                                    ? phone.substring(1)
                                    : phone;

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
                          // }
                        },
                        child: Text('Login'),
                      )
                    ],
                  ),
                ));
        },
      ),
    );
  }
}
