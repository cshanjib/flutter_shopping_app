import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/helper/responsive_helper.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/common/item/detail/item_detail.dart';

class ItemCard extends StatelessWidget {
  final ProductItem item;
  final ResponsiveHelper responsiveHelper;

  const ItemCard({Key key, this.item, this.responsiveHelper}) : super(key: key);

  _goToDetailPage(context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ItemDetail(item)),
    // );

    Navigator.pushNamed(context, '/items/${item.id}', arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToDetailPage(context),
      hoverColor: Colors.transparent,
      child: Container(
        width: responsiveHelper.value<double>(
            mobile: 120, desktop: 200, tablet: 160),
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
            horizontal: responsiveHelper.defaultSmallGap, vertical: 2),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(width: 1, color: ThemeTextColorLightest)),
        child: Column(
          children: [
            Image.network(
              item.imageUrl,
              height: responsiveHelper.value<double>(
                  mobile: 100, desktop: 140, tablet: 120),
            ),
            SizedBox(
              height: responsiveHelper.incremental(4, increment: 4),
            ),
            Align(
              child: Text(
                item.name,
                style: TextStyle(
                    fontSize: responsiveHelper.normalFontSize,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: responsiveHelper.incremental(4),
            ),
            Row(
              children: [
                Text(item.price,
                    style: TextStyle(
                        fontSize: responsiveHelper.normalFontSize,
                        color: ThemeTextColor)),
                SizedBox(
                  width: responsiveHelper.incremental(4),
                ),
                Expanded(
                  child: Text(
                    item.sellingUnit,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: responsiveHelper.smallFontSize,
                        color: ThemeTextColorLight),
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
