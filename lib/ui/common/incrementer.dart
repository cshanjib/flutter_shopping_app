import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class Incrementer extends StatelessWidget {
  final int minVal;
  final int maxVal;
  final int value;
  final Function(int) setIncrementer;

  const Incrementer(
      {Key key,
      this.minVal: 1,
      this.maxVal: 50,
      this.value: 1,
      this.setIncrementer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ThemeTextColorLighter),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          _incrementerWidget(add: false),
          SizedBox(
            width: 42,
            child: Text(
              this.value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          _incrementerWidget()
        ],
      ),
    );
  }

  Widget _incrementerWidget({add: true}) {
    return IconButton(
        icon: Icon(add ? Icons.add : Icons.remove),
        onPressed: () => setIncrementer(
            add ? min(value + 1, maxVal) : max(value - 1, minVal)));
  }
}
