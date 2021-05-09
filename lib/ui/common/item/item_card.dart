import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/common/item/detail/item_detail.dart';
import 'package:flutter_shopping_app/util/dialog_util.dart';

class ItemCard extends StatelessWidget {
  final ProductItem item;

  const ItemCard({Key key, this.item}) : super(key: key);

  _goToDetailPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemDetail(item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToDetailPage(context),
      hoverColor: Colors.transparent,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 1), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Image.network(
              item.imageUrl,
              height: 100,
            ),
            Align(
              child: Text(
                item.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(item.price,
                    style: TextStyle(fontSize: 12, color: ThemeTextColor)),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    item.sellingUnit,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10, color: ThemeTextColorLight),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
