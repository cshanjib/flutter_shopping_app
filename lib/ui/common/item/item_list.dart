import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/helper/responsive_helper.dart';
import 'package:flutter_shopping_app/ui/common/item/bloc/product_item_cubit.dart';
import 'package:flutter_shopping_app/ui/common/item/item_card.dart';
import 'package:flutter_shopping_app/ui/common/item/item_loader.dart';
import 'package:flutter_shopping_app/ui/common/top_title.dart';
import 'package:get_it/get_it.dart';

class ItemList extends StatelessWidget {
  final ITEM_TYPE type;
  final String title;

  const ItemList(this.type, {Key key, this.title: ""}) : super(key: key);

  _seeAll() {}

  @override
  Widget build(BuildContext context) {
    final ResponsiveHelper _respHelper = ResponsiveHelper(context: context);
    return Column(
      children: [
        TopTitle(
          _respHelper,
          title: title ?? "Items",
          onPressed: _seeAll,
        ),
        BlocProvider<ProductItemCubit>(
          create: (context) =>
              GetIt.instance.get<ProductItemCubit>()..loadProducts(type: type),
          child: SizedBox(
            height: _respHelper.value<double>(
                mobile: 164, desktop: 224, tablet: 194),
            child: BlocBuilder<ProductItemCubit, ProductItemState>(
                builder: (context, state) {
              if (state.hasNoData)
                return EmptyCard(
                  responsiveHelper: _respHelper,
                );
              return ListView.builder(
                itemBuilder: (context, index) => index >= state.items.length
                    ? ItemLoaderCard(
                        errorMsg: state.error,
                        retry: () => _retry(context),
                        responsiveHelper: _respHelper,
                      )
                    : ItemCard(
                        item: state.items[index],
                        responsiveHelper: _respHelper,
                      ),
                itemCount: !state.init
                    ? 4
                    : state.hasError
                        ? state.items.length + 1
                        : state.loading
                            ? state.items.length + 2
                            : state.items.length,
                scrollDirection: Axis.horizontal,
              );
            }),
          ),
        ),
      ],
    );
  }

  _retry(BuildContext context) {
    context.read<ProductItemCubit>().loadProducts(type: type);
  }
}
