import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/common/item/item_card.dart';

class ItemList extends StatelessWidget {
  final List<ProductItem> items;
  final String title;

  const ItemList(this.items, {Key key, this.title: ""}) : super(key: key);

  _seeAll() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              InkWell(
                child: Text("see all"),
                onTap: _seeAll,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 158,
          child: ListView.builder(
            itemBuilder: (context, index) => ItemCard(
              item: items[index],
            ),
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
