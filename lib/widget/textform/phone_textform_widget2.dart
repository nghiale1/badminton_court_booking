import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/constant/country.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';
import '../../common/style/global_style.dart';
import '../../common/utils/validator_utils.dart';
import '../text/content_text_widget.dart';
import '../../common/common.dart';

class PhoneTextFormWidget2 extends StatefulWidget {
  const PhoneTextFormWidget2({
    Key? key,
    this.labelText,
    this.validator,
    this.errorText = "",
    this.suggestions,
    this.onChangeController,
  }) : super(key: key);

  final String? labelText;
  final Function(bool?, String?)? validator;
  final String? errorText;
  final Function(TextEditingController)? onChangeController;
  final List<String>? suggestions;

  @override
  State<StatefulWidget> createState() => _PhoneTextFormWidgetState();
}

class _PhoneTextFormWidgetState extends State<PhoneTextFormWidget2> {
  late final ValueNotifier<String> _selectedCountryCode;
  late final List<Country> _countryList;
  String? errorText;
  String valueText = "";

  @override
  void initState() {
    super.initState();
    _selectedCountryCode = ValueNotifier("+84 (VN)");
    _countryList = countries.toList();
    _selectedCountryCode.addListener(() {
      validate(valueText);
    });
  }

  @override
  void dispose() {
    _selectedCountryCode.dispose();
    super.dispose();
  }

  void validate(String value) async {
    bool isValid = await ValidatorUtil.phoneValidate(value, _selectedCountryCode.value.split(" ")[0]);
    if (isValid == true) {
      setState(() {
        errorText = null;
      });
    }
    else {
      setState(() {
        errorText = widget.errorText ?? "";
      });
    }
    widget.validator?.call(isValid, _selectedCountryCode.value.split(" ")[0]);
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
        validate(selection);
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {

        widget.onChangeController?.call(fieldTextEditingController);
        valueText = fieldTextEditingController.text;

        return TextFormField(
          focusNode: fieldFocusNode,
          controller: fieldTextEditingController,
          keyboardType: TextInputType.number,
          onChanged: validate,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            labelStyle: GlobalStyle.txtContentHint,
            labelText: widget.labelText ?? "",
            floatingLabelStyle: GlobalStyle.txtContentHint,
            prefixIcon: FractionallySizedBox(
              widthFactor: .25,
              child: _CountryPopupMenu(
                selectedCountryCode: _selectedCountryCode,
                countryList: _countryList,
              ),
            ),
            errorText: errorText,
            alignLabelWithHint: true,
            border: GlobalStyle.defaultBorder,
            focusedBorder: GlobalStyle.defaultBorder,
            errorBorder: GlobalStyle.errorBorder,
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

class _CountryPopupMenu extends StatelessWidget {
  const _CountryPopupMenu({
    Key? key,
    required this.selectedCountryCode,
    required this.countryList,
  }) : super(key: key);

  final ValueNotifier<String> selectedCountryCode;
  final List<Country> countryList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(width: .7, color: ColorPalette.kGrey),
        ),
      ),
      margin: const EdgeInsets.only(right: 8),
      child: ValueListenableBuilder<String>(
        valueListenable: selectedCountryCode,
        builder: (context, value, child) {
          return PopupMenuButton<String>(
            icon: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContentTextWidget1(value.substring(0, value.indexOf(" "))),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
            itemBuilder: (context) => countryList.map((country) {
              return PopupMenuItem<String>(
                value: country.fullCountryCode,
                child: Center(child: ContentTextWidget1(country.fullCountryCode)),
              );
            }).toList(),
            onSelected: (value) {
              selectedCountryCode.value = value;
            },
          );
        },
      ),
    );
  }
}