import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  HelperFunction._();

  static final HelperFunction instance = HelperFunction._();

  SharedPreferences? prefs;

  // Constant values
  final String isLoggedInKey = 'ISLOGGEDIN';
  final String userIdKey = 'USERID';
  final String usernameKey = 'USERNAME';
  final String phoneNumberKey = 'PHONENUMBER';
  final String profileImageKey = 'PROFILEIMAGE';
  final String usnKey = 'USN';
  final String userEmailKey = 'USEREMAILKEY';
  final String isFirstTime = 'ISFIRSTTIME';
  final String collegeBusIdKey = 'COLLEGEBUSIDKEY';

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void saveIsFirstTime(bool isFirstTimeValue) async {
    await prefs?.setBool(isFirstTime, isFirstTimeValue);
  }

  void saveLoggedIn(bool isLoggedIn) async {
    await prefs?.setBool(isLoggedInKey, isLoggedIn);
  }

  void saveUserId(String userId) async {
    await prefs?.setString(userIdKey, userId);
  }

  void saveCollegeBusId(String collegeBusId) async {
    await prefs?.setString(collegeBusIdKey, collegeBusId);
  }

  void saveUserName(String name) async {
    await prefs?.setString(usernameKey, name);
  }

  void saveEmail(String email) async {
    await prefs?.setString(userEmailKey, email);
  }

  void savePhoneNumber(String phoneNumber) async {
    await prefs?.setString(phoneNumberKey, phoneNumber);
  }

  bool getIsLoggedIn() {
    return prefs?.getBool(isLoggedInKey) ?? false;
  }

  String getUserId() {
    return prefs?.getString(userIdKey) ?? '';
  }

  bool getIsFirstTime() {
    return prefs?.getBool(isFirstTime) ?? true;
  }

  String getUserName() {
    return prefs?.getString(usernameKey) ?? '';
  }

  String getUserEmail() {
    return prefs?.getString(userEmailKey) ?? '';
  }

  String getPhoneNumber() {
    return prefs?.getString(phoneNumberKey) ?? '';
  }

  String getCollegeBusId() {
    return prefs?.getString(collegeBusIdKey) ?? '';
  }

  void invalidaate() async {
    saveLoggedIn(false);
    saveUserId('');
    saveUserName('');
    savePhoneNumber('');
    saveEmail('');
    saveCollegeBusId('');
  }
}
