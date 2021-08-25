import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/bored/bloc/bored_cubit.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_button.dart';
import 'package:get_it/get_it.dart';

class BoredCard extends StatelessWidget {
  const BoredCard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<BoredCubit>()..loadBoredItem(),
      child: BlocBuilder<BoredCubit, BoredState>(builder: (context, state) {
        return _BoredCard(
          state: state,
        );
      }),
    );
  }
}

class _BoredCard extends StatelessWidget {
  final BoredState state;

  const _BoredCard({Key key, this.state}) : super(key: key);

  _reloadContent(BuildContext context) {
    context.read<BoredCubit>().loadBoredItem();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1))
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: DecoratedBox(
                decoration: BoxDecoration(color: ThemeColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    state.loading ? '...' : state.entry.type,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Text(
              "Are you Bored ?",
              style: TextStyle(
                  fontSize: 14,
                  color: ThemeTextColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              state.loading ? "..." : state.entry.activity,
              style: TextStyle(fontSize: 26, color: ThemeTextColorLight),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _actionItem("difficulty",
                    value:
                        state.loading ? null : (1-state.entry.accessibility)),
                _actionItem("price",
                    value: state.loading ? null : state.entry.price),
                _actionItem("refresh",
                    top: Icon(
                      Icons.refresh,
                      color: ThemeColor,
                      size: 30,
                    ),
                    onPressed: () => _reloadContent(context),
                    disabled: state.loading),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _actionItem(String text,
      {double value, onPressed, Widget top, disabled: false}) {
    return CustomButton(
      backgroundColor: Colors.grey[50],
      disabled: disabled,
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Column(
        children: [
          top ??
              SizedBox(
                child: CircularProgressIndicator(
                  value: value,
                  backgroundColor: ThemeColor,
                ),
                height: 30,
                width: 30,
              ),
          SizedBox(
            height: 6,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                color: ThemeTextColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
