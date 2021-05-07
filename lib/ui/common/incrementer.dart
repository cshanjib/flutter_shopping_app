import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class Incrementer extends StatelessWidget {
  const Incrementer({
    Key key,
    this.setIncrementer,
    this.value: 1,
    this.maxVal: 50,
    this.minVal: 1,
  }) : super(key: key);

  final int minVal;
  final int maxVal;
  final int value;
  final Function(int) setIncrementer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ThemeTextColorLighter),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _incrementerWidget(add: false),
          SizedBox(
              width: 42,
              child: Text(
                this.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )),
          _incrementerWidget()
        ],
      ),
    );
  }

  Widget _incrementerWidget({add: true}) {
    return IconButton(
        onPressed: () {
          if (((add && value + 1 <= maxVal) || (!add && value - 1 >= minVal)) &&
              setIncrementer != null)
            setIncrementer(
                add ? min(value + 1, maxVal) : max(value - 1, minVal));
        },
        color: Colors.black,
        icon: Icon(add ? Icons.add : Icons.remove));
  }
}
