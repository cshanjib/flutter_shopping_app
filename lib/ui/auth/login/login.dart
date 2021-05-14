import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/constant/dimension.dart';
import 'package:flutter_shopping_app/ui/auth/login/bloc/login_cubit.dart';
import 'package:flutter_shopping_app/helper/responsive_helper.dart';
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
    final ResponsiveHelper _responsiveHelper =
        ResponsiveHelper(context: context);
    return BlocProvider<LoginCubit>(
      create: (context) =>
          GetIt.I.get<LoginCubit>(param1: context.read<AuthTokenCubit>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: _listenEvents,
        child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          return Stack(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: WIDTH_TABLET),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _AppLoginTitle(),
                      RowOrColumn(
                        intrinsicRow: true,
                        showRow: !_responsiveHelper.isMobile,
                        children: [
                          ExpandedIf(
                            expanded: !_responsiveHelper.isMobile,
                            child: _AppIcon(_responsiveHelper),
                            flex: 2,
                          ),
                          ExpandedIf(
                            expanded: !_responsiveHelper.isMobile,
                            child: _LoginForm(
                              usernameController: _usernameController,
                              passwordController: _passwordController,
                              isPasswordVisible: _isVisible,
                              state: state,
                              toggleVisibility: _toggleVisibility,
                              userData: _userData,
                            ),
                            flex: 3,
                          )
                        ],
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

  _close(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class _LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final LoginState state;
  final bool isPasswordVisible;
  final VoidCallback toggleVisibility;
  final Map userData;

  const _LoginForm(
      {Key key,
      this.usernameController,
      this.passwordController,
      this.state,
      this.isPasswordVisible,
      this.toggleVisibility,
      this.userData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: CustomTextField(
            placeholder: "Username",
            enabled: !state.loading,
            controller: usernameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: CustomTextField(
            placeholder: "Password",
            enabled: !state.loading,
            controller: passwordController,
            obscureText: !isPasswordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: ThemeColor,
              ),
              onPressed: toggleVisibility,
            ),
          ),
        ),
        CustomButton(
          label: "Login",
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
          onPressed: () => _login(context),
          disabled: state.loading || !_isUsernameValid() || !_isPasswordValid(),
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
    );
  }

  _login(BuildContext context) {
    context
        .read<LoginCubit>()
        .login(userData["username"], userData["password"]);
  }

  bool _isUsernameValid() {
    return userData["username"].isNotEmpty;
  }

  bool _isPasswordValid() {
    return userData["password"].isNotEmpty;
  }
}

class _AppIcon extends StatelessWidget {
  final ResponsiveHelper _responsiveHelper;

  const _AppIcon(ResponsiveHelper responsiveHelper, {Key key})
      : _responsiveHelper = responsiveHelper,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _clipBackground(
      clip: !_responsiveHelper.isMobile,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _bagHandle(),
          Container(
            color: ThemeColorLighter,
            height: 150,
            width: 150,
            child: TextButton.icon(
                icon: Icon(
                  Icons.login_rounded,
                  size: 50,
                  color: ThemeColor,
                ),
                label: Text(
                  "SHOP",
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }

  _clipBackground({Widget child, clip: false}) {
    return clip
        ? ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              child: child,
              decoration: BoxDecoration(
                  color: ThemeTextColorLightest,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20))),
              padding: EdgeInsets.symmetric(vertical: 100),
            ),
          )
        : Align(
            child: child,
          );
  }

  _bagHandle(
      {double height: 40,
      double handleWidth: 10,
      handleColor: ThemeColor,
      bgColor: ThemeTextColorLightest}) {
    return Container(
      decoration: BoxDecoration(
          color: handleColor,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(height / 2))),
      child: Container(
        margin: EdgeInsets.fromLTRB(handleWidth, handleWidth, handleWidth, 0),
        height: height,
        width: height * 2,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(height / 2))),
      ),
    );
  }
}

class _AppLoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        )
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(
          size.width / 1.2, size.height / 2, size.width, size.height)
      ..lineTo(size.width, size.height) // Add line p2p3
      ..lineTo(0, size.height) // Add line p2p3
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
