import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';

typedef ResponsiveWidgetBuilder = Widget Function(ResponsiveUtil util);

class ResponsiveBuilder extends StatelessWidget {
  final BuildContext context;
  final Size size;

  final ResponsiveWidgetBuilder builder;
  const ResponsiveBuilder({Key key, this.context, this.size, this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(ResponsiveUtil(context: context, size: size));
  }
}
