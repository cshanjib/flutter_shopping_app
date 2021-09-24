import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/auth/login/login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(body: LoginForm()),
      ),
    );
  }
}
