import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class ItemCard extends StatelessWidget {
  final String image;
  final String title;
  final dynamic price;
  final String unit;
  const ItemCard({Key key, this.image, this.title, this.price, this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              image,
              height: 100,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(fontSize: 12, color: ThemeTextColor),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  "$price",
                  style: TextStyle(fontSize: 12, color: ThemeTextColor),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                    child: Text(
                  unit,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10, color: ThemeTextColorLight),
                )),
              ],
            ),
          ],
        ));
  }
}
