import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_button.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';

class CategoryLoaderCard extends StatelessWidget {
  final String errMsg;
  final VoidCallback retry;
  final ResponsiveUtil responsiveUtil;

  bool get _hasError => errMsg != null && errMsg.isNotEmpty;

  const CategoryLoaderCard(
      {Key key, this.errMsg, this.retry, this.responsiveUtil})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _listHeight =
        responsiveUtil.value(mobile: 80, desktop: 160, tablet: 120);
    return Container(
      width: _listHeight + 20,
      height: _listHeight,
      padding: EdgeInsets.all(responsiveUtil.incremental(6)),
      margin: EdgeInsets.symmetric(horizontal: responsiveUtil.incremental(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeTextColorLightest),
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
    return SizedBox.shrink();
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
