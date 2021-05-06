import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/common/item/bloc/product_item_cubit.dart';
import 'package:flutter_shopping_app/ui/common/item/item_card.dart';
import 'package:get_it/get_it.dart';

class ItemList extends StatelessWidget {
  final ITEM_TYPE type;
  final String title;
  final double topMargin;

  const ItemList(this.type, {Key key, this.title: "", this.topMargin: 10})
      : super(key: key);

  _seeAll() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, topMargin, 10, 4),
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
        BlocProvider<ProductItemCubit>(
          create: (context) =>
              GetIt.instance.get<ProductItemCubit>()..loadProducts(type: type),
          child: SizedBox(
            height: 158,
            child: BlocBuilder<ProductItemCubit, ProductItemState>(
                builder: (context, state) {
              return ListView.builder(
                itemBuilder: (context, index) => ItemCard(
                  item: state.items[index],
                ),
                itemCount: state.items.length,
                scrollDirection: Axis.horizontal,
              );
            }),
          ),
        ),
      ],
    );
  }
}
