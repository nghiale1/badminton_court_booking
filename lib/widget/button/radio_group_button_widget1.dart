import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';
import '../widget.dart';

class RadioGroupButtonWidget1 extends StatefulWidget {
  final String? txtNegative;
  final String? txtPositive;
  final Function(int)? onIndexChanged;

  const RadioGroupButtonWidget1({Key? key, this.txtNegative, this.txtPositive, this.onIndexChanged}) : super(key: key);

  @override
  State createState() => _RadioGroupButtonWidget1State();
}

class _RadioGroupButtonWidget1State extends State<RadioGroupButtonWidget1> {
  late String txtNegative;
  late String txtPositive;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    txtNegative = widget.txtNegative ?? "";
    txtPositive = widget.txtPositive ?? "";
  }

  void _handleIndexSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (widget.onIndexChanged != null) {
      widget.onIndexChanged!(_selectedIndex);
    }
  }

  Widget _buildRadioButton(String text, int index) {
    final isSelected = index == _selectedIndex;

    return Expanded(
      child: OutlinedButton(
        onPressed: () => _handleIndexSelected(index),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.radius_8)),
          side: BorderSide.none,
          backgroundColor: isSelected ? ColorPalette.kWhite : ColorPalette.kLightGrey,
        ),
        child: Center(
          child: isSelected ? ContentTextWidget1.b500(text) : ContentTextWidget1.b500Grey(text),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimen.radius_8),
      child: Container(
        padding: const EdgeInsets.only(left: 6.5, right: 6.5),
        color: ColorPalette.kLightGrey,
        child: Row(
          children: [
            _buildRadioButton(txtNegative, 0),
            _buildRadioButton(txtPositive, 1),
          ],
        ),
      ),
    );
  }
}