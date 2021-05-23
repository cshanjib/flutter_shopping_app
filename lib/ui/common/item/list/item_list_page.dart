import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/helper/responsive_helper.dart';
import 'package:flutter_shopping_app/ui/common/base/app_wrapper.dart';
import 'package:flutter_shopping_app/ui/common/item/bloc/product_item_cubit.dart';
import 'package:flutter_shopping_app/ui/common/item/item_card.dart';
import 'package:flutter_shopping_app/ui/common/item/item_loader.dart';
import 'package:get_it/get_it.dart';

class ItemListLocation extends BeamLocation {
  ItemListLocation({BeamState state}) : super(state);

  @override
  List<String> get pathBlueprints => ['/trending', '/featured', '/topSelling'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final ITEM_TYPE _itemListType =
        state.pathBlueprintSegments.contains('trending')
            ? ITEM_TYPE.trending
            : state.pathBlueprintSegments.contains('featured')
                ? ITEM_TYPE.featured
                : ITEM_TYPE.topSelling;
    return [
      BeamPage(
        key: ValueKey('item-${describeEnum(_itemListType)}'),
        title: 'Items',
        child: ItemListPage(_itemListType),
      )
    ];
  }
}

class ItemListPage extends StatelessWidget {
  final ITEM_TYPE type;

  const ItemListPage(this.type, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
                centerTitle: false,
                title: Text(describeEnum(type)),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => _goBack(context),
                ),
                elevation: 0),
            body: BlocProvider<ProductItemCubit>(
                create: (context) =>
                    GetIt.I.get<ProductItemCubit>()..loadProducts(type: type),
                child: AppWrapper(child: _ItemListPage(type)))),
      ),
    );
  }

  _goBack(BuildContext context) {
    if (context.canBeamBack) {
      context.beamBack();
    } else {
      context.beamToNamed('/');
    }
  }
}

class _ItemListPage extends StatefulWidget {
  final ITEM_TYPE type;

  const _ItemListPage(this.type, {Key key}) : super(key: key);

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<_ItemListPage> {
  final int _pageOffset = 100;

  ScrollController _controller;
  ProductItemCubit _bloc;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
    _bloc = context.read<ProductItemCubit>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    return BlocBuilder<ProductItemCubit, ProductItemState>(
        builder: (context, state) {
      if (state.hasNoData)
        return EmptyCard(
          responsiveHelper: _respHelper,
        );
      return GridView.builder(
          padding: EdgeInsets.all(_respHelper.defaultGap),
          controller: _controller,
          itemCount: state.hasError
              ? state.size + 1
              : !state.init
                  ? _getOptimalCrossAxisCount(context, _respHelper)
                  : state.loading
                      ? state.size + 2
                      : state.size,
          itemBuilder: (BuildContext context, int index) {
            if (index >= state.size)
              return ItemLoaderCard(
                errorMsg: state.error,
                retry: () => _retry(context),
                responsiveHelper: _respHelper,
              );
            else
              return ItemCard(
                item: state.items[index],
                responsiveHelper: _respHelper,
              );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: _respHelper.isDesktop
                ? 1.1
                : _respHelper.isTablet()
                    ? 1
                    : 1.4,
            crossAxisCount: _getOptimalCrossAxisCount(context, _respHelper),
            mainAxisSpacing: _respHelper.defaultSmallGap,
            crossAxisSpacing: 0,
          ));
    });
  }

  int _getOptimalCrossAxisCount(
      BuildContext context, ResponsiveHelper _respHelper) {
    return _respHelper.isDesktop
        ? 4
        : _respHelper.isTablet()
            ? 3
            : 2;
  }

  _loadProducts() {
    _bloc.loadProducts(type: widget.type);
  }

  _retry(BuildContext context) {
    _loadProducts();
  }
}
