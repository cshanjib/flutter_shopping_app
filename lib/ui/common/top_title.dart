import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';

class TopTitle extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;
  final ResponsiveUtil responsiveUtil;
  const TopTitle({Key key, this.title, this.onViewAll, this.responsiveUtil})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          responsiveUtil.defaultGap,
          responsiveUtil.defaultGap,
          responsiveUtil.defaultGap,
          responsiveUtil.defaultSmallGap),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: responsiveUtil.normalFontSize,
            ),
          ),
          InkWell(
              onTap: onViewAll,
              child: Text(
                "view all",
                style: TextStyle(
                    fontSize: responsiveUtil.normalFontSize,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
