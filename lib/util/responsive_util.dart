import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shopping_app/constant/dimensions.dart';

class ResponsiveUtil {
  final Size deviceSize;
  ResponsiveUtil({Size size, BuildContext context})
      : assert(context != null || size != null),
        deviceSize = size ?? MediaQuery.of(context).size;

  bool get isMobile => deviceSize.width <= WIDTH_MOBILE;

  bool get isDesktop => deviceSize.width >= WIDTH_DESKTOP;

  bool get isTablet =>
      deviceSize.width < WIDTH_DESKTOP && deviceSize.width > WIDTH_MOBILE;

  T value<T>({@required T mobile, T tablet, @required T desktop}) => isMobile
      ? mobile
      : isDesktop
          ? desktop
          : (tablet ?? mobile);

  double get optimalDeviceWidth => min(deviceSize.width, WIDTH_MAX_APP_WIDTH);

  double incremental(double mobile, {double factor}) => isMobile
      ? mobile
      : isDesktop
          ? mobile + (2 * factor)
          : mobile + factor;

  double get defaultSmallGap2 => value<double>(
      mobile: GAP_X_SMALL, desktop: GAP_XXX_NORMAL, tablet: GAP_SMALL);

  double get defaultSmallGap => isDesktop
      ? GAP_XXX_NORMAL
      : isMobile
          ? GAP_X_SMALL
          : GAP_SMALL;

  double get defaultGap => isDesktop
      ? GAP_NORMAL
      : isMobile
          ? GAP_XXX_SMALL
          : GAP_XX_SMALL;

  double get smallFontSize => isDesktop
      ? FONT_X_SMALL
      : isMobile
          ? FONT_XXX_SMALL
          : FONT_XX_SMALL;

  double get normalFontSize => isDesktop
      ? FONT_SMALL
      : isMobile
          ? FONT_XX_SMALL
          : FONT_X_SMALL;

  double get mediumFontSize => isDesktop
      ? FONT_NORMAL
      : isMobile
          ? FONT_X_SMALL
          : FONT_SMALL;

  double get largeFontSize => isDesktop
      ? FONT_LARGE
      : isMobile
          ? FONT_SMALL
          : FONT_NORMAL;
}

class RowOrColumn extends StatelessWidget {
  final List<Widget> children;

  final MainAxisAlignment rowMainAxisAlignment;
  final MainAxisSize rowMainAxisSize;
  final CrossAxisAlignment rowCrossAxisAlignment;

  final MainAxisAlignment columnMainAxisAlignment;
  final MainAxisSize columnMainAxisSize;
  final CrossAxisAlignment columnCrossAxisAlignment;

  final bool showRow;

  final bool intrinsicRow;

  const RowOrColumn(
      {Key key,
      this.intrinsicRow,
      this.rowMainAxisAlignment: MainAxisAlignment.start,
      this.rowMainAxisSize: MainAxisSize.max,
      this.rowCrossAxisAlignment: CrossAxisAlignment.center,
      this.columnMainAxisAlignment: MainAxisAlignment.start,
      this.columnMainAxisSize: MainAxisSize.max,
      this.columnCrossAxisAlignment: CrossAxisAlignment.center,
      this.showRow,
      this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showRow
        ? IntrinsicHeightIf(
            intrinsic: intrinsicRow,
            child: Row(
              children: children,
              mainAxisAlignment: rowMainAxisAlignment,
              crossAxisAlignment: rowCrossAxisAlignment,
              mainAxisSize: rowMainAxisSize,
            ),
          )
        : Column(
            children: children,
            crossAxisAlignment: columnCrossAxisAlignment,
            mainAxisAlignment: columnMainAxisAlignment,
            mainAxisSize: columnMainAxisSize,
          );
  }
}

class IntrinsicHeightIf extends StatelessWidget {
  final bool intrinsic;
  final Widget child;
  const IntrinsicHeightIf({Key key, this.intrinsic, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return intrinsic
        ? IntrinsicHeight(
            child: child,
          )
        : child;
  }
}

class ExpandedIf extends StatelessWidget {
  final bool expanded;
  final Widget child;
  final int flex;
  const ExpandedIf({Key key, this.expanded: true, this.child, this.flex: 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return expanded
        ? Expanded(
            child: child,
            flex: flex,
          )
        : child;
  }
}

class MouseRegionIf extends StatelessWidget {
  final bool addRegion;
  final Widget child;

  final PointerExitEventListener onExit;
  final PointerEnterEventListener onEnter;
  final PointerHoverEventListener onHover;
  final MouseCursor cursor;

  MouseRegionIf(
      {this.addRegion: true,
      this.child,
      this.onExit,
      this.onEnter,
      this.onHover,
      this.cursor,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return addRegion
        ? MouseRegion(
            cursor: cursor,
            onEnter: onEnter,
            onExit: onExit,
            onHover: onHover,
            child: child,
          )
        : child;
  }
}

class PaddingSwitch extends StatelessWidget {
  final bool switchIf;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets switchedPadding;

  PaddingSwitch(
      {this.switchIf: false,
      this.child,
      this.padding: EdgeInsets.zero,
      this.switchedPadding: EdgeInsets.zero,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: child,
      padding: switchIf ? switchedPadding : padding,
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    Key key,
    @required this.mobile,
    this.tablet,
    @required this.desktop,
  }) : super(key: key);

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
