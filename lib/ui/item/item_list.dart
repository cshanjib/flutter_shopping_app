import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/common/responsive_builder.dart';
import 'package:flutter_shopping_app/ui/common/top_title.dart';
import 'package:flutter_shopping_app/ui/item/bloc/product_item_cubit.dart';
import 'package:flutter_shopping_app/ui/item/item_card.dart';
import 'package:flutter_shopping_app/ui/item/item_loader_card.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';
import 'package:get_it/get_it.dart';

class ItemList extends StatefulWidget {
  final ITEM_TYPE type;
  final double topMargin;
  final ResponsiveUtil responsiveUtil;
  const ItemList({Key key, this.topMargin: 10, this.type, this.responsiveUtil})
      : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        util: widget.responsiveUtil,
        builder: (responsiveUtil) {
          return _wrapWithBloc((context, state) => Column(
                children: [
                  TopTitle(
                    title: widget.type != null
                        ? describeEnum(widget.type).toUpperCase()
                        : "",
                    responsiveUtil: responsiveUtil,
                  ),
                  if (state.hasNoData)
                    EmptyCard(responsiveUtil: responsiveUtil)
                  else
                    SizedBox(
                        height: responsiveUtil.value<double>(
                            mobile: 164, desktop: 222, tablet: 194),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.items.length +
                                (state.hasError
                                    ? 1
                                    : !state.init
                                        ? 10
                                        : state.loading
                                            ? 2
                                            : 0),
                            itemBuilder: (context, index) => index >= state.size
                                ? ItemLoaderCard(
                                    errMsg: state.error,
                                    responsiveUtil: responsiveUtil,
                                    retry: () => _retry(context),
                                  )
                                : ItemCard(
                                    responsiveUtil: responsiveUtil,
                                    item: state.items[index],
                                  ))),
                ],
              ));
        });
  }

  _retry(BuildContext context) {
    context.read<ProductItemCubit>().loadProducts(widget.type);
  }

  Widget _wrapWithBloc(
      Function(BuildContext context, ProductItemState state) callback) {
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<ProductItemCubit>()..loadProducts(widget.type),
      child: BlocBuilder<ProductItemCubit, ProductItemState>(
        builder: (context, state) => callback(context, state),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
