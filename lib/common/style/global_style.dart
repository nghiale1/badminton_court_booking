import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'color_palette.dart';
import 'dimen.dart';

class GlobalStyle {

  // Text flutterflow
  static const TextStyle displayLarge = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle displayMedium = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle displaySmall = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle headlineLarge = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle headlineMedium = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle headlineSmall = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle titleLarge = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle titleMedium = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle titleSmall = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle bodyLarge = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle bodyMedium = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle bodySmall = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle labelLarge = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle labelMedium = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );
  static const TextStyle labelSmall = TextStyle(
      fontSize: Dimen.txt_15,
      fontWeight: FontWeight.w400,
      color: ColorPalette.kGrey
  );


  static const TextStyle txtTitle = TextStyle(
      fontSize: Dimen.txt_18,
      fontWeight: FontWeight.w500,
      color: ColorPalette.kBlack
  );

  static const TextStyle txtSubtitle = TextStyle(
      fontSize: Dimen.txt_16,
      fontWeight: FontWeight.w500,
      color: ColorPalette.kBlack
  );

  static const TextStyle txtContent = TextStyle(
    fontSize: Dimen.txt_15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.kBlack
  );

  static const TextStyle txtContentHint = TextStyle(
    fontSize: Dimen.txt_15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.kGrey
  );

  static const TextStyle txtButton = TextStyle(
    fontSize: Dimen.txt_15,
    fontWeight: FontWeight.w500,
    color: ColorPalette.kBlack
  );

  static const TextStyle txtStatus = TextStyle(
    fontSize: Dimen.txt_14_5,
    fontWeight: FontWeight.w500,
    color: ColorPalette.kBlack
  );

  static const TextStyle tfStyle =
      TextStyle(color: ColorPalette.kBlackCoralColor);

  static const TextStyle tfLabelStyle =
      TextStyle(color: ColorPalette.kBlackCoralColor);

  // Text Clickable
  static const TextStyle textHyperlink =
      TextStyle(color: ColorPalette.kPrimaryColor, fontSize: 14);

  // authentication
  static const TextStyle authTitle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: ColorPalette.kPrimaryColor);

  static const TextStyle authSignWith =
  TextStyle(fontSize: 13, color: ColorPalette.kSoftGreyColor);

  static const TextStyle authTextNormal =
  TextStyle(fontSize: 13, color: ColorPalette.kSoftGreyColor);

  // Border
  static const UnderlineInputBorder tfFocusedBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: ColorPalette.kPrimaryColor, width: 2.0));

  static const UnderlineInputBorder tfEnabledBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFCCCCCC)));

  // Icon
  static const Icon icBack =
      Icon(Icons.arrow_back, size: 16, color: ColorPalette.kPrimaryColor);

  // Other
  static const InputBorder defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Dimen.radius_8)),
      borderSide: BorderSide(color: ColorPalette.kGrey, width: .5));

  static const InputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Dimen.radius_8)),
      borderSide: BorderSide(color: ColorPalette.kRed, width: .5));
}
