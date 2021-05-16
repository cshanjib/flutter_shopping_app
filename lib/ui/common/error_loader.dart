import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/helper/responsive_helper.dart';

class ErrorLoaderCard extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double width;
  final String errorMsg;
  final VoidCallback retry;
  final ResponsiveHelper responsiveHelper;
  final Widget loadingContainer;

  bool get _hasError => errorMsg != null && errorMsg.isNotEmpty;

  const ErrorLoaderCard(
      {Key key,
      this.margin,
      this.padding,
      this.width,
      this.loadingContainer,
      this.errorMsg,
      this.retry,
      this.responsiveHelper})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResponsiveHelper _responsiveHelper =
        responsiveHelper ?? ResponsiveHelper(context: context);
    return Container(
      width: width,
      padding: padding ?? const EdgeInsets.all(10),
      margin: margin ?? EdgeInsets.all(_responsiveHelper.defaultGap),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(width: 1, color: ThemeTextColorLightest)),
      child: _hasError
          ? _errorContainer()
          : (loadingContainer ?? _loaderContainer(_responsiveHelper)),
    );
  }

  _loaderContainer(responsiveHelper) {
    return Container(
      color: ThemeTextColorLightest,
    );
  }

  _errorContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          errorMsg,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
        TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          onPressed: retry,
          child: Text('Retry'),
        )
      ],
    );
  }
}

class EmptyCard extends StatelessWidget {
  final String message;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final ResponsiveHelper responsiveHelper;

  const EmptyCard(
      {Key key, this.message, this.padding, this.responsiveHelper, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResponsiveHelper _responsiveHelper =
        responsiveHelper ?? ResponsiveHelper(context: context);
    return Container(
        padding: padding ?? const EdgeInsets.all(10),
        alignment: Alignment.center,
        margin: margin ?? EdgeInsets.all(_responsiveHelper.defaultGap),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ThemeTextColorLighter,
              width: 1,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.clear),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              message ?? "No data",
            ))
          ],
        ));
  }
}
