import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/carousel/custom_carousel.dart';
import 'package:flutter_shopping_app/ui/category/category_list.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_text_field.dart';
import 'package:flutter_shopping_app/ui/item/item_list.dart';
import 'package:flutter_shopping_app/util/mock_util.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomTextField(
          prefixIcon: Icon(
            Icons.search,
            color: ThemeColor,
          ),
          placeholder: "Search",
        ),
        CategoryList(),
        CustomCarousel(),
        ItemList(items: MockUtil.getTrendingItems(), title: "Trending",),
        ItemList(items: MockUtil.getFeaturedItems(), title: "Feature",),
        ItemList(items: MockUtil.getTopSellingItems(), title: "Top Selling",),
      ],
    );
  }
}
