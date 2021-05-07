import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/common/item/bloc/product_item_cubit.dart';
import 'package:flutter_shopping_app/ui/common/item/item_card.dart';
import 'package:get_it/get_it.dart';

class ItemLoaderCard extends StatelessWidget {
  final String title;
  final double topMargin;
  final String errorMsg;
  final VoidCallback retry;

  bool get _hasError => errorMsg != null && errorMsg.isNotEmpty;

  const ItemLoaderCard(
      {Key key, this.title: "", this.topMargin: 10, this.errorMsg, this.retry})
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
          offset: Offset(0, 1), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: _hasError ? _errorContainer() : _loaderContainer(),
    );
  }

  _loaderContainer() {
    return Column(
      children: [
        Container(
          height: 100,
          color: ThemeTextColorLightest,
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 14,
          color: ThemeTextColorLightest,
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 12,
                color: ThemeTextColorLightest,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Container(
                height: 12,
                color: ThemeTextColorLightest,
              ),
            ),
          ],
        )
      ],
    );
  }

  _errorContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          errorMsg,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
        TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          onPressed: retry,
          child: Text('Retry'),
        )
      ],
    );
  }
}

class EmptyCard extends StatelessWidget {
  final String message;
  final EdgeInsets margin;

  const EmptyCard(
      {Key key,
      this.message,
      this.margin: const EdgeInsets.symmetric(horizontal: 10)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ThemeTextColorLighter,
              width: 1,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.clear),
            SizedBox(
              width: 10,
            ),
            Expanded(child: Text(message ?? "No data",))
          ],
        ));
  }
}
