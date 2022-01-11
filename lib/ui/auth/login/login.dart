import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/constant/dimensions.dart';
import 'package:flutter_shopping_app/ui/auth/login/bloc/login_cubit.dart';
import 'package:flutter_shopping_app/ui/auth/login/login_form_content.dart';
import 'package:flutter_shopping_app/ui/auth/login/login_icon.dart';
import 'package:flutter_shopping_app/ui/auth/login/login_title.dart';
import 'package:flutter_shopping_app/ui/common/responsive_builder.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';
import 'package:get_it/get_it.dart';

class LoginForm extends StatelessWidget {
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
          return ResponsiveBuilder(builder: (responsiveUtil) {
            return Container(
              constraints: BoxConstraints(maxWidth: WIDTH_TABLET),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LoginTitle(),
                      Divider(
                        height: 0,
                        thickness: 16,
                        color: ThemeTextColorLightest,
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: SingleChildScrollView(
                        child: RowOrColumn(
                          intrinsicRow: true,
                          showRow: !responsiveUtil.isMobile,
                          children: [
                            ExpandedIf(
                              child: LoginIcon(
                                util: responsiveUtil,
                              ),
                              expanded: !responsiveUtil.isMobile,
                              flex: 2,
                            ),
                            ExpandedIf(
                              child: LoginFormContent(
                                state: state,
                              ),
                              expanded: !responsiveUtil.isMobile,
                              flex: 3,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        }),
      ),
    );
  }
}
