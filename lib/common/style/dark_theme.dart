import 'package:flutter/material.dart';

import 'package:badminton_court_booking/common/style/color_palette.dart';

ThemeData darkTheme() {
  // ThemeData.dark().copyWith(), it's always from the mobile system settings
  // If using ThemeData here, from app settings
  return ThemeData.dark().copyWith(
//    primarySwatch: primaryColor,
    brightness: Brightness.dark,
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
    primaryColor: ColorPalette.kPrimaryDarkColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: ColorPalette.kPrimaryDarkColor
    ),
    scaffoldBackgroundColor: ColorPalette.kPrimaryDarkColor,
    backgroundColor: ColorPalette.kBackgroundDarkColor,
    // fontFamily: '',
    cardColor: ColorPalette.kBackgroundDarkColor,
  );
}