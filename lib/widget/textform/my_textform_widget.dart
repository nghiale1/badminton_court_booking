import 'package:flutter/material.dart';
import 'package:badminton_court_booking/widget/textform/text_form.dart';

class MyTextFormWidget {
  late TextFormWidget _textFormWidget;

  MyTextFormWidget() {
    _textFormWidget = TextFormWidget();
  }

  // Text widget
  Widget createTextForm(
      {required TextEditingController controller,
        required TextInputType inputType,
        required String labelText,
        required String? errorText,
        required ValueChanged<String>? onChanged}) {
    return _textFormWidget.createTextForm(
        controller: controller,
        labelText: labelText,
        errorText: errorText,
        inputType: inputType,
        onChanged: onChanged);
  }
}
