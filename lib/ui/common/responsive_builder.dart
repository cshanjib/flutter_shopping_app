import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';

typedef ResponsiveWidgetBuilder = Widget Function(ResponsiveUtil util);

class ResponsiveBuilder extends StatelessWidget {
  final Size size;
  final ResponsiveUtil util;

  final ResponsiveWidgetBuilder builder;
  const ResponsiveBuilder({Key key, this.size, this.builder, this.util})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(util ?? ResponsiveUtil(context: context, size: size));
  }
}
