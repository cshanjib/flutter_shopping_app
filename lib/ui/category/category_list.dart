import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/category/category_item_card.dart';
import 'package:flutter_shopping_app/util/mock_util.dart';
import 'package:flutter_shopping_app/ui/category/data/model/category_item.dart';

class CategoryList extends StatelessWidget {
  final String title;

  CategoryList({Key key, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> _category = MockUtil.getMockAppCategories();
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _category.length,
        itemBuilder: (context, index) => CategoryItemCard(
          title: _category[index].title,
          imageUrl: _category[index].imageUrl,
          themeColor: _category[index].theme,
        ),
      ),
    );
  }
}
