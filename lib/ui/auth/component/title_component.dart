import 'package:flutter/cupertino.dart';
import 'package:badminton_court_booking/widget/text/sub_title_text_widget.dart';
import 'package:badminton_court_booking/widget/text/title_text_widget.dart';

class TitleComponent extends StatelessWidget {

  const TitleComponent({Key? key, this.title, this.content}) : super(key: key);

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: TitleTextWidget.other(title ?? ""),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: double.infinity,
          child: SubTitleTextWidget1.b400Grey(
            content ?? "",
          ),
        ),
      ],
    );
  }
}