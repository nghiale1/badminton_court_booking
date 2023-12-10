import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';

class TitleTextWidget extends Text {

  final String text;

  const TitleTextWidget(
      this.text, {
        Key? key,
        TextStyle? style,
      }) : super(
    text,
    key: key,
    style: style ?? GlobalStyle.txtTitle,
  );

  factory TitleTextWidget.blue(String text, {Key? key}) {
    return TitleTextWidget(
      text,
      key: key,
      style: GlobalStyle.txtTitle.copyWith(color: ColorPalette.kBlue)
    );
  }

  factory TitleTextWidget.other(String text, {Key? key}) {
    return TitleTextWidget(
      text,
      key: key,
      style: GlobalStyle.txtTitle.copyWith(fontSize: Dimen.txt_28)
    );
  }
}