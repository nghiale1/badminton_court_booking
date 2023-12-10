import 'package:flutter/material.dart';

import 'package:badminton_court_booking/common/style/color_palette.dart';

ThemeData lightTheme() {
  return ThemeData(
//    primarySwatch: primaryColor,
    brightness: Brightness.light,
    // textTheme:
    // tabBarTheme:
    // accentIconTheme:
    // accentTextTheme:
    // appBarTheme:
    // bottomAppBarTheme:
    // buttonTheme:
    // cardTheme:
    // chipTheme:
    // dialogTheme:
    // floatingActionButtonTheme:
    // iconTheme:
    // inputDecorationTheme:
    // pageTransitionsTheme:
    // primaryIconTheme:
    // primaryTextTheme:
    // sliderTheme:
    primaryColor: ColorPalette.kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: ColorPalette.kPrimaryColor
    ),
    // scaffoldBackgroundColor: kPrimaryColor,
    // fontFamily: '',
    cardColor: ColorPalette.kBackgroundColor,
    backgroundColor: ColorPalette.kBackgroundColor,
  );
}
