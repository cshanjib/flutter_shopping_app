import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/dimension.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    Key key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
  }) : super(key: key);

  static double optimalDeviceWidth(BuildContext context) =>
      min(MediaQuery.of(context).size.width, WIDTH_MAX_APP_WIDTH);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= WIDTH_MOBILE;

  static bool isGreaterThanTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > WIDTH_TABLET;

  static bool isLessThanTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < WIDTH_TABLET;

  static bool isTablet(BuildContext context, {includeMobile: false}) =>
      MediaQuery.of(context).size.width < WIDTH_DESKTOP &&
      (MediaQuery.of(context).size.width > WIDTH_MOBILE || includeMobile);

  static bool isLessThanDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < WIDTH_DESKTOP;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= WIDTH_DESKTOP;

  static double responsiveValue(BuildContext context, desktop,
      {mobile, tablet}) {
    final double _width = MediaQuery.of(context).size.width;
    if (_width >= WIDTH_DESKTOP) {
      return desktop;
    } else if (_width > WIDTH_MOBILE) {
      return tablet ?? desktop ?? mobile;
    } else {
      return mobile ?? tablet ?? desktop;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= WIDTH_DESKTOP) {
          return desktop;
        } else if (constraints.maxWidth > WIDTH_MOBILE) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
