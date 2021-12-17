import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 40, top: 20),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "Login to the app",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ThemeColorLight),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 4,
          child: IconButton(
              icon: Icon(Icons.close), onPressed: () => _close(context)),
        )
      ],
    );
  }

  _close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
