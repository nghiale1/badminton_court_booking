import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:badminton_court_booking/config/env/env.dart';

import '../di/get_it.dart' as getIt;
import '../app/badminton_court_booking.dart';
import '../config/env/prod/firebase_options.dart';

void main() async {
  const String env = String.fromEnvironment('ENV', defaultValue: Env.PROD);
  Env().initConfig(env);

  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  // await Firebase.initializeApp(
  //   // name: Env.PROD,
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(BadmintonCourtBookingApp());
}