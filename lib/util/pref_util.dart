import 'dart:convert';
import 'package:flutter_shopping_app/data/models/user/user_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AUTH_STORE { isLoggedIn, userAuth }

abstract class PrefUtil {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();

  static const String USER_IDENTIFIER = "tokens_";

  static final Map<AUTH_STORE, dynamic> authStore = <AUTH_STORE, dynamic>{
    AUTH_STORE.isLoggedIn: false,
  };

  static Map<AUTH_STORE, dynamic> getAuthStore() {
    return authStore;
  }

  /// check if user is logged in or not
  static bool isUserLoggedIn() {
    return authStore[AUTH_STORE.isLoggedIn];
  }

  /// get [UserAuth]
  static UserAuth getUserAuthData() {
    return authStore[AUTH_STORE.userAuth];
  }

  static int getUserId() {
    return authStore[AUTH_STORE]?.id;
  }

  /// load [UserAuth] if saved in shared pref
  static Future<void> loadUserAuthData() async {
    final userString = (await prefs).get(USER_IDENTIFIER) ?? null;
    if (userString != null) {
      final userJson = json.decode(userString);
      updateUserSetting(
          userAuthData: UserAuth.fromJson(userJson), isLoggedIn: true);
    } else {
      return null;
    }
  }

  /// save [UserAuth] in shared pref
  static Future<bool> storeUserAuthData(UserAuth userAuthData) async {
    updateUserSetting(userAuthData: userAuthData, isLoggedIn: true);
    // converts to Map<String, dynamic>
    final userAuth = userAuthData.toJson();
    // converts Map<String, dynamic> to string type using jsonEncode()
    // and save in shared preference
    return (await prefs).setString(USER_IDENTIFIER, jsonEncode(userAuth));
  }

  static Future<bool> clearUserToken() async {
    updateUserSetting(clear: true);
    return (await prefs).remove(USER_IDENTIFIER);
  }

  static void updateUserSetting(
      {UserAuth userAuthData, bool isLoggedIn, bool clear: false}) async {
    if (userAuthData != null || clear) {
      authStore[AUTH_STORE.userAuth] = userAuthData;
    }

    if (isLoggedIn != null || clear) {
      authStore[AUTH_STORE.isLoggedIn] = isLoggedIn ?? false;
    }
  }
}
