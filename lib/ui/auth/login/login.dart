import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/auth/login/bloc/login_cubit.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_button.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_text_field.dart';
import 'package:get_it/get_it.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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

  _successListener(BuildContext context, LoginState state) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) =>
          GetIt.I.get<LoginCubit>(param1: context.read<AuthTokenCubit>()),
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (context, state) => state.success,
        listener: _successListener,
        child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, bottom: 40, top: 20),
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
                          icon: Icon(Icons.close),
                          onPressed: () => _close(context)),
                    )
                  ],
                ),
                Divider(
                  height: 0,
                  thickness: 16,
                  color: ThemeTextColorLightest,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.login_rounded,
                          size: 50,
                          color: ThemeColor,
                        ),
                        label: Text(
                          "SHOP",
                          style: TextStyle(
                              fontSize: 30, color: ThemeTextColorLight),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomTextField(
                        placeholder: "Username",
                        controller: _usernameController,
                        enabled: !state.loading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: CustomTextField(
                        placeholder: "Password",
                        obscureText: !_isVisible,
                        enabled: !state.loading,
                        controller: _passwordController,
                        suffixIcon: IconButton(
                            icon: Icon(
                              _isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ThemeColor,
                            ),
                            onPressed: _toggleVisibility),
                      ),
                    ),
                    Align(
                      child: CustomButton(
                        label: "Login",
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                        onPressed: () => _login(context),
                        disabled: state.loading ||
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
                )
              ],
            ),
          );
        }),
      ),
    );
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

  _close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
