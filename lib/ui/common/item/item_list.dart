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
            create: (context) => GetIt.instance.get<ProductItemCubit>()
              ..loadProducts(type: type),
            child: _ItemList(type)),
      ],
    );
  }

  _seeAll() {}
}

class _ItemList extends StatefulWidget {
  final ITEM_TYPE type;

  const _ItemList(this.type, {Key key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<_ItemList> {
  final int _pageOffset = 100;

  ScrollController _controller;
  ProductItemCubit _bloc;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
    _bloc = context.read<ProductItemCubit>();
  }

  _scrollListener() {
    //load the next page only if we have reached the end of the list minus offset
    //if we are not in loading state or error state
    //and if the list have next data to be fetched
    if (_controller.position.maxScrollExtent <=
            _controller.offset + _pageOffset &&
        !_bloc.state.loading &&
        !_bloc.state.hasError &&
        _bloc.state.pagedItem.hasNext) {
      _loadProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveHelper _respHelper = ResponsiveHelper(context: context);
    return SizedBox(
      height: _respHelper.value<double>(mobile: 164, desktop: 224, tablet: 194),
      child: BlocBuilder<ProductItemCubit, ProductItemState>(
          builder: (context, state) {
        if (state.hasNoData)
          return EmptyCard(
            responsiveHelper: _respHelper,
          );
        return ListView.builder(
          controller: _controller,
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
    );
  }

  _loadProducts() {
    _bloc.loadProducts(type: widget.type);
  }

  _retry(BuildContext context) {
    _loadProducts();
  }
}
