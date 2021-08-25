import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/item/bloc/product_item_cubit.dart';
import 'package:flutter_shopping_app/ui/item/item_card.dart';
import 'package:flutter_shopping_app/ui/item/item_loader_card.dart';
import 'package:get_it/get_it.dart';

class ItemList extends StatelessWidget {
  final ITEM_TYPE type;
  final double topMargin;
  const ItemList({Key key, this.topMargin: 10, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _wrapWithBloc((context, state) => Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, topMargin, 10, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(type != null ? describeEnum(type) : ""),
                  Text("view all")
                ],
              ),
            ),
            if (state.hasNoData)
              EmptyCard()
            else
              SizedBox(
                  height: 158,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.items.length +
                          (state.hasError
                              ? 1
                              : !state.init
                                  ? 4
                                  : state.loading
                                      ? 2
                                      : 0),
                      itemBuilder: (context, index) => index >= state.size
                          ? ItemLoaderCard(
                              errMsg: state.error,
                              retry: () => _retry(context),
                            )
                          : ItemCard(
                              item: state.items[index],
                              
                            ))),
          ],
        ));
  }

  _retry(BuildContext context) {
    context.read<ProductItemCubit>().loadProducts(type);
  }

  Widget _wrapWithBloc(
      Function(BuildContext context, ProductItemState state) callback) {
    return BlocProvider(
      create: (context) => GetIt.I.get<ProductItemCubit>()..loadProducts(type),
      child: BlocBuilder<ProductItemCubit, ProductItemState>(
        builder: (context, state) => callback(context, state),
      ),
    );
  }
}
