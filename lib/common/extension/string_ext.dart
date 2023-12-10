import 'package:flutter/cupertino.dart';

import '../../service/navigation_service.dart';
import '../locale/localization.dart';

extension StringExt on String? {
  String _translate(BuildContext context) {
    if (this != null) {
      return Localization.of(context)?.translate(this!) ?? '';
    } else {
      return '';
    }
  }

  String translate() {
    var context = NavigationService.navigatorKey.currentContext;
    if (context != null) {
      return _translate(context);
    } else {
      return '';
    }
  }

  bool get isNullOrEmpty => this == null || this!.isEmpty;
}