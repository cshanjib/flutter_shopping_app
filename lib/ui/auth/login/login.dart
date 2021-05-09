import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/form/custom_button.dart';
import 'package:flutter_shopping_app/ui/common/form/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 40, top: 20),
                  child: Text(
                    "Login to the app",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ThemeTextColorLight),
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 16,
                  color: ThemeTextColorLightest,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextButton.icon(
                      icon: Icon(
                        Icons.login_rounded,
                        size: 50,
                        color: ThemeColor,
                      ),
                      label: Text(
                        "SHOP",
                        style: TextStyle(fontSize: 30),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: CustomTextField(
                    placeholder: "Username",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: CustomTextField(
                    placeholder: "Password",
                  ),
                ),
                CustomButton(
                  label: "Login",
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: ThemeColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Forgot password?",
                  style: TextStyle(color: ThemeTextColorLight),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: IconButton(
              icon: Icon(Icons.close), onPressed: () => _close(context)),
          top: 10,
          right: 10,
        )
      ],
    );
  }

  _close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
