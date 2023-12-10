import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';

import '../../common/style/dimen.dart';
import '../text/button_text_widget.dart';

class NegativeButtonWidget extends StatefulWidget {

  final String text;
  final VoidCallback? onPressed;
  final double? width;

  const NegativeButtonWidget({Key? key, this.width, required this.text, this.onPressed}) : super(key: key);

  @override
  State<NegativeButtonWidget> createState() => _NegativeButtonWidgetState();
}

class _NegativeButtonWidgetState extends State<NegativeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: widget.width ?? MediaQuery.of(context).size.width,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(ColorPalette.kWhite),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimen.radius_6),
                side: const BorderSide(color: ColorPalette.kRed), // Set border color here
              ),
            ),
            elevation: MaterialStateProperty.all<double>(0),
          ),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: ButtonTextWidget1.red(widget.text)
          ),
        )
    );
  }
}
