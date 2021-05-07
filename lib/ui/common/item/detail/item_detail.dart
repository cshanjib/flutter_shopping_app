import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/form/custom_button.dart';
import 'package:flutter_shopping_app/ui/common/incrementer.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';

class ItemDetail extends StatefulWidget {
  final ProductItem item;

  const ItemDetail(this.item, {Key key}) : super(key: key);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int _noOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              ListView(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(ThemeColor)),
                        onPressed: () => _goBack(context),
                        icon: Icon(Icons.keyboard_arrow_left),
                        label: Text("Back")),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.network(
                    widget.item.imageUrl,
                    height: 300,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.item.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    initialRating: min(widget.item.rating ?? 0, 5),
                    minRating: 1,
                    itemSize: 20,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Incrementer(
                        setIncrementer: _updateCartCount,
                        value: _noOfItems,
                      ),
                      Text(
                        widget.item.price,
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("About the  Product",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.item.description ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeTextColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  if (widget.item.hasBenefits) _addItemBenefits(),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
              Align(
                child: _addToCartWidget(),
                alignment: Alignment.bottomCenter,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _addToCartWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(width: 1.0, color: ThemeTextColorLighter))),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.favorite_border)),
          CustomButton(
            label: "Add to cart",
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 60,
            ),
          ),
        ],
      ),
    );
  }

  Widget _addItemBenefits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text("Benefits",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        SizedBox(
          height: 10,
        ),
        ...List.generate(
          widget.item.benefits.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  widget.item.benefits[index],
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ThemeTextColor),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  _updateCartCount(int count) {
    setState(() {
      _noOfItems = count;
    });
  }
}
