import 'package:flutter/cupertino.dart';
import 'package:badminton_court_booking/common/style/color_palette.dart';
import '../../common/style/global_style.dart';

abstract class _ContentTextWidget extends Text {

  final String text;

  const _ContentTextWidget(
      this.text, {
        Key? key,
        TextStyle? style,
      }) : super(
    text,
    key: key,
    style: style
  );
}

class ContentTextWidget1 extends _ContentTextWidget {

  const ContentTextWidget1(String text, {Key? key, TextStyle? style}) : super(
      text,
      key: key,
      style: style ?? GlobalStyle.txtContent
  );

  factory ContentTextWidget1.b500(String text, {Key? key}) {
    return ContentTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtContent.copyWith(fontWeight: FontWeight.w500)
    );
  }

  factory ContentTextWidget1.b500Grey(String text, {Key? key}) {
    return ContentTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtContent.copyWith(fontWeight: FontWeight.w500, color: ColorPalette.kGrey)
    );
  }

  factory ContentTextWidget1.red(String text, {Key? key}) {
    return ContentTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtContent.copyWith(color: ColorPalette.kRed)
    );
  }

  factory ContentTextWidget1.lightBlue(String text, {Key? key}) {
    return ContentTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtContent.copyWith(color: ColorPalette.kLightBlue)
    );
  }

  factory ContentTextWidget1.italic(String text, {Key? key}) {
    return ContentTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtContent.copyWith(fontStyle: FontStyle.italic)
    );
  }

  factory ContentTextWidget1.italicGreen(String text, {Key? key}) {
    return ContentTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtContent.copyWith(fontStyle: FontStyle.italic, color: ColorPalette.kGreen)
    );
  }

  factory ContentTextWidget1.italicRed(String text, {Key? key}) {
    return ContentTextWidget1(
        text,
        key: key,
        style: GlobalStyle.txtContent.copyWith(fontStyle: FontStyle.italic, color: ColorPalette.kRed)
    );
  }
}