import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_button.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';

class ItemLoaderCard extends StatelessWidget {
  final String errMsg;
  final VoidCallback retry;
  final ResponsiveUtil responsiveUtil;

  bool get _hasError => errMsg != null && errMsg.isNotEmpty;

  const ItemLoaderCard({Key key, this.errMsg, this.retry, this.responsiveUtil})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          responsiveUtil.value<double>(mobile: 120, desktop: 200, tablet: 160),
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
          horizontal: responsiveUtil.defaultSmallGap, vertical: 2),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.5), offset: Offset(0, 1))
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: _hasError ? _errorContainer() : _loaderContainer(),
    );
  }

  _errorContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          errMsg,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: responsiveUtil.normalFontSize, color: Colors.red),
        ),
        CustomButton(
          onPressed: retry,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          label: 'Retry',
          backgroundColor: Colors.red,
        )
      ],
    );
  }

  _loaderContainer() {
    return Column(
      children: [
        Container(
          height: responsiveUtil.value<double>(
              mobile: 100, desktop: 140, tablet: 120),
          color: ThemeTextColorLightest,
        ),
        SizedBox(
          height: responsiveUtil.incremental(4, factor: 4),
        ),
        Container(
          height: 14,
          color: ThemeTextColorLightest,
        ),
        SizedBox(
          height: responsiveUtil.incremental(4),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 12,
                color: ThemeTextColorLightest,
              ),
            ),
            SizedBox(
              width: responsiveUtil.incremental(4),
            ),
            Expanded(
              child: Container(
                height: 12,
                color: ThemeTextColorLightest,
              ),
            )
          ],
        )
      ],
    );
  }
}

class EmptyCard extends StatelessWidget {
  final String message;
  final EdgeInsets margin;
  final ResponsiveUtil responsiveUtil;

  const EmptyCard({Key key, this.message, this.margin, this.responsiveUtil})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(responsiveUtil.defaultGap),
      alignment: Alignment.center,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ThemeColorLighter, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.clear),
          SizedBox(
            width: responsiveUtil.defaultGap,
          ),
          Expanded(
            child: Text(
              message ?? "No data",
              style: TextStyle(fontSize: responsiveUtil.normalFontSize),
            ),
          )
        ],
      ),
    );
  }
}
