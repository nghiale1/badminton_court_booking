import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';

class InputTextFormWidget extends StatefulWidget {

  const InputTextFormWidget({
    super.key,
    this.labelText,
    this.textEditingController,
    this.validator
  });

  final String? labelText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;

  @override
  State<InputTextFormWidget> createState() => _InputTextFormWidgetState();
}

class _InputTextFormWidgetState extends State<InputTextFormWidget> {
  String? errorText;
  TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.textEditingController;
  }

  @override
  void dispose() {
    _textEditingController?.text = "";
    super.dispose();
  }

  void _onTextChanged(String? value) {
    setState(() {
      errorText = widget.validator?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator ?? (value) => null,
      controller: _textEditingController,
      style: GlobalStyle.txtContent,
      onChanged: _onTextChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        labelStyle: GlobalStyle.txtContentHint,
        labelText: widget.labelText ?? "",
        floatingLabelStyle: GlobalStyle.txtContentHint,
        errorText: errorText,
        border: GlobalStyle.defaultBorder,
        enabledBorder: GlobalStyle.defaultBorder,
        focusedBorder: GlobalStyle.defaultBorder,
        errorBorder: GlobalStyle.errorBorder
      ),
    );
  }
}