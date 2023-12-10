import 'package:flutter/cupertino.dart';
import 'package:badminton_court_booking/common/common.dart';

class _ButtonTextWidget extends Text {

  final String text;

  const _ButtonTextWidget(
      this.text, {
        Key? key,
        TextStyle? style,
      }) : super(
    text,
    key: key,
    style: style,
  );
}

class ButtonTextWidget1 extends _ButtonTextWidget {

  const ButtonTextWidget1(String text, {Key? key, TextStyle? style}) : super(
      text,
      key: key,
      style: style ?? GlobalStyle.txtButton
  );

  factory ButtonTextWidget1.red(String text, {Key? key}) {
    return ButtonTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtButton.copyWith(color: ColorPalette.kRed)
    );
  }

  factory ButtonTextWidget1.grey(String text, {Key? key}) {
    return ButtonTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtButton.copyWith(color: ColorPalette.kGrey)
    );
  }

  factory ButtonTextWidget1.lightBlue(String text, {Key? key}) {
    return ButtonTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtButton.copyWith(color: ColorPalette.kLightBlue)
    );
  }

  factory ButtonTextWidget1.white(String text, {Key? key}) {
    return ButtonTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtButton.copyWith(color: ColorPalette.kWhite)
    );
  }
}

class ButtonTextWidget2 extends _ButtonTextWidget {

  ButtonTextWidget2(String text, {Key? key, TextStyle? style}) : super(
      text,
      key: key,
      style: (style ?? GlobalStyle.txtButton).copyWith(fontWeight: FontWeight.w400)
  );

  factory ButtonTextWidget2.white(String text, {Key? key}) {
    return ButtonTextWidget2(
        text,
        key: key,
        style: GlobalStyle.txtButton.copyWith(color: ColorPalette.kWhite)
    );
  }
}