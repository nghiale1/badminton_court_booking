import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:badminton_court_booking/config/env/env.dart';

import '../di/get_it.dart' as getIt;
import '../app/badminton_court_booking.dart';
import '../config/env/staging/firebase_options.dart';

void main() async {
  const String env = String.fromEnvironment('ENV', defaultValue: Env.STAGING);
  Env().initConfig(env);

  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  // await Firebase.initializeApp(
  //   // name: Env.STAGING,
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(BadmintonCourtBookingApp());
}