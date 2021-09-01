import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/common/custom_loader.dart';
import 'package:flutter_shopping_app/ui/common/custom_toast_message.dart';

class MessageUtil {
  static CancelFunc _loadingCancelFunc;
  static void _show(String message, {bool success: true}) {
    BotToast.showCustomNotification(
        toastBuilder: (context) => CustomToastMessage(
              message: message,
              error: !success,
            ));
  }

  static void showSuccessMessage(String message) {
    _show(message);
  }

  static void showErrorMessage(String message) {
    _show(message, success: false);
  }

  static void showLoading({String message: 'loading'}) {
    if (_loadingCancelFunc == null)
      _loadingCancelFunc = BotToast.showCustomLoading(
          toastBuilder: (context) => CustomLoader(
                label: message,
              ),
          backgroundColor: Colors.black.withOpacity(.3));
  }

  static void hideLoading() {
    if (_loadingCancelFunc != null) {
      _loadingCancelFunc();
      _loadingCancelFunc = null;
    }
  }
}
