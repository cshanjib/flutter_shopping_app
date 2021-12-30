import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/ui/category/bloc/product_category_cubit.dart';
import 'package:flutter_shopping_app/ui/category/category_loader_card.dart';
import 'package:flutter_shopping_app/ui/category/category_item_card.dart';
import 'package:flutter_shopping_app/ui/common/top_title.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';
import 'package:get_it/get_it.dart';

class CategoryList extends StatefulWidget {
  final String title;
  final ResponsiveUtil responsiveUtil;
  CategoryList({Key key, this.responsiveUtil, this.title}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopTitle(
          title: widget.title ?? "All Categories",
          responsiveUtil: widget.responsiveUtil,
        ),
        _wrapWithBloc((context, state) {
          return state.hasNoData
              ? EmptyCard(responsiveUtil: widget.responsiveUtil)
              : SizedBox(
                  height: widget.responsiveUtil
                      .value<double>(mobile: 80, desktop: 120, tablet: 160),
                  child: ListView.builder(
                    itemBuilder: (context, index) => index >= state.size
                        ? CategoryLoaderCard(
                            responsiveUtil: widget.responsiveUtil,
                            errMsg: state.error,
                            retry: () => _retry(context),
                          )
                        : CategoryItemCard(
                            item: state.items[index],
                            responsiveUtil: widget.responsiveUtil),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.items.length +
                        (state.hasError
                            ? 1
                            : !state.init
                                ? 10
                                : state.loading
                                    ? 2
                                    : 0),
                  ));
        }),
      ],
    );
  }

  _retry(BuildContext context) {
    context.read<ProductCategoryCubit>().loadCategories();
  }

  Widget _wrapWithBloc(
      Function(BuildContext context, ProductCategoryState state) callback) {
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<ProductCategoryCubit>()..loadCategories(),
      child: BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
        builder: (context, state) => callback(context, state),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
