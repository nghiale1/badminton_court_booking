import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badminton_court_booking/common/helper/pref_helper.dart';

import '../../common/constant/constant.dart';
import '../../router/route_constant.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;
  int _second = 3; // set timer for 3 second and then direct to next page

  void _startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        _second--;
      });
      if (_second == 0) {
        _cancelFlashSaleTimer();
        _navigateNextScreen();
      }
    });
  }

  void _cancelFlashSaleTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    // set status bar color to transparent and navigation bottom color to black21
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    if (_second != 0) {
      _startTimer();
    }
    super.initState();
  }

  @override
  void dispose() {
    _cancelFlashSaleTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Center(
        child: Image.asset(Constant.kLocalIconPath + 'logo.png',
            width: MediaQuery.of(context).size.width * 0.8),
      ),
    ));
  }

  Future<void> _navigateNextScreen() async {
    final user = await PrefHelper().getUser();
    if (user != null) {
      // User is already logged in, navigate to the desired screen
      Navigator.of(context).pushNamed(RouteList.supervisorHome);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RouteList.login,
            (route) => false,
      );
    }
  }
}
