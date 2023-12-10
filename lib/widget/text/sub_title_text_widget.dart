import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';

abstract class _SubTitleTextWidget extends Text {

  final String text;

  const _SubTitleTextWidget(
      this.text, {
        Key? key,
        TextStyle? style,
      }) : super(
    text,
    key: key,
    style: style,
  );
}

class SubTitleTextWidget1 extends _SubTitleTextWidget {

  const SubTitleTextWidget1(String text, {Key? key, TextStyle? style}) : super(
      text,
      key: key,
      style: style ?? GlobalStyle.txtSubtitle
  );

  factory SubTitleTextWidget1.b400(String text, {Key? key}) {
    return SubTitleTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtSubtitle.copyWith(fontWeight: FontWeight.w400)
    );
  }

  factory SubTitleTextWidget1.b400Grey(String text, {Key? key}) {
    return SubTitleTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtSubtitle.copyWith(fontWeight: FontWeight.w400, color: ColorPalette.kGrey)
    );
  }
}

class SubTitleTextWidget2 extends _SubTitleTextWidget {

  SubTitleTextWidget2(String text, {Key? key, TextStyle? style}) : super(
      text,
      key: key,
      style: (style ?? GlobalStyle.txtSubtitle).copyWith(fontSize: Dimen.txt_15)
  );

  factory SubTitleTextWidget2.darkBlue(String text, {Key? key}) {
    return SubTitleTextWidget2(
        text,
        key: key,
        style: GlobalStyle.txtSubtitle.copyWith(color: ColorPalette.kDarkBlue)
    );
  }

  factory SubTitleTextWidget2.lightBlue(String text, {Key? key}) {
    return SubTitleTextWidget2(
        text,
        key: key,
        style: GlobalStyle.txtSubtitle.copyWith(color: ColorPalette.kLightBlue)
    );
  }

  factory SubTitleTextWidget2.red(String text, {Key? key}) {
    return SubTitleTextWidget2(
        text,
        key: key,
        style: GlobalStyle.txtSubtitle.copyWith(color: ColorPalette.kRed)
    );
  }

  factory SubTitleTextWidget2.b400(String text, {Key? key}) {
    return SubTitleTextWidget2(
        text,
        key: key,
        style: GlobalStyle.txtSubtitle.copyWith(fontWeight: FontWeight.w400)
    );
  }

  factory SubTitleTextWidget2.b400Grey(String text, {Key? key}) {
    return SubTitleTextWidget2(
        text,
        key: key,
        style: GlobalStyle.txtSubtitle.copyWith(fontWeight: FontWeight.w400, color: ColorPalette.kDarkGrey)
    );
  }

  factory SubTitleTextWidget2.b400LightBlue(String text, {Key? key}) {
    return SubTitleTextWidget2(
        text,
        key: key,
        style: GlobalStyle.txtSubtitle.copyWith(fontWeight: FontWeight.w400, color: ColorPalette.kLightBlue)
    );
  }
}