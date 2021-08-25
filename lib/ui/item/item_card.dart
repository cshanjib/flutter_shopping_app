import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/item/item_detail.dart';

class ItemCard extends StatelessWidget {

  final ProductItem item;
  const ItemCard({Key key,this.item})
      : super(key: key);

  _goToDetailsPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ItemDetail(item: item,)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToDetailsPage(context),
      child: Container(
          width: 120,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            )
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Image.network(
                item.imageUrl,
                height: 100,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.name,
                  style: TextStyle(fontSize: 12, color: ThemeTextColor),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    item.price,
                    style: TextStyle(fontSize: 12, color: ThemeTextColor),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    item.sellingUnit,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10, color: ThemeTextColorLight),
                  )),
                ],
              ),
            ],
          )),
    );
  }
}
