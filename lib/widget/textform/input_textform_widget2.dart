import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';

class InputTextFormWidget2 extends StatefulWidget {
  const InputTextFormWidget2({
    Key? key,
    this.labelText,
    this.validator,
    this.suggestions,
    this.onChangeController,
  }) : super(key: key);

  final String? labelText;
  final String? Function(String?)? validator;
  final Function(TextEditingController)? onChangeController;
  final List<String>? suggestions;

  @override
  State<InputTextFormWidget2> createState() => _InputTextFormWidgetState();
}

class _InputTextFormWidgetState extends State<InputTextFormWidget2> {
  String? errorText;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTextChanged(String? value) {
    setState(() {
      errorText = widget.validator?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return (widget.suggestions ?? []).where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (selection) {
        _onTextChanged(selection);
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {

        widget.onChangeController?.call(fieldTextEditingController);

        return TextFormField(
          validator: widget.validator ?? (value) => null,
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
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
      },
      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.3,),
              child: SingleChildScrollView(
                child: Column(
                  children: options
                      .map((String option) => ListTile(
                    title: Text(option),
                    onTap: () {
                      onSelected(option);
                    },
                  )).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}