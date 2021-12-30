import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/base/app_wrapper.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_button.dart';
import 'package:flutter_shopping_app/ui/common/incrementer.dart';
import 'package:flutter_shopping_app/ui/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/util/dialog_util.dart';
import 'package:flutter_shopping_app/util/message_util.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';

class ItemDetail extends StatefulWidget {
  final ProductItem item;
  const ItemDetail({Key key, this.item}) : super(key: key);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int _numCartItems = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            AppWrapper(
              child: ListView(
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
                        label: Text("Go back")),
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
                  Text(widget.item.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                      itemCount: 5,
                      allowHalfRating: true,
                      direction: Axis.horizontal,
                      initialRating: min(widget.item.rating ?? 1, 5),
                      minRating: 1,
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (_) {}),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Incrementer(
                        value: _numCartItems,
                        setIncrementer: _updateCartCount,
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
                  Text(
                    "About the product",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.item.description ?? "",
                    style: TextStyle(fontSize: 14, color: ThemeTextColor),
                    textAlign: TextAlign.justify,
                  ),
                  if (widget.item.hasBenefits) _addItemBenefits(),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
            Align(
              child: _addToCardWidget(),
              alignment: Alignment.bottomCenter,
            )
          ],
        )),
      ),
    );
  }

  _addToCardWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(top: BorderSide(width: 1, color: ThemeTextColorLighter))),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          CustomButton(
            label: "Add to cart",
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
            onPressed: _addToCart,
          )
        ],
      ),
    );
  }

  _addToCart() {
    if (PrefUtil.isUserLoggedIn()) {
      //call the api to add the items to the cart
      MessageUtil.showSuccessMessage("Added to the cart successfully");
    } else {
      DialogUtil.openLoginPopup(context);
    }
  }

  _updateCartCount(count) {
    print(">>>hello");
    setState(() {
      _numCartItems = count;
    });
  }

  _goBack(context) {
    Navigator.of(context).pop();
  }

  _addItemBenefits() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Benefits",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
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
                        ),
                      )
                    ],
                  ),
                ))
      ],
    );
  }
}
