import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badminton_court_booking/widget/textform/my_textform_widget.dart';
import 'package:badminton_court_booking/widget/button/my_button_widget.dart';
import 'package:badminton_court_booking/common/style/global_style.dart';
import 'package:badminton_court_booking/common/extension/string_ext.dart';

import '../../cubit/auth/sign_in/sign_in_cubit.dart';
import '../../di/get_it.dart';
import '../../router/route_constant.dart';

class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // initialize global widget
  final _myTextFormWidget = MyTextFormWidget();
  final _myButtonWidget = MyButtonWidget();
  final _signInCubit = getItInstance.get<SignInCubit>();

  final TextEditingController _etEmail = TextEditingController();
  final TextEditingController _etPassword = TextEditingController();

  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _etEmail.dispose();
    _etPassword.dispose();
    _signInCubit.dispose();
    _signInCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>.value(value: _signInCubit)
      ],
      child: Scaffold(
          body: ListView(
            padding: EdgeInsets.fromLTRB(30, 100, 30, 30),
            children: <Widget>[
              Center(
                  child: Image.asset('assets/icon/logo.png',
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7)),
              StreamBuilder(
                  stream: _signInCubit.email,
                  builder: (_, snapShot) =>
                      _myTextFormWidget.createTextForm(
                          inputType: TextInputType.emailAddress,
                          controller: _etEmail,
                          labelText: 'email'.translate(),
                          errorText: snapShot.hasError ? snapShot.error
                              .toString() : null,
                          onChanged: (val) => _signInCubit.sinkEmail.add(val)
                      )),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: _signInCubit.password,
                builder: (_, snapShot) =>
                    TextField(
                      controller: _etPassword,
                      obscureText: _obscureText,
                      style: GlobalStyle.tfStyle,
                      onChanged: (val) => _signInCubit.sinkPassword.add(val),
                      decoration: InputDecoration(
                        focusedBorder: GlobalStyle.tfFocusedBorder,
                        enabledBorder: GlobalStyle.tfEnabledBorder,
                        labelText: 'password'.translate(),
                        labelStyle: GlobalStyle.tfLabelStyle,
                        errorText: snapShot.hasError
                            ? snapShot.error.toString()
                            : null,
                        suffixIcon: IconButton(
                            icon: Icon(_iconVisible, color: Colors.grey[400],
                                size: 20),
                            onPressed: () {
                              _toggleObscureText();
                            }),
                      ),
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // todo
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                      FocusScope.of(context).unfocus();
                    },
                    child: Text(
                      'forgot_password'.translate(),
                      style: GlobalStyle.textHyperlink,
                    ),
                  )),
              SizedBox(
                height: 40,
              ),
              StreamBuilder(
                  stream: _signInCubit.submitValid,
                  builder: (_, snapShot) =>
                      _myButtonWidget.createButton(
                          labelText: 'login'.translate(),
                          onPressed: snapShot.data == true
                              ? () {
                            // todo
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              RouteList.supervisorHome, (route) => false,);
                            // _signInCubit.doLogin();
                          } : null)),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'or_sign_in_with'.translate(),
                  style: GlobalStyle.authSignWith,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _myButtonWidget.createSquareIconButton(
                        iconPath: "assets/image/google.png",
                        onTap: () {
                          //todo sign in with google
                        }),
                    _myButtonWidget.createSquareIconButton(
                        iconPath: "assets/image/facebook.png",
                        onTap: () {
                          //todo sign in with facebook
                        }),
                    _myButtonWidget.createSquareIconButton(
                        iconPath: "assets/image/twitter.png",
                        onTap: () {
                          //todo sign in with twitter
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // todo
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    FocusScope.of(context).unfocus();
                  },
                  child: Wrap(
                    children: [
                      Text(
                        'no_account_yet'.translate(),
                        style: GlobalStyle.authTextNormal,
                      ),
                      Text(
                        'create_one'.translate(),
                        style: GlobalStyle.textHyperlink,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              BlocConsumer<SignInCubit, SignInState>(
                buildWhen: (previous, current) => current is SignInError,
                builder: (context, state) {
                  return SizedBox.shrink();
                },
                listenWhen: (previous, current) => current is SignInSuccess,
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    // todo navigate to next screen
                  }
                },
              ),
            ],
          )),
    );
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }
}
