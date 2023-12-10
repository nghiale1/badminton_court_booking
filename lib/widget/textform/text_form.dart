import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/style/global_style.dart';

class TextFormWidget {

  Widget createTextForm({
    required TextEditingController controller,
    required TextInputType inputType,
    required String labelText,
    required String? errorText,
    required ValueChanged<String>? onChanged}) {

    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      style: GlobalStyle.tfStyle,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: GlobalStyle.tfFocusedBorder,
        enabledBorder: GlobalStyle.tfEnabledBorder,
        labelText: labelText,
        labelStyle: GlobalStyle.tfLabelStyle,
        errorText: errorText,
      ),
    );
  }

}
