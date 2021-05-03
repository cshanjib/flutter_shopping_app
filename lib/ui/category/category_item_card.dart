import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int themeColor;

  CategoryItemCard({Key key, this.title, this.imageUrl, this.themeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 80,
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(themeColor)),
      child: Column(
        children: [
          Expanded(child: Image.network(imageUrl)),
          SizedBox(
            height: 6,
          ),
          Text(
            title ?? "Vegetables",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, ),
          ),
        ],
      ),
    );
  }
}
