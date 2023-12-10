import 'package:flutter/material.dart';

import '../../common/style/color_palette.dart';
import '../text/content_text_widget.dart';

void showError(BuildContext context, String error) {
  // call ScaffoldMessenger to show the bottom sheet
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: ContentTextWidget1(error), backgroundColor: ColorPalette.kWhite,),
  );
}