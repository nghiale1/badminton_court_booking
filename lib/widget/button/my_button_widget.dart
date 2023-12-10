
import 'package:flutter/cupertino.dart';
import 'package:badminton_court_booking/widget/button/button_widget.dart';

class MyButtonWidget {
  late ButtonWidget _buttonWidget;

  MyButtonWidget() {
    _buttonWidget = ButtonWidget();
  }

  Widget createButton(
      {required String labelText, required VoidCallback? onPressed}) {
    return _buttonWidget.createButton(
        labelText: labelText, onPressed: onPressed);
  }

  Widget createSquareIconButton(
      {required String iconPath, required Function onTap}) {
    return _buttonWidget.createSquareIconButton(
        iconPath: iconPath, onTap: onTap);
  }
}
