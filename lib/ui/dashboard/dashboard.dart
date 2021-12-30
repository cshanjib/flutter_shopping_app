import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/carousel/custom_carousel.dart';
import 'package:flutter_shopping_app/ui/category/category_list.dart';
import 'package:flutter_shopping_app/ui/common/base/app_wrapper.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_text_field.dart';
import 'package:flutter_shopping_app/ui/common/responsive_builder.dart';
import 'package:flutter_shopping_app/ui/dashboard/user_info.dart';
import 'package:flutter_shopping_app/ui/item/item_list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (rUtil) {
      return AppWrapper(
        child: ListView(
          children: [
            UserInfoCard(),
            SizedBox(
              height: rUtil.defaultGap,
            ),
            CustomTextField(
              prefixIcon: Icon(
                Icons.search,
                color: ThemeColor,
              ),
              placeholder: "Search",
            ),
            CategoryList(responsiveUtil: rUtil),
            CustomCarousel(
              responsiveUtil: rUtil,
            ),
            ItemList(type: ITEM_TYPE.trending, responsiveUtil: rUtil),
            ItemList(
              type: ITEM_TYPE.featured,
              responsiveUtil: rUtil,
            ),
            ItemList(type: ITEM_TYPE.topSelling),
            ItemList(
              type: ITEM_TYPE.featured,
              responsiveUtil: rUtil,
            ),
            ItemList(
              type: ITEM_TYPE.featured,
              responsiveUtil: rUtil,
            ),
            ItemList(
              type: ITEM_TYPE.featured,
              responsiveUtil: rUtil,
            ),
            ItemList(
              type: ITEM_TYPE.featured,
              responsiveUtil: rUtil,
            ),
            ItemList(
              type: ITEM_TYPE.featured,
              responsiveUtil: rUtil,
            ),
          ],
        ),
      );
    });
  }
}
