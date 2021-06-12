import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/item/item_card.dart';

class ItemList extends StatelessWidget {
  final List items;
  final String title;
  final double topMargin;
  const ItemList({Key key, this.items, this.title, this.topMargin: 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, topMargin, 10, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title ?? "Items"),
              Text("view all")
            ],
          ),
        ),
        SizedBox(
            height: 158,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) => ItemCard(
                      image: items[index]['imageUrl'],
                      title: items[index]['name'],
                      price: items[index]['currency'],
                      unit: items[index]['sellingUnit'],
                    ))),
      ],
    );
  }
}
