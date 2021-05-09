import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/auth/login/bloc/login_cubit.dart';
import 'package:flutter_shopping_app/ui/common/form/custom_button.dart';
import 'package:flutter_shopping_app/ui/common/form/custom_text_field.dart';
import 'package:get_it/get_it.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isVisible = false;

  final _userData = {"username": "", "password": ""};

  @override
  void initState() {
    _usernameController
        .addListener(() => _setValue("username", _usernameController));
    _passwordController
        .addListener(() => _setValue("password", _passwordController));
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _setValue(key, TextEditingController controller) {
    if (_userData[key] != controller.text.trim()) {
      setState(() {
        _userData[key] = controller.text.trim();
      });
    }
  }

  _listenEvents(BuildContext context, LoginState state) {
    if (state.success) {
      _close(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) =>
          GetIt.I.get<LoginCubit>(param1: context.read<AuthTokenCubit>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: _listenEvents,
        child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
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
                        padding:
                            const EdgeInsets.only(left: 8, bottom: 40, top: 20),
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
                          enabled: !state.loading,
                          controller: _usernameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: CustomTextField(
                          placeholder: "Password",
                          enabled: !state.loading,
                          controller: _passwordController,
                          obscureText: !_isVisible,
                          suffixIcon: IconButton(
                            icon: Icon(_isVisible
                                ? Icons.visibility
                                : Icons.visibility_off, color: ThemeColor,),
                            onPressed: _toggleVisibility,
                          ),
                        ),
                      ),
                      CustomButton(
                        label: "Login",
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                        onPressed: () => _login(context),
                        disabled: state.loading ||
                            !_isUsernameValid() ||
                            !_isPasswordValid(),
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
        }),
      ),
    );
  }

  _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  _login(BuildContext context) {
    context
        .read<LoginCubit>()
        .login(_userData["username"], _userData["password"]);
  }

  bool _isUsernameValid() {
    return _userData["username"].isNotEmpty;
  }

  bool _isPasswordValid() {
    return _userData["password"].isNotEmpty;
  }

  _close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
