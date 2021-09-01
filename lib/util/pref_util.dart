import 'dart:convert';

import 'package:flutter_shopping_app/data/model/user/user_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefUtil {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  static const String _USER_IDENTIFIER = "tokens_";

  static final Map<AUTH_STORE, dynamic> _authStore = <AUTH_STORE, dynamic>{
    AUTH_STORE.isLoggedIn: false
  };

  static Map<AUTH_STORE, dynamic> getAuthStore() {
    return _authStore;
  }

//check if the user is logged in or not
  static bool isUserLoggedIn() {
    return _authStore[AUTH_STORE.isLoggedIn];
  }

  static UserAuth getUserAuthData() {
    return _authStore[AUTH_STORE.userAuth];
  }

  static int getUserId() {
    return getUserAuthData()?.id;
  }

  static String getUserName() {
    return getUserAuthData()?.username;
  }

  static Future<void> loadUserAuthData() async {
    final _userString = (await _prefs).get(_USER_IDENTIFIER);

    if (_userString != null) {
      final _userJson = json.decode(_userString);
      updateUserSetting(
          userAuth: UserAuth.fromJson(_userJson), isLoggedIn: true);
    }
  }

  static Future<bool> storeUserAuthData(UserAuth auth) async {
    updateUserSetting(userAuth: auth, isLoggedIn: true);
    return (await _prefs)
        .setString(_USER_IDENTIFIER, jsonEncode(auth.toJson()));
  }

  static clearUserToken() async {
    updateUserSetting(clear: true);
    return (await _prefs).remove(_USER_IDENTIFIER);
  }

  static void updateUserSetting(
      {UserAuth userAuth, bool isLoggedIn, bool clear: false}) {
    if (userAuth != null || clear) {
      _authStore[AUTH_STORE.userAuth] = userAuth;
    }

    if (isLoggedIn != null || clear) {
      _authStore[AUTH_STORE.isLoggedIn] = isLoggedIn ?? false;
    }
  }
}

enum AUTH_STORE { isLoggedIn, userAuth }
