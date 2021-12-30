import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/responsive_builder.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (responsiveUtil) {
      return BlocBuilder<AuthTokenCubit, AuthTokenState>(
          builder: (context, state) {
        return state.isLoggedIn
            ? Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello ${state.auth.username}",
                      style: TextStyle(
                          fontSize: responsiveUtil.normalFontSize,
                          fontWeight: FontWeight.bold,
                          color: ThemeTextColor),
                    ),
                    SizedBox(
                      height: responsiveUtil.defaultSmallGap,
                    ),
                    Text(
                      "your daily foods are here!",
                      style: TextStyle(
                          fontSize: responsiveUtil.incremental(22),
                          color: ThemeTextColorLight),
                    ),
                    SizedBox(
                      height: responsiveUtil.defaultGap,
                    )
                  ],
                ),
              )
            : SizedBox.shrink();
      });
    });
  }
}
