import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Widget child;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color disabledColor;
  final VoidCallback onPressed;
  final bool disabled;

  bool get _disabled => disabled || onPressed == null;

  const CustomButton(
      {Key key,
      this.label,
      this.onPressed,
      this.disabled: false,
      this.child,
      this.backgroundColor: ThemeColor,
      this.disabledColor: ThemeTextColorLightest,
      this.padding: const EdgeInsets.all(20)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        // minimumSize: Size(88, 44),
        padding: padding,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        backgroundColor: _disabled ? disabledColor : backgroundColor,
      ),
      onPressed: _disabled ? null : onPressed,
      child: child ??
          Text(
            label ?? "",
            style: TextStyle(color: Colors.white),
          ),
    );
  }
}
