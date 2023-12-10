import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../button/negative_button_widget.dart';
import '../button/positive_button_widget.dart';
import '../text/content_text_widget.dart';

class MainDialog extends StatefulWidget {
  final String? title;
  final String? content;
  final String? positiveText;
  final String? negativeText;
  final VoidCallback? positiveOnPressed;
  final VoidCallback? negativeOnPressed;

  const MainDialog({Key? key, this.title, this.content, this.positiveText, this.negativeText, this.positiveOnPressed, this.negativeOnPressed}) : super(key: key);

  @override
  State<MainDialog> createState() => _MainDialogState();
}

class _MainDialogState extends State<MainDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: ContentTextWidget1.b500(widget.title ?? "")),
      content: ContentTextWidget1(widget.content ?? ""),
      actions: [
        NegativeButtonWidget(
          width: MediaQuery.of(context).size.width * 0.3,
          text: widget.negativeText ?? "",
          onPressed: widget.negativeOnPressed,
        ),
        PositiveButtonWidget(
          width: MediaQuery.of(context).size.width * 0.4,
          text: widget.positiveText ?? "",
          isEnable: true,
          onPressed: widget.positiveOnPressed,
        ),
      ],
    );
  }
}
