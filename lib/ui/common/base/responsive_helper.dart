import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RowOrColumn extends StatelessWidget {
  final bool showRow;
  final bool intrinsicRow;
  final List<Widget> children;
  final MainAxisAlignment rowMainAxisAlignment;
  final MainAxisSize rowMainAxisSize;
  final CrossAxisAlignment rowCrossAxisAlignment;

  final MainAxisAlignment columnMainAxisAlignment;
  final MainAxisSize columnMainAxisSize;
  final CrossAxisAlignment columnCrossAxisAlignment;

  RowOrColumn({
    this.showRow: true,
    this.intrinsicRow: false,
    Key key,
    this.children,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnMainAxisSize = MainAxisSize.max,
    this.columnCrossAxisAlignment = CrossAxisAlignment.center,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowMainAxisSize = MainAxisSize.max,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showRow
        ? _intrinsicHeightWrap(
            intrinsicRow,
            child: Row(
              children: children,
              mainAxisAlignment: rowMainAxisAlignment,
              crossAxisAlignment: rowCrossAxisAlignment,
              mainAxisSize: rowMainAxisSize,
            ),
          )
        : Column(
            children: children,
            mainAxisAlignment: columnMainAxisAlignment,
            crossAxisAlignment: columnCrossAxisAlignment,
            mainAxisSize: columnMainAxisSize,
          );
  }

  Widget _intrinsicHeightWrap(bool wrap, {child}) {
    return wrap
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

  ExpandedIf({this.expanded: true, this.child, Key key, this.flex: 1}) : super(key: key);

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
