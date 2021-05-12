import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthTokenCubit, AuthTokenState>(
        builder: (context, state) {
      return state.isLoggedIn
          ? Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello ${state.auth.username},",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: ThemeTextColor),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "your daily goods are here!",
                    style: TextStyle(fontSize: 22, color: ThemeTextColorLight),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            )
          : SizedBox.shrink();
    });
  }
}
