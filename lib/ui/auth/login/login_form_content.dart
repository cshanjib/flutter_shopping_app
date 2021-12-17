import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/auth/login/bloc/login_cubit.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_button.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_text_field.dart';

class LoginFormContent extends StatefulWidget {
  final LoginState state;
  const LoginFormContent({this.state, Key key}) : super(key: key);

  @override
  _LoginFormContentState createState() => _LoginFormContentState();
}

class _LoginFormContentState extends State<LoginFormContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomTextField(
            placeholder: "Username",
            controller: _usernameController,
            enabled: !widget.state.loading,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: CustomTextField(
            placeholder: "Password",
            obscureText: !_isVisible,
            enabled: !widget.state.loading,
            controller: _passwordController,
            suffixIcon: IconButton(
                icon: Icon(
                  _isVisible ? Icons.visibility : Icons.visibility_off,
                  color: ThemeColor,
                ),
                onPressed: _toggleVisibility),
          ),
        ),
        Align(
          child: CustomButton(
            label: "Login",
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            onPressed: () => _login(context),
            disabled: widget.state.loading ||
                !_isUsernameValid() ||
                !_isPasswordValid(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Align(
          child: Text(
            "Don't have an account? Sign up",
            style: TextStyle(color: ThemeColor),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          child: Text(
            "Forgot password?",
            style: TextStyle(color: ThemeTextColorLight),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  final _userData = {"username": "", "password": ""};
  bool _isVisible = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _usernameController
        .addListener(() => _setValue("username", _usernameController));
    _passwordController
        .addListener(() => _setValue("password", _passwordController));
  }

  _setValue(key, TextEditingController controller) {
    if (_userData[key] != controller.text.trim()) {
      setState(() {
        _userData[key] = controller.text.trim();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  bool _isUsernameValid() {
    return _userData["username"].isNotEmpty;
  }

  bool _isPasswordValid() {
    return _userData["password"].isNotEmpty;
  }

  _login(BuildContext context) {
    context
        .read<LoginCubit>()
        .login(_userData['username'], _userData['password']);
  }

  _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
}
