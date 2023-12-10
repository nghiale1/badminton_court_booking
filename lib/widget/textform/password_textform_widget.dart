import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';

class PasswordTextFormWidget extends StatefulWidget {
  const PasswordTextFormWidget({
    Key? key,
    this.labelText,
    this.textEditingController,
    this.validator,
  }) : super(key: key);

  final String? labelText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;

  @override
  State<PasswordTextFormWidget> createState() =>
      _PasswordTextFormWidgetState();
}

class _PasswordTextFormWidgetState extends State<PasswordTextFormWidget> {
  bool _passwordVisible = false;
  String? errorText;

  Widget _buildSuffixIcon() {
    return IconButton(
      icon: Icon(
        _passwordVisible ? Icons.visibility : Icons.visibility_off,
        color: ColorPalette.kGrey,
      ),
      onPressed: () {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
    );
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
      controller: widget.textEditingController,
      style: GlobalStyle.txtContent,
      obscureText: !_passwordVisible,
      onChanged: _onTextChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        labelStyle: GlobalStyle.txtContentHint,
        labelText: widget.labelText ?? "",
        floatingLabelStyle: GlobalStyle.txtContentHint,
        suffixIcon: _buildSuffixIcon(),
        errorText: errorText,
        border: GlobalStyle.defaultBorder,
        enabledBorder: GlobalStyle.defaultBorder,
        focusedBorder: GlobalStyle.defaultBorder,
        errorBorder: GlobalStyle.errorBorder,
      ),
    );
  }
}