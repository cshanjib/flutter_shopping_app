import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/auth/login/login.dart';

abstract class DialogUtil {
  static Future openLoginPopup(BuildContext context,
      {bool dismissible: false}) {
    return showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext dialogContext) => WillPopScope(
              onWillPop: () async => dismissible,
              child: Dialog(
                insetPadding: EdgeInsets.all(10),
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: LoginForm(),
              ),
            ));
  }
}
