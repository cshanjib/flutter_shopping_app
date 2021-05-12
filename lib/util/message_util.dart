import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class MessageUtil {
  static CancelFunc loadingCancelFunc;

  static void _show(String message, {bool error}) {
    BotToast.showCustomNotification(
        toastBuilder: (context) =>
            _CustomMessage(message: message, error: error),
        duration: Duration(seconds: 4),
        align: const Alignment(0, -0.99));
  }

  static void showSuccessMessage(String message) {
    _show(message, error: false);
  }

  static void showErrorMessage(String message) {
    _show(message, error: true);
  }

  static void showLoading({String message: 'loading...'}) {
    if (loadingCancelFunc == null)
      loadingCancelFunc = BotToast.showCustomLoading(
          backgroundColor: Colors.black.withOpacity(.3),
          toastBuilder: (context) => _LoaderOverlay(label: message));
  }

  static void hideLoading() {
    if (loadingCancelFunc != null) {
      loadingCancelFunc();
      loadingCancelFunc = null;
    }
  }
}

class _LoaderOverlay extends StatelessWidget {
  final String label;

  _LoaderOverlay({this.label: "Please wait..."});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please wait",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ThemeTextColorLight),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: ThemeTextColor,
                    )),
                SizedBox(
                  width: 16,
                ),
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: ThemeTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomMessage extends StatelessWidget {
  final bool error;
  final String message;

  _CustomMessage({
    @required this.message,
    this.error: true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: error ? Colors.redAccent : ThemeColor,
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(error ? Icons.info : Icons.error, color: Colors.white,),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
