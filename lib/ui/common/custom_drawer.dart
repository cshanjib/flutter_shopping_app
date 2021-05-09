import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/util/dialog_util.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _tile(PrefUtil.isUserLoggedIn() ? "Logout" : "Login",
              Icons.login_rounded,
              onPressed: () => _handleLogin(context)),
        ],
      ),
    );
  }

  _handleLogin(BuildContext context) {
    Navigator.of(context).pop();
    if (PrefUtil.isUserLoggedIn()) {
      context.read<AuthTokenCubit>().logout();
    } else {
      DialogUtil.openLoginPopup(context);
    }
  }

  Widget _tile(String title, IconData icon, {VoidCallback onPressed}) {
    return Column(
      children: [
        ListTile(
          dense: true,
          title: Row(
            children: [
              Icon(
                icon,
                color: ThemeColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(color: ThemeColor),
              ),
            ],
          ),
          onTap: onPressed,
        ),
        Divider(
          height: 0,
          thickness: 1,
          color: ThemeColor,
        )
      ],
    );
  }
}
