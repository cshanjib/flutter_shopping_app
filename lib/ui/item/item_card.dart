import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/item/item_detail.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';

class ItemCard extends StatelessWidget {
  final ProductItem item;
  final ResponsiveUtil responsiveUtil;
  const ItemCard({Key key, this.item, this.responsiveUtil}) : super(key: key);

  _goToDetailsPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemDetail(
                  item: item,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToDetailsPage(context),
      child: Container(
          width: responsiveUtil.value<double>(
              mobile: 120, desktop: 200, tablet: 160),
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(
              horizontal: responsiveUtil.defaultSmallGap, vertical: 2),
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
                height: responsiveUtil.value<double>(
                    mobile: 100, desktop: 140, tablet: 120),
              ),
              SizedBox(
                height: responsiveUtil.incremental(4, factor: 4),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.name,
                  style: TextStyle(
                      fontSize: responsiveUtil.normalFontSize,
                      color: ThemeTextColor),
                ),
              ),
              SizedBox(
                height: responsiveUtil.incremental(4),
              ),
              Row(
                children: [
                  Text(
                    item.price,
                    style: TextStyle(
                        fontSize: responsiveUtil.normalFontSize,
                        color: ThemeTextColor),
                  ),
                  SizedBox(
                    width: responsiveUtil.incremental(4),
                  ),
                  Expanded(
                      child: Text(
                    item.sellingUnit,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: responsiveUtil.smallFontSize,
                        color: ThemeTextColorLight),
                  )),
                ],
              ),
            ],
          )),
    );
  }
}
