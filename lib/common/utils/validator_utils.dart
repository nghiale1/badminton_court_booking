import 'package:phone_number/phone_number.dart';

class ValidatorUtil {
  static bool emailValidate(String email) {
    return !RegExp("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+").hasMatch(email);
  }

  static bool passwordValidate(String password) {
    return password.length < 8;
  }

  static Future<bool> phoneValidate(String phone, String regionCode) async {
    try {
      String phoneFieldSimple = "$regionCode$phone";
      PhoneNumber phoneNumber = await PhoneNumberUtil().parse(phoneFieldSimple);
      bool isValid = await PhoneNumberUtil().validate(phoneNumber.e164, regionCode: phoneNumber.regionCode);
      return isValid;
    } catch (e) {
      return false;
    }
  }
}