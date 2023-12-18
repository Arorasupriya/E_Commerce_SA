import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  late SharedPreferences sharedPref;
  static const String USER_TOKEN = "token";
  setSharedPrefValue({required String strToken}) async {
    sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(USER_TOKEN, strToken);
    print("Class sharedPreference set function call ==> $strToken");
  }

  Future<String> getSharedPreferenceValue() async {
    sharedPref = await SharedPreferences.getInstance();
    String? strUserToken = sharedPref.get(USER_TOKEN).toString();
    print("Class sharedPreference get function call ==> $strUserToken");
    return strUserToken;
  }
}
