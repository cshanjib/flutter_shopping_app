import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/helper/responsive_helper.dart';

class CategoryItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int themeColor;
  final ResponsiveHelper respHelper;

  CategoryItemCard(
      {Key key, this.title, this.imageUrl, this.themeColor, this.respHelper})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResponsiveHelper _respHelper =
        respHelper ?? ResponsiveHelper(context: context);
    final double _listHeight =
        _respHelper.value<double>(mobile: 80, tablet: 120, desktop: 160);
    return Container(
      height: _listHeight,
      width: _listHeight + 20,
      padding: EdgeInsets.all(_respHelper.incremental(6)),
      margin: EdgeInsets.symmetric(horizontal: _respHelper.incremental(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(themeColor)),
      child: Column(
        children: [
          Expanded(child: Image.network(imageUrl)),
          SizedBox(
            height: _respHelper.defaultSmallGap,
          ),
          Text(
            title ?? "Vegetables",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: _respHelper.normalFontSize,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
