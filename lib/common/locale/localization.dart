import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:badminton_court_booking/common/constant/constant.dart';

class Localization {

  final _logger = FimberLog("Localization");
  
  Localization(this.locale);
  
  final Locale locale;

  static Localization? of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }
  
  late Map<String, String> localizedValues;
  
  Future<void> load() async {
    _logger.d("load ${locale.languageCode}");
    String jsonStringValues = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }
  
  String? translate(String key) {
    // _logger.d("translate $key}");
    return localizedValues[key];
  }
  
  static const LocalizationsDelegate<Localization> delegate = _LocalizationDelegate();
}

class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  
  const _LocalizationDelegate();
  
  @override
  bool isSupported(Locale locale) {
    return Constant.kSupportLanguages.contains(locale);
  }
  
  @override
  Future<Localization> load(Locale locale) async {
    Localization localization = Localization(locale);
    await localization.load();
    return localization;
  }
  
  @override
  bool shouldReload(covariant LocalizationsDelegate<Localization> old) => false;
}