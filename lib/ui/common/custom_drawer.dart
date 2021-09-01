import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/util/dialog_util.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _tile(PrefUtil.isUserLoggedIn() ? "Log out" : "Login",
              Icons.login_rounded,
              onPressed: () => _login(context)),
        ],
      ),
    );
  }

  _login(BuildContext context) {
    Navigator.of(context).pop();
    if (PrefUtil.isUserLoggedIn()) {
      context.read<AuthTokenCubit>().clear();
    } else {
      DialogUtil.openLoginPopup(context);
    }
  }

  Widget _tile(String title, IconData icon, {VoidCallback onPressed}) {
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          title: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 10,
              ),
              Text(title),
            ],
          ),
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
