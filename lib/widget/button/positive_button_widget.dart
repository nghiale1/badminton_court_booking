import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';
import 'package:badminton_court_booking/widget/text/button_text_widget.dart';

class PositiveButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool? isEnable;
  final double? width;

  const PositiveButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
    this.isEnable,
    this.width,
  }) : super(key: key);

  @override
  State<PositiveButtonWidget> createState() => _PositiveButtonWidgetState();
}

class _PositiveButtonWidgetState extends State<PositiveButtonWidget> {
  Color _buttonColor = ColorPalette.kDandelion;

  @override
  void initState() {
    super.initState();
    _updateButtonColor();
  }

  @override
  void didUpdateWidget(PositiveButtonWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateButtonColor();
  }

  void _updateButtonColor() {
    setState(() {
      _buttonColor = (widget.isEnable ?? false) ? ColorPalette.kDandelion : ColorPalette.kLightGrey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: widget.width ?? MediaQuery.of(context).size.width,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: _buttonColor,
            shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimen.radius_6),
            ),
            elevation: 0
        ),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: ButtonTextWidget1(widget.text)
        ),
      )
    );
  }
}