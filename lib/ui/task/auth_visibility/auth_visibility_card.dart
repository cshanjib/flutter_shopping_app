import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class AuthVisibilityCard extends StatelessWidget {
  final String title;
  final String description;

  const AuthVisibilityCard({Key key, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 2,
            thickness: 2,
            color: ThemeColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Text(description,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class AuthVisibilityExampleWidget extends StatelessWidget {
  const AuthVisibilityExampleWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthTokenCubit, AuthTokenState>(
        builder: (context, state) {
      return Column(
        children: [
          if (state.isLoggedIn)
            AuthVisibilityCard(
              title: "Widget 1",
              description:
                  "This widget will be visible only when the user is logged in to the app.",
            ),
          AuthVisibilityCard(
            title: "Widget 2",
            description:
                "This widget is always visible regardless of the user's login status.",
          ),
          if (state.isLoggedIn)
            AuthVisibilityCard(
              title: "Widget 3",
              description:
                  "This widget will be visible when the user is logged in and is replaced by widget4 on logout.",
            )
          else
            AuthVisibilityCard(
              title: "Widget 4",
              description:
                  "This widget will be visible when the user is not logged in and is replaced by widget3 on login.",
            ),
          if (!state.isLoggedIn)
            AuthVisibilityCard(
              title: "Widget 5",
              description:
                  "This widget will be visible only when the user is logged out.",
            ),
        ],
      );
    });
  }
}
