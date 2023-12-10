import 'package:flutter/cupertino.dart';
import 'package:badminton_court_booking/common/common.dart';

class _StatusTextWidget extends Text {

  final String text;

  const _StatusTextWidget(
      this.text, {
        Key? key,
        TextStyle? style,
      }) : super(
    text,
    key: key,
    style: style,
  );
}

class StatusTextWidget1 extends _StatusTextWidget {

  const StatusTextWidget1(String text, {Key? key, TextStyle? style}) : super(
      text,
      key: key,
      style: style ?? GlobalStyle.txtStatus
  );

  factory StatusTextWidget1.grey(String text, {Key? key}) {
    return StatusTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtStatus.copyWith(color: ColorPalette.kGrey)
    );
  }

  factory StatusTextWidget1.yellow(String text, {Key? key}) {
    return StatusTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtStatus.copyWith(color: ColorPalette.kYellow)
    );
  }

  factory StatusTextWidget1.green(String text, {Key? key}) {
    return StatusTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtStatus.copyWith(color: ColorPalette.kGreen)
    );
  }

  factory StatusTextWidget1.red(String text, {Key? key}) {
    return StatusTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtStatus.copyWith(color: ColorPalette.kRed)
    );
  }

  factory StatusTextWidget1.darkBlue(String text, {Key? key}) {
    return StatusTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtStatus.copyWith(color: ColorPalette.kDarkBlue)
    );
  }
}