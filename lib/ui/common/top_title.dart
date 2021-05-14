import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/helper/responsive_helper.dart';

class TopTitle extends StatelessWidget {
  final String title;
  final double topMargin;
  final VoidCallback onPressed;
  final ResponsiveHelper responsiveHelper;

  const TopTitle(this.responsiveHelper,
      {Key key, this.title, this.topMargin, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          responsiveHelper.defaultGap,
          topMargin ?? responsiveHelper.defaultGap,
          responsiveHelper.defaultGap,
          responsiveHelper.defaultSmallGap),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: responsiveHelper.mediumFontSize,
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            child: Text("see all",
                style: TextStyle(
                    fontSize: responsiveHelper.normalFontSize,
                    fontWeight: FontWeight.bold)),
            onTap: onPressed,
          ),
        ],
      ),
    );
  }
}
