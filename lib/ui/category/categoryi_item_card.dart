import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/category/data/models/category_item.dart';

class CategoryItemCard extends StatelessWidget {
  final CategoryItem item;

  const CategoryItemCard({Key key, this.item}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 6),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(item.theme)),
      child: Column(
        children: [
          Expanded(child: Image.network(item.imageUrl)),
          SizedBox(
            height: 6,
          ),
          Text(
            item.title,
            style: TextStyle(fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
