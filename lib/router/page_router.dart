import 'package:badminton_court_booking/router/route_constant.dart';
import 'package:badminton_court_booking/ui/auth/complete_reset_password.dart';
import 'package:badminton_court_booking/ui/auth/launch.dart';
import 'package:badminton_court_booking/ui/auth/reset_password.dart';
import 'package:badminton_court_booking/ui/auth/forget_password.dart';
import 'package:badminton_court_booking/ui/auth/otp.dart';
import 'package:badminton_court_booking/ui/auth/select_role.dart';
import 'package:badminton_court_booking/ui/chat/chat.dart';
import 'package:badminton_court_booking/ui/dream/dream.dart';
import 'package:badminton_court_booking/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:badminton_court_booking/ui/home/supervisor/supervisor_home_page.dart';
import 'package:badminton_court_booking/ui/menu/menu.dart';
import '../ui/auth/login.dart';
import '../ui/auth/sign_in.dart';
import '../ui/splash/splash_page.dart';

class PageRouter {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
    RouteList.initial: (context) => SplashPage(),
    RouteList.signIn: (context) => SignInPage(),
    RouteList.login: (context) => LoginPage(),
    RouteList.selectRole: (context) => SelectRolePage(),
    RouteList.launch: (context) => LaunchPage(),
    RouteList.chat: (context) => ChatPage(),
    RouteList.menu: (context) => MenuPage(),
    RouteList.dream: (context) => DreamPage(),
    RouteList.forgetPassword: (context) => const ForgetPasswordPage(),
    RouteList.otp: (context) => const OTPPage(),
    RouteList.resetPassword: (context) => const ResetPasswordPage(),
    RouteList.completeResetPassword: (context) => const CompleteResetPasswordPage(),
    RouteList.home: (context) => HomePage(),
    RouteList.supervisorHome: (context) => SupervisorHomePage()
  };
}
