import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/category/category_item_card.dart';

class CategoryList extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int themeColor;
  final List<Map> _appCategory = [
    {
      "title": "Fruits",
      "imageUrl":
      "https://i.pinimg.com/originals/fa/07/04/fa0704ba240c7b884b9b7ee94157fb7d.png",
      "theme": 0xFFF9E3FD
    },
    {
      "title": "Vegetables",
      "imageUrl":
      "https://www.pngjoy.com/pngl/123/2510559_funny-emoji-apple-emoji-broccoli-png-download.png",
      "theme": 0xFFE9FBE5
    },
    {
      "title": "Dairy",
      "imageUrl":
      "https://cdn.iconscout.com/icon/free/png-256/cheese-1806482-1534540.png",
      "theme": 0xFFFEFFE5
    },
    {
      "title": "Meat",
      "imageUrl":
      "https://img.icons8.com/emoji/452/cut-of-meat-emoji.png",
      "theme": 0xFFFCEFEB
    },
    {
      "title": "Vegetables",
      "imageUrl":
      "https://i.pinimg.com/originals/fa/07/04/fa0704ba240c7b884b9b7ee94157fb7d.png",
      "theme": 0xFFF9E3FD
    },
    {
      "title": "Dairy",
      "imageUrl":
      "https://cdn.iconscout.com/icon/free/png-256/cheese-1806482-1534540.png",
      "theme": 0xFFFEFFE5
    },
    {
      "title": "Meat",
      "imageUrl":
      "https://img.icons8.com/emoji/452/cut-of-meat-emoji.png",
      "theme": 0xFFFCEFEB
    }
  ];

  CategoryList({Key key, this.title, this.imageUrl, this.themeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _appCategory.length,
        itemBuilder: (context, index) => CategoryItemCard(
          title: _appCategory[index]["title"],
          imageUrl: _appCategory[index]["imageUrl"],
          themeColor: _appCategory[index]["theme"],
        ),
      ),
    );
  }
}
