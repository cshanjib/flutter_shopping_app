import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/category/data/models/category_item.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';

class CategoryItemCard extends StatelessWidget {
  final CategoryItem item;
  final ResponsiveUtil responsiveUtil;

  const CategoryItemCard({Key key, this.item, this.responsiveUtil})
      : super(key: key);

  Widget build(BuildContext context) {
    final double _listHeight =
        responsiveUtil.value(mobile: 80, desktop: 160, tablet: 120);
    return Container(
      width: _listHeight + 20,
      height: _listHeight,
      padding: EdgeInsets.symmetric(horizontal: responsiveUtil.incremental(6)),
      margin: EdgeInsets.symmetric(horizontal: responsiveUtil.incremental(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(item.theme)),
      child: Column(
        children: [
          Expanded(child: Image.network(item.imageUrl)),
          SizedBox(
            height: responsiveUtil.defaultSmallGap,
          ),
          Text(
            item.title,
            style: TextStyle(fontSize: responsiveUtil.normalFontSize),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
