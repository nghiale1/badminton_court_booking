import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/constant/country.dart';
import 'package:badminton_court_booking/common/utils/validator_utils.dart';
import 'package:badminton_court_booking/common/style/global_style.dart';
import '../text/text.dart';
import '../../common/common.dart';
class PhoneTextFormWidget extends StatefulWidget {
  const PhoneTextFormWidget({
    Key? key,
    this.labelText,
    this.textEditingController,
    this.validator,
    this.errorText = "",
  }) : super(key: key);

  final String? labelText;
  final TextEditingController? textEditingController;
  final Function(bool?, String?)? validator;
  final String? errorText;

  @override
  State<StatefulWidget> createState() => _PhoneTextFormWidgetState();
}

class _PhoneTextFormWidgetState extends State<PhoneTextFormWidget> {
  late final TextEditingController _textEditingController;
  late final ValueNotifier<String> _selectedCountryCode;
  late final List<Country> _countryList;
  String? errorText;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.textEditingController ?? TextEditingController();
    _selectedCountryCode = ValueNotifier("+84 (VN)");
    _countryList = countries.toList();
    _selectedCountryCode.addListener(() {
      validate();
    });
  }

  @override
  void dispose() {
    _selectedCountryCode.dispose();
    _textEditingController.text = "";
    super.dispose();
  }

  void validate() async {
    bool isValid = await ValidatorUtil.phoneValidate(_textEditingController.text, _selectedCountryCode.value.split(" ")[0]);
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
    return TextFormField(
      controller: _textEditingController,
      keyboardType: TextInputType.number,
      onChanged: (value) async {
        validate();
      },
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