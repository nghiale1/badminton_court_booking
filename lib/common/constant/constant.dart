import 'dart:ui';

class Constant {
  static const String kAppName = "Mental Health";

  static const kLocalImagePath = 'assets/image/';
  static const kLocalIconPath = 'assets/icon/';
  static const kLocalAnimPath = 'assets/anim/';
  static const kAvatarDefault = 'assets/icon/user.png';
  static const kImageLoadingDefault = '';
  static const kSupportLanguages = [
    Locale('vi', 'VN'),
    Locale('en', 'US')
  ];

  static const kDefaultLocale = Locale('vi', 'VN');
  static const kIsDarkMode = false; // default

  static const  FORMAT_TIME = "HH:mm:ss"; // 8
  static const  FORMAT_TIME_ZERO_SEC = "HH:mm:00"; // 8
  static const  FORMAT_TIME_UI = "HH:mm"; // 5
  static const  TIMESTAMP_PATTERN_5 = "yyyy-MM-dd"; // 10
  static const  TIMESTAMP_PATTERN_7 = "dd.MM.yyyy"; // 10
  static const  TIMESTAMP_PATTERN_8 = "dd/MM/yy"; // 8
  static const  TIMESTAMP_PATTERN_9 = "dd/MM"; // 5
  static const  TIMESTAMP_PATTERN_10 = "dd/MM/yyyy"; // 10
  static const  TIMESTAMP_PATTERN_11 = "HH:mm - dd/MM/yyyy";
  static const  TIMESTAMP_PATTERN_2 = "dd-MM-yyyy"; // 10
  static const  TIME_ZERO = "00:00"; // 8

  static const  TIMESTAMP_PATTERN_3 = "HH:mm dd-MM-yyyy"; //16
  static const  TIMESTAMP_PATTERN_12 = "dd/MM/yyyy - HH:mm";
  static const  TIMESTAMP_PATTERN_13 = "HH:mm dd.MM.yyyy";
  static const  TIMESTAMP_PATTERN_14 = "HH:mm - dd.MM.yyyy";
  static const  TIMESTAMP_PATTERN_15 = "HH:mm dd/MM/yyyy";
  static const  TIMESTAMP_PATTERN_18 = "HH:mm dd/MM";

  static const  TIMESTAMP_PATTERN_ISO_8601 = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'";

  static const  TIMESTAMP_PATTERN = "yyyy-MM-dd'T'HH:mm"; // 18
  static const  TIMESTAMP_PATTERN_6 = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"; // RFC3339
  static const  TIMESTAMP_PATTERN_4 = "yyyy-MM-dd'T'HH:mm:ssXXX"; // 2021-04-28T15:00:00+07:00

}

class Matching {
  static const kLike = 1;
  static const kDislike = 0;
}

class PrefKey {
  static const kLanguageCode = 'languageCode';
  static const kTheme = 'theme';
  static const kUser = 'user';
  static const kMailSuggest = 'mailSuggest';
  static const kPhoneSuggest = 'phoneSuggest';
}

class DioInstanceName {
  static const kApiHost = 'apiHost';
  static const kNewsHost = 'newsHost';
}

class IconSchedule {
  static const smiling = "assets/icon/emotion/smiling.png";
  static const crying = "assets/icon/emotion/crying.png";
  static const neutral = "assets/icon/emotion/neutral.png";
  static const angry = "assets/icon/emotion/angry.png";
  static const confused = "assets/icon/emotion/confused.png";
}


