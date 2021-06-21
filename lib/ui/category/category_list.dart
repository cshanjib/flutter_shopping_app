import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/util/mock_util.dart';

class CategoryList extends StatelessWidget {
  final double topMargin;
  CategoryList({Key key, this.topMargin: 10}) : super(key: key);

  final List _categories = MockUtil.getCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          itemBuilder: (context, index) => CategoryItemCard(
            title: _categories[index]['title'],
            imageUrl: _categories[index]['imageUrl'],
            themeColor: _categories[index]['theme'],
          ),
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
        ),
      ),
    );
  }
}

class CategoryItemCard extends StatelessWidget {
  
  final String imageUrl;
  final String title;
  final int themeColor;

  const CategoryItemCard({Key key, this.imageUrl, this.title, this.themeColor})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 6),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(themeColor)),
      child: Column(
        children: [
          Expanded(child: Image.network(imageUrl)),
          SizedBox(height: 6,),
          Text(
            title,
            style: TextStyle(fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
