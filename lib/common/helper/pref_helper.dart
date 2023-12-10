import 'dart:convert';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:badminton_court_booking/common/common.dart';

import '../../model/user.dart';
import '../constant/constant.dart' as AppConstant;
import 'package:shared_preferences/shared_preferences.dart';
class PrefHelper {
  // Locale
  setLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.PrefKey.kLanguageCode, languageCode);
  }

  Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(AppConstant.PrefKey.kLanguageCode) ?? "";
    return _locale(languageCode) ?? Constant.kDefaultLocale;
  }

  Locale? _locale(String languageCode) {
    return Constant.kSupportLanguages
        .firstWhereOrNull((e) => e.languageCode == languageCode);
  }

  // Theme
  setTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppConstant.PrefKey.kTheme, isDarkMode);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstant.PrefKey.kTheme) ?? Constant.kIsDarkMode;
  }

  // User
  setUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.PrefKey.kUser, jsonEncode(user.toJson()));
  }

  Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(AppConstant.PrefKey.kUser);
    if (data == null || data.isEmpty) {
      return User(); // return default object
    } else {
      try {
        return User.fromJson(jsonDecode(data));
      } catch (e) {
        // Handle JSON decoding error
        print("JSON decoding getUser error: $e");
        return User(); // Return a default User object on error
      }
    }
  }

  // suggest mail
  setMailSuggest(List<String> mails) async {
    final prefs = await SharedPreferences.getInstance();
    var mailSet = mails.toSet().toList(); // remove duplicates
    if (mailSet.length > 30) {
      mailSet = mailSet.sublist(mailSet.length - 30);
    }
    await prefs.setStringList(AppConstant.PrefKey.kMailSuggest, mailSet);
  }

  Future<List<String>> getMailSuggest() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getStringList(AppConstant.PrefKey.kMailSuggest);
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data;
    }
  }

  // suggest phone
  setPhoneSuggest(List<String> phones) async {
    final prefs = await SharedPreferences.getInstance();
    var phoneSet = phones.toSet().toList(); // remove duplicates
    if (phoneSet.length > 30) {
      phoneSet = phoneSet.sublist(phoneSet.length - 30); // limit size to 50
    }
    await prefs.setStringList(AppConstant.PrefKey.kPhoneSuggest, phoneSet);
  }

  Future<List<String>> getPhoneSuggest() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getStringList(AppConstant.PrefKey.kPhoneSuggest);
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data;
    }
  }
}
